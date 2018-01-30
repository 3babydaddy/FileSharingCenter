package com.tf.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.tf.commons.result.PageInfo;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.DownloadSupport;
import com.tf.commons.utils.FileStorage;
import com.tf.commons.utils.JsonUtils;
import com.tf.commons.utils.UploadHelper;
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
public class MyFileController {

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
	 * 查询处室、个人和共享的列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getSpaceFileList")
	@ResponseBody
	public Object getSpaceFileList(String flag, long id, long treeRootId) {
		List<MyFile> myFiles = fileService.getSpaceFileList(flag, id, treeRootId);
		for (MyFile myFile : myFiles) {
			myFile.setParent_id(null);
		}
		return myFiles;
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
	@RequestMapping("/upload/{folderid}")
	@ResponseBody
	public String upload(HttpServletRequest request, @PathVariable long folderid)throws Exception {
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
		
		String filePath = FILEBASEPATH + new Date().getTime() + "." + suffix;
		try {
			//路径是否存在
			File filePth = new File(FILEBASEPATH);
			if (!filePth.exists()) {
				filePth.mkdirs();
			}
			utils.upload(file, filePath);// 文件没有成功保存返回失败信息

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			MyFile folder = fileService.queryFile(folderid);

			myFile.setCreateDate(sdf.format(new Date()));
			myFile.setName(fileName);
			myFile.setParent_id(folderid);
			myFile.setType(suffix.toLowerCase());
			myFile.setPath(folder.getPath() + folderid + "/");
			myFile.setLocation(filePath);
			myFile.setIsShare(0);
			myFile.setDescription("");

			fileService.insert(myFile);
			
			ShareDiskInfo diskInfo = shareDiskInfoService.getUserDiskInfo(user.getId());
			long usedSize = diskInfo.getUsedsize() + file.getSize();
			long fileNumber = diskInfo.getFilenumber() + 1;
			if(Math.ceil(usedSize/1048576) > diskInfo.getTotalsize()){
				throw new Exception("空间不足");
			}
			diskInfo.setUsedsize((long)Math.ceil(usedSize/1048576));
			diskInfo.setFilenumber(fileNumber);
			shareDiskInfoService.updateAllColumnById(diskInfo);
			
			EntityWrapper<MyFile> wrapper = new EntityWrapper<MyFile>();
			wrapper.setEntity(myFile);
			MyFile selectOne = fileService.selectOne(wrapper);
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
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareUserSave")
	@ResponseBody
	public String shareUserSave(ShareUser share) {
		String msg = "";
		try{
			fileService.shareUserSave(share);
			msg = "保存成功";
		}catch(Exception e){
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
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareOrgSave")
	@ResponseBody
	public String shareOrgSave(ShareOrg share) {
		String msg = "";
		try{
			fileService.shareOrgSave(share);
			msg = "保存成功";
		}catch(Exception e){
			e.printStackTrace();
			msg = "保存失败";
		}
		return msg;
	}

	/**
	 * 查询共享信息列表
	 * @param params
	 * @param page
	 * @param rows
	 * @param response
	 */
	@RequestMapping(value="/queryShareList",method=RequestMethod.POST)
	@ResponseBody	
	public Object orglist(String flag, int page, int rows, HttpServletResponse response){
		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
				
		PageInfo pageInfo = new PageInfo(page, rows);
		if("org".equals(flag)){
			pageInfo = shareOrgService.queryShareOrgList(pageInfo, user.getId());
		}else if("user".equals(flag)){
			pageInfo = shareUserService.queryShareUserList(pageInfo, user.getId());
		}
		return pageInfo;
	}
	
	/**
	 * 删除共享单位信息
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareOrgDel")
	@ResponseBody
	public String shareOrgDel(String shareId) {
		String msg = "";
		try{
			shareOrgService.shareOrgDel(shareId);
			msg = "删除成功";
		}catch(Exception e){
			e.printStackTrace();
			msg = "删除失败";
		}
		return msg;
	}
	
	/**
	 * 删除共享人员信息
	 * @param share
	 * @return
	 */
	@RequestMapping("/shareUserDel")
	@ResponseBody
	public String shareUserDel(String shareId) {
		String msg = "";
		try{
			shareUserService.shareUserDel(shareId);
			msg = "删除成功";
		}catch(Exception e){
			e.printStackTrace();
			msg = "删除失败";
		}
		return msg;
	}
}
