package com.tf.commons.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tf.mapper.MyFileMapper;
import com.tf.model.MyFile;

@Component
public class ZipUtils {
	
private static final int  BUFFER_SIZE = 2 * 1024;
	
	@Autowired
	private MyFileMapper myFileMapper;

	private  static ZipUtils zipUtils; 

	 @PostConstruct 
	 public void init() { 
		 zipUtils = this;
		 zipUtils.myFileMapper = this.myFileMapper;
	 } 
	
	/**
	 * 压缩成ZIP 方法1
	 * @param srcDir 压缩文件夹路径 
	 * @param out    压缩文件输出流
	 * @param fileName  压缩文件名
	 * @param KeepDirStructure  是否保留原来的目录结构,true:保留目录结构; 
	 * 							false:所有文件跑到压缩包根目录下(注意：不保留目录结构可能会出现同名文件,会压缩失败)
	 * @throws RuntimeException 压缩失败会抛出运行时异常
	 */
	public static void toZip(String srcDir, OutputStream out, String fileName, boolean KeepDirStructurem)
			throws RuntimeException{
		ZipOutputStream zos = null;
		try {
			zos = new ZipOutputStream(out);
			File sourceFile = new File(srcDir);
			compress(sourceFile, zos, fileName, KeepDirStructurem);
		} catch (Exception e) {
			throw new RuntimeException("zip error from ZipUtils",e);
		}finally{
			if(zos != null){
				try {
					zos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 压缩成ZIP 方法2
	 * @param srcFiles 需要压缩的文件列表
	 * @param out 	        压缩文件输出流
	 * @throws RuntimeException 压缩失败会抛出运行时异常
	 */
	public static void toZip(List<File> srcFiles , OutputStream out)throws RuntimeException {
		long start = System.currentTimeMillis();
		ZipOutputStream zos = null ;
		try {
			zos = new ZipOutputStream(out);
			for (File srcFile : srcFiles) {
				byte[] buf = new byte[BUFFER_SIZE];
				zos.putNextEntry(new ZipEntry(srcFile.getName()));
				int len;
				FileInputStream in = new FileInputStream(srcFile);
				while ((len = in.read(buf)) != -1){
					zos.write(buf, 0, len);
				}
				zos.closeEntry();
				in.close();
			}
			long end = System.currentTimeMillis();
			System.out.println("压缩完成，耗时：" + (end - start) +" ms");
		} catch (Exception e) {
			throw new RuntimeException("zip error from ZipUtils",e);
		}finally{
			if(zos != null){
				try {
					zos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 递归压缩方法
	 * @param sourceFile 源文件
	 * @param zos		 zip输出流
	 * @param name		 压缩后的名称
	 * @param KeepDirStructure  是否保留原来的目录结构,true:保留目录结构; 
	 * 							false:所有文件跑到压缩包根目录下(注意：不保留目录结构可能会出现同名文件,会压缩失败)
	 * @throws Exception
	 */
	private static void compress(File sourceFile, ZipOutputStream zos, String name,
			boolean KeepDirStructure) throws Exception{
		byte[] buf = new byte[BUFFER_SIZE];
		if(sourceFile.isFile()){
			// 向zip输出流中添加一个zip实体，构造器中name为zip实体的文件的名字
			zos.putNextEntry(new ZipEntry(name));
			// copy文件到zip输出流中
			int len;
			FileInputStream in = new FileInputStream(sourceFile);
			while ((len = in.read(buf)) != -1){
				zos.write(buf, 0, len);
			}
			// Complete the entry
			zos.closeEntry();
			in.close();
		} else {
			File[] listFiles = sourceFile.listFiles();
			if(listFiles == null || listFiles.length == 0){
				// 需要保留原来的文件结构时,需要对空文件夹进行处理
				if(KeepDirStructure){
					// 空文件夹的处理
					zos.putNextEntry(new ZipEntry(name + "/")); 
					// 没有文件，不需要文件的copy
					zos.closeEntry();
				}
			}else {
				for (File file : listFiles) {
					// 判断是否需要保留原来的文件结构
					if (KeepDirStructure) {
						// 注意：file.getName()前面需要带上父文件夹的名字加一斜杠,
						// 不然最后压缩包中就不能保留原来的文件结构,即：所有文件都跑到压缩包根目录下了
						compress(file, zos, name + "/" + file.getName(),KeepDirStructure);
					} else {
						compress(file, zos, file.getName(),KeepDirStructure);
					}
				}
			}
		}
	}
	
	/**
	 * 下载目录结构
	 * @param myfile 文件实体类
	 * @param response   
	 * 
	 * @throws RuntimeException 压缩失败会抛出运行时异常
	 */
	public void downloadZip(MyFile myfile, HttpServletResponse response, String fileBasePath){
		String fileName = new Date().getTime()+"";
		//String dirPath = "C:/home/" + fileName;
		//String zipPath = "C:/home/" + fileName + ".zip";
		String dirPath = fileBasePath + fileName;
		String zipPath = fileBasePath + fileName + ".zip";
		try {
			//手动创建目录结构
			File filePth = new File(dirPath);
			if (!filePth.exists()) {
				filePth.mkdirs();
			}
			this.createDirStructure(myfile, dirPath);
			//把目录结构压缩为zip
			FileOutputStream out = new FileOutputStream(new File(zipPath));
			toZip(dirPath, out, myfile.getName(), true);
			//下载zip
			downloadZipFile(zipPath, myfile, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			//删除手动创建的目录结构
			if(dirPath != ""){
				boolean flag = deleteDir(new File(dirPath));
				//删除压缩的zip
				if(flag){
					new File(zipPath).delete();
				}
			}
		}  
	}
	
	
	/**
     * 手动创建目录结构
     * @return  
     */
    public void createDirStructure(MyFile myfile, String dirPath) {
    	try{
    		List<MyFile> fileList = zipUtils.myFileMapper.queryFileByParentId(myfile.getId(), "0");
    		if(fileList != null && fileList.size() > 0){
    			for(MyFile file : fileList){
    				if("adir".equals(file.getType())){
        				//手动创建目录结构
        				File filePth = new File(dirPath + "\\" + file.getName());
        				if (!filePth.exists()) {
        					filePth.mkdirs();
        				}
        				this.createDirStructure(file, (dirPath + "\\" + file.getName()));
            		}else{
            			//复制文件
            			Files.copy(Paths.get(file.getLocation()), Paths.get(dirPath + "\\" + file.getName()), StandardCopyOption.REPLACE_EXISTING);
            		}
    			}
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    /**
     * 下载zip
     * 
     * @return  
     */
    public static void downloadZipFile(String zipPath, MyFile myfile, HttpServletResponse response) {
    	try{
	    	File file = new File(zipPath);  
	        response.setCharacterEncoding("UTF-8");  
	        response.setHeader("Content-Disposition",  
	                "attachment; filename=" + new String(myfile.getName().getBytes("ISO8859-1"), "UTF-8")+".zip");  
	        response.setContentLength((int) file.length());  
	        response.setContentType("application/zip");// 定义输出类型  
	        FileInputStream fis = new FileInputStream(file);  
	        BufferedInputStream buff = new BufferedInputStream(fis);  
	        byte[] b = new byte[1024];// 相当于我们的缓存  
	        long k = 0;// 该值用于计算当前实际下载了多少字节  
	        OutputStream myout = response.getOutputStream();// 从response对象中得到输出流,准备下载  
	        // 开始循环下载  
	        while (k < file.length()) {  
	            int j = buff.read(b, 0, 1024);  
	            k += j;  
	            myout.write(b, 0, j);  
	        }  
	        myout.flush();  
	        buff.close();  
	    } catch (Exception e) {  
	        e.printStackTrace();
	    }
    }
    
	/**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return boolean 
     */
    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
	
//	public static void main(String[] args) throws Exception {
//		/** 测试压缩方法1  */
//		FileOutputStream fos1 = new FileOutputStream(new File("c:/mytest01.zip"));
//		ZipUtils.toZip("D:/log", fos1,true);
//		
//		/** 测试压缩方法2  */
//		List<File> fileList = new ArrayList<>();
//		fileList.add(new File("D:/Java/jdk1.7.0_45_64bit/bin/jar.exe"));
//		fileList.add(new File("D:/Java/jdk1.7.0_45_64bit/bin/java.exe"));
//		FileOutputStream fos2 = new FileOutputStream(new File("c:/mytest02.zip"));
//		ZipUtils.toZip(fileList, fos2);
//	}
	
}
