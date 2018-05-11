package com.tf.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.tf.commons.base.BaseController;
import com.tf.commons.result.PageInfo;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.DownloadSupport;
import com.tf.commons.utils.FileStorage;
import com.tf.commons.utils.JsonUtils;
import com.tf.commons.utils.StringUtils;
import com.tf.commons.utils.UploadHelper;
import com.tf.commons.utils.ZipUtils;
import com.tf.model.MyFile;
import com.tf.model.ShareDiskInfo;
import com.tf.model.ShareOrg;
import com.tf.model.ShareUser;
import com.tf.service.IMyFileService;
import com.tf.service.IShareDiskInfoService;
import com.tf.service.IShareOrgService;
import com.tf.service.IShareUserService;

@Controller
@RequestMapping("/myFile")
public class MyFileController extends BaseController{

	private static final String FILEBASEPATH = FileStorage.getFilePath();

	@Autowired
	private IMyFileService fileService;
	@Autowired
	private IShareOrgService shareOrgService;
	@Autowired
	private IShareUserService shareUserService;
	@Autowired
	private IShareDiskInfoService shareDiskInfoService;

	/**
	 * 列出文件夹的内的所有子文件
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Object listFiles(long id, String pwd) {
		List<MyFile> myFiles = fileService.listFiles(id);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
	}

	/**
	 * 列出某个机构所有子文件
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/orgByFileList")
	@ResponseBody
	public Object queryOrgFiles(long orgId, long id) {
		List<MyFile> myFiles = shareOrgService.queryOrgFiles(orgId, id);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
	}

	/**
	 * 查询处室共享的列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getOfficeShareList")
	@ResponseBody
	public Object getOfficeShareList(long id, long treeRootId) {
		List<MyFile> myFiles = fileService.getOfficeShareList(id, treeRootId);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
	}
	
	/**
	 * 查询个人共享的列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getPersonalShareList")
	@ResponseBody
	public Object getPersonalShareList(long id, long treeRootId) {
		List<MyFile> myFiles = fileService.getPersonalShareList(id, treeRootId);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
	}
	
	/**
	 * 查询空间共享的列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSpaceFileList")
	@ResponseBody
	public Object getSpaceFileList(long id, long treeRootId) {
		List<MyFile> myFiles = fileService.getSpaceFileList(id, treeRootId);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
	}
	
	
	/**
     * 跳转删除文件的列表
     *
     * @return
     */
    @GetMapping("/delFileList")
    public String delFileList() {
        return "admin/delfilelist";
    }
	
	/**
	 * 查询删除文件的列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getDeleteFileList")
	@ResponseBody
	public Object getDeleteFileList(MyFile myfile, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(myfile.getName())) {
            condition.put("name", myfile.getName());
        }
        pageInfo.setCondition(condition);
        fileService.selectDataGrid(pageInfo);
        return pageInfo;
	}

	/**
	 * 新建文件夹
	 * 
	 * @param folderId
	 * @return
	 */
	@RequestMapping("/mkdir/{folderId}/{filecreatetype}")
	@ResponseBody
	public String mkdir(@PathVariable long folderId, String folderName, @PathVariable String filecreatetype) {
		return fileService.mkdir(folderId, folderName, filecreatetype);
	}

	/**
	 * 上传文件
	 * 
	 * @param request
	 * @param folderid
	 * @return
	 */
	@RequestMapping(value="/upload/{folderid}/{filecreatetype}",method = RequestMethod.POST)
	@ResponseBody
	public String upload(HttpServletRequest request, @PathVariable long folderid, @PathVariable String filecreatetype) throws Exception {
		UploadHelper utils = new UploadHelper();
		MultipartFile file = utils.getFiles(request).get(0);

		String result = "fail";
		String fileName = file.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();

		MyFile myFile = new MyFile();
		myFile.setUser_id(user.getId());
		myFile.setSize(file.getSize());

		// TODO:是否有足够的空间
		// if (MyDiskInfoDao.isEnoughSpace(myFile)) {
		MyFile folder = fileService.queryFile(folderid);
		//String filePath = "C:/home/" + new Date().getTime() + "." + suffix;
		String filePath = FILEBASEPATH + new Date().getTime() + "." + suffix;
		
		try {
			// 路径是否存在
			File filePth = new File(FILEBASEPATH);
			if (!filePth.exists()) {
				filePth.mkdirs();
			}
			utils.upload(file, filePath);// 文件没有成功保存返回失败信息

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			myFile.setCreateDate(sdf.format(new Date()));
			myFile.setName(fileName);
			myFile.setFilecreatetype(filecreatetype);
			myFile.setParent_id(folderid);
			myFile.setType(suffix.toLowerCase());
			myFile.setPath(folder.getPath() + folderid + "/");
			myFile.setLocation(filePath);
			myFile.setIsShare(0);
			myFile.setDescription("");

			fileService.insert(myFile);

			ShareDiskInfo diskInfo = null;
			if("0".equals(filecreatetype)){
				diskInfo = shareDiskInfoService.getUserDiskInfo("O"+user.getOrgId());
			}else{
				diskInfo = shareDiskInfoService.getUserDiskInfo(user.getId().toString());
			}
			long usedSize = (diskInfo.getUsedsize() == null ? (long) 0 : diskInfo.getUsedsize()) + file.getSize();
			long fileNumber = diskInfo.getFilenumber() != null ? diskInfo.getFilenumber() : 0 + 1;
			if (Math.ceil(usedSize / 1048576) > diskInfo.getTotalsize()) {
				throw new Exception("空间不足");
			}
			diskInfo.setUsedsize(usedSize);
			diskInfo.setFilenumber(fileNumber);
			shareDiskInfoService.updateAllColumnById(diskInfo);

			EntityWrapper<MyFile> wrapper = new EntityWrapper<MyFile>();
			wrapper.setEntity(myFile);
			MyFile selectOne = fileService.selectOne(wrapper);
			// 把新的已用空间复制给selectOne
			selectOne.setUsedSize(usedSize);
			selectOne.setTotalSize(diskInfo.getTotalsize());
			// TODO: 同步网盘信息
			// MyDiskInfo diskInfo = MyDiskInfoDao.load(user.getId());
			// session.setAttribute("diskInfo", diskInfo);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("file", selectOne);
			// data.put("usedSize", diskInfo.getUsedSize());
			result = JsonUtils.toJson(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// }
		return result;
	}
	 
	
	@RequestMapping(value="/uploadFolder/{folderid}/{filecreatetype}",method=RequestMethod.POST)  
    @ResponseBody  
    public String uploadFileFolder(HttpServletRequest request,String[] fileNames, @PathVariable long folderid, @PathVariable String filecreatetype) throws Exception {  
		UploadHelper utils = new UploadHelper();
        MultipartHttpServletRequest params=((MultipartHttpServletRequest) request);   
        List<MultipartFile> files = params.getFiles("fileFolder");
        
        String result = "fail";
        // 获取当前用户
 		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        //定义变量,记录上传文件的size
 		long uploadFileSize = 0l;
 		for (MultipartFile multipartFile : files) {
 			uploadFileSize = uploadFileSize + multipartFile.getSize();
		}
 		//比较共享存储空间大小,是否超出最大范围
 		ShareDiskInfo diskInfo = null;
		if("0".equals(filecreatetype)){
			diskInfo = shareDiskInfoService.getUserDiskInfo("O"+user.getOrgId());
		}else{
			diskInfo = shareDiskInfoService.getUserDiskInfo(user.getId().toString());
		}
		long usedSize = (diskInfo.getUsedsize() == null ? uploadFileSize : (diskInfo.getUsedsize()) + uploadFileSize);
		long fileNumber = diskInfo.getFilenumber() == null ? files.size() : (diskInfo.getFilenumber()  + files.size());
		if (Math.ceil(usedSize / 1048576) > diskInfo.getTotalsize()) {
			throw new Exception("当前用户磁盘空间不足");
		}
		diskInfo.setUsedsize(usedSize);
		diskInfo.setFilenumber(fileNumber);
		shareDiskInfoService.updateAllColumnById(diskInfo);
 		//存储父节点的name,用于判断是否存在
 		List<String> parentNameList = new ArrayList<>();
 		//存储父节点的id,用于子节点寻找父节点的id
		List<Long> parentIdList = new ArrayList<>();
 		//遍历集合和数组,进行文件上传
		for (int i = 0; i < fileNames.length; i++) {
 			MyFile myFile = new MyFile();
 			//获得前台上传的每一个文件
        	MultipartFile multipartFile = files.get(i);
        	//每一个文件对应的位置
        	String filePosition = fileNames[i];
        	String fileFolder = filePosition.substring(0,filePosition.lastIndexOf("/")+1);
        	//获取文件名
        	String originalFilename = multipartFile.getOriginalFilename();
        	//截取文件后缀名
        	String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        	//拼接上传的路径
        	MyFile folder = fileService.queryFile(folderid);
        	String filePath = FILEBASEPATH +fileFolder+ new Date().getTime() + "." + suffix;
        	//String filePath = FILEBASEPATH +fileFolder+ originalFilename;
        	//String filePath = "C:/home/" +fileFolder+ new Date().getTime() + "." + suffix;
        	//判断文件夹是否存在
        	File filePth = new File(FILEBASEPATH);
			if (!filePth.exists()) {
				filePth.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//新增上传文件夹的根目录
			String[] fileArray = filePosition.split("/");
			for(int j = 0; j < fileArray.length; j++){
				String name = fileArray[j];
				//判断文件名中是否包含“.”以确定是否为文件或者是文件夹
				boolean flag = name.contains(".");
				if(!parentNameList.contains(name+j) || flag){
					myFile.setUser_id(user.getId());
					myFile.setCreateDate(sdf.format(new Date()));
					myFile.setName(name);
					myFile.setFilecreatetype(filecreatetype);
					if(j == 0){
						myFile.setParent_id(folderid);
						myFile.setPath(folder.getPath() + folderid + "/");
					}else{
						int index = parentNameList.indexOf(fileArray[j-1]+(j-1));
						Long parentid = parentIdList.get(index);
						myFile.setParent_id(parentid);
						//上传文件夹的子文件或者子文件夹的path
						MyFile file = fileService.selectById(parentid);
						myFile.setPath(file.getPath() + parentid + "/");
					}
					
					if(!flag){
						myFile.setType("adir");
						myFile.setSize(0);
						//记录保存为文件夹时，需要手动获取其保存路径
						String pathTem = filePath.substring(0, filePath.lastIndexOf(name+"/")+name.length());
						myFile.setLocation(pathTem);
					}else{
						myFile.setType(suffix.toLowerCase());
						myFile.setSize(multipartFile.getSize());
						myFile.setLocation(filePath);
					}
					myFile.setIsShare(0);
					myFile.setDescription("");
					//插入
					fileService.insert(myFile);
					
					parentNameList.add(name+j);
					parentIdList.add(myFile.getId());
				}
			}
			//复制文件
			utils.upload(multipartFile, filePath);// 文件没有成功保存返回失败信息
 		}
		MyFile selectOne = fileService.selectById(parentIdList.get(0));
		selectOne.setUsedSize(usedSize);
		selectOne.setTotalSize(diskInfo.getTotalsize());
		result = JsonUtils.toJson(selectOne);
        return result;  
    }  
	
	/**
	 * 重命名
	 * 
	 * @param fileId
	 * @param fileName
	 * @return
	 */
	@RequestMapping("/rename/{fileId}")
	@ResponseBody
	public String rename(@PathVariable long fileId, String fileName) {
		boolean result = fileService.reName(fileId, fileName);
		return result ? "success" : "fail";
	}

	/**
	 * 删除文件（或文件夹），返回删除文件后的网盘容量
	 * 
	 * @param fileId
	 * @return
	 */
	@RequestMapping("/delete/{fileId}")
	@ResponseBody
	public String delete(@PathVariable long fileId, String pwd) {
		return fileService.deleteFileOrFolder(fileId);
	}
	
	/**
	 * 还原删除文件（或文件夹），返回还原删除文件后的网盘容量
	 * 
	 * @param fileId
	 * @return
	 */
	@RequestMapping("/restore")
	@ResponseBody
	public Object restore(String fileId) {
		 fileService.restoreFileOrFolder(Long.parseLong(fileId));
		 return renderSuccess("还原成功！");
	}

	/**
	 * 下载文件
	 * 
	 * @param fileId
	 * @param response
	 */
	@RequestMapping("/download/{fileId}")
	public void download(@PathVariable long fileId, HttpServletResponse response) {
		MyFile myFile = fileService.selectById(fileId);
		DownloadSupport.download(response, myFile);
	}
	
	/**
	 * 下载文件夹
	 * 
	 * @param fileId
	 * @param response
	 */
	@RequestMapping("/downloadFile/{fileId}")
	public void downloadFile(@PathVariable long fileId, HttpServletResponse response){
		MyFile myFile = fileService.selectById(fileId);
		ZipUtils zipUtils = new ZipUtils();
		zipUtils.downloadZip(myFile, response, FILEBASEPATH);
	}

	/**
	 * 预览文件
	 * 
	 * @param fileId
	 * @param response
	 */
	@RequestMapping("/showView/{fileId}")
	public void showView(@PathVariable long fileId, HttpServletResponse response) {
		MyFile myFile = fileService.selectById(fileId);
		DownloadSupport.showView(response, myFile);
	}

	/**
	 * 文件的移动
	 * 
	 * @param sourceId
	 * @param targetId
	 * @return
	 */
	@RequestMapping("/movefile")
	@ResponseBody
	public String moveFile(long sourceId, long targetId) {
		// TODO:文件移动操作
		boolean flag = fileService.moveFile(sourceId, targetId);
		return flag ? "success" : "fail";
	}

	@RequestMapping("/share")
	public String shareFile(String id, String shareType, Model model) {
		model.addAttribute("fileId", id);
		model.addAttribute("shareType", shareType);
		return "/general/share";
	}

	@RequestMapping("/shareUser")
	public String shareUser(String fileId, String shareType, Model model) {

		model.addAttribute("shareType", shareType);
		model.addAttribute("fileId", fileId);
		return "/general/share-user";
	}

	/**
	 * 保存共享用户信息
	 * 
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareUserSave")
	@ResponseBody
	public String shareUserSave(ShareUser share, String fileIds, String shareTypes) {
		String msg = "";
		try {
			String[] ids = fileIds.split(",");
			String[] types = shareTypes.split(",");
			for (int i = 0; i < ids.length; i++) {
				share.setFileId(fileIds != null ? Long.parseLong(ids[i]) : 0);
				share.setShareType(shareTypes != null ? Long.parseLong(types[i]) : 0);
				fileService.shareUserSave(share);
			}
			msg = "保存成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "保存失败";
		}
		return msg;
	}

	@RequestMapping("/shareOrg")
	public String shareOrg(String fileId, String shareType, Model model) {
		model.addAttribute("fileId", fileId);
		model.addAttribute("shareType", shareType);
		return "/general/share-org";
	}

	/**
	 * 保存共享单位信息
	 * 
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareOrgSave")
	@ResponseBody
	public String shareOrgSave(ShareOrg share, String fileIds, String shareTypes) {
		String msg = "";
		try {
			String[] ids = fileIds.split(",");
			String[] types = shareTypes.split(",");
			for (int i = 0; i < ids.length; i++) {
				share.setFileId(fileIds != null ? Long.parseLong(ids[i]) : 0);
				share.setShareType(shareTypes != null ? Long.parseLong(types[i]) : 0);
				fileService.shareOrgSave(share);
			}
			msg = "保存成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "保存失败";
		}
		return msg;
	}

	/**
	 * 查询共享信息列表
	 * 
	 * @param params
	 * @param page
	 * @param rows
	 * @param response
	 */
	@RequestMapping(value = "/queryShareList", method = RequestMethod.POST)
	@ResponseBody
	public Object orglist(String flag, int page, int rows, HttpServletResponse response) {
		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();

		PageInfo pageInfo = new PageInfo(page, rows);
		if ("org".equals(flag)) {
			pageInfo = shareOrgService.queryShareOrgList(pageInfo, user.getId());
		} else if ("user".equals(flag)) {
			pageInfo = shareUserService.queryShareUserList(pageInfo, user.getId());
		}
		return pageInfo;
	}

	/**
	 * 删除共享单位信息
	 * 
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareOrgDel")
	@ResponseBody
	public String shareOrgDel(String shareId) {
		String msg = "";
		try {
			shareOrgService.shareOrgDel(shareId);
			msg = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
		}
		return msg;
	}

	/**
	 * 删除共享人员信息
	 * 
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareUserDel")
	@ResponseBody
	public String shareUserDel(String shareId) {
		String msg = "";
		try {
			shareUserService.shareUserDel(shareId);
			msg = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
		}
		return msg;
	}
	
	/**
	 * 得到登陆人的处室或者个人的磁盘空间
	 * 
	 * @param share
	 * @return
	 */
	@RequestMapping("/getDiskSpace")
	@ResponseBody
	public String getDiskSpace(String sign) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		long usersize = 0;
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		try {
			ShareDiskInfo disk = null;
			//处室磁盘空间
			if("office".equals(sign)){
				disk = shareDiskInfoService.getUserDiskInfo("O"+user.getOrgId());
			}else if("personal".equals(sign)){
				disk = shareDiskInfoService.getUserDiskInfo(user.getId().toString());
			}
			if (disk != null && disk.getUsedsize() != null && disk.getUsedsize() > 0) {
				usersize = (long) Math.ceil(disk.getUsedsize() / 1048576);
				if (disk.getUsedsize() % 1048576 > 0) {
					usersize += 1;
				}
			}
			resultMap.put("sign", "success");
			resultMap.put("usersize", usersize);
			resultMap.put("totalsize", disk != null ? disk.getTotalsize() : 0);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("sign", "fail");
		}
		return JsonUtils.toJson(resultMap);
	}
}
