package com.tf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tf.model.MyFile;
import com.tf.service.IMyFileService;

@Controller
@RequestMapping("/myFile")
public class MyFileController {

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
	public Object listFiles(long orgid, String pwd) {
		List<MyFile> myFiles = fileService.listFiles(orgid);
		
		System.out.println("================" + myFiles.size());
		return myFiles;
	}

}
