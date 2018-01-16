package com.tf.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.FileStorage;
import com.tf.commons.utils.JsonUtils;
import com.tf.commons.utils.UploadHelper;
import com.tf.model.MyFile;
import com.tf.service.IMyFileService;

@Controller
@RequestMapping("/myFile")
public class MyFileController {

	private static final String FILEBASEPATH = FileStorage.getFilePath();

	@Autowired
	private IMyFileService fileService;

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
	 * 新建文件夹
	 * 
	 * @param folderId
	 * @return
	 */
	@RequestMapping("/mkdir/{folderId}")
	@ResponseBody
	public String mkdir(@PathVariable long folderId, String folderName) {
		return fileService.mkdir(folderId, folderName);
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
	public String upload(HttpServletRequest request, @PathVariable long folderid) {
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

}
