package com.tf.commons.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tf.commons.service.OpenOfficeCenter;
import com.tf.commons.service.OpenOfficeTask;

public class UploadHelper {
	/**
	 * 从request中取得批量上传的文件
	 * 
	 * @param request
	 * @return
	 */
	public List<MultipartFile> getFiles(HttpServletRequest request) {
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> map = req.getFileMap();
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		for (Object obj : map.values()) {
			MultipartFile file = (MultipartFile) obj;
			fileList.add(file);
		}
		return fileList;
	}

	/**
	 * 从request中取得特定的文件
	 * 
	 * @param request
	 * @param fileName
	 * @return
	 */
	public MultipartFile getFile(HttpServletRequest request, String fileName) {
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
		return req.getFile(fileName);
	}

	public void upload(List<MultipartFile> files) {

	}

	public void upload(MultipartFile file, String path) throws IOException {
		FileOutputStream out = new FileOutputStream(path);
		FileCopyUtils.copy(file.getBytes(), out);
		if (isNeedCover(path)) {
			// OpenOfficePdfConvert pdfConvert = new OpenOfficePdfConvert();
			String fullName = path.substring(0, path.lastIndexOf("."));
			// 换成线程池的方式
			OpenOfficeCenter.addOpenOfficeTask(new OpenOfficeTask(path, fullName + ".pdf"));
			// pdfConvert.convert2PDF(path, fullName + ".pdf");
		}
	}

	private boolean isNeedCover(String path) throws IOException {
		String type = path.substring(path.lastIndexOf(".") + 1, path.length()).toLowerCase();
		// .doc, * .docx, .xls, .xlsx, .ppt, .pptx
		if (type != null && (type.equalsIgnoreCase("txt") || type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("docx") || type.equalsIgnoreCase("xls") || type.equalsIgnoreCase("xlsx") || type.equalsIgnoreCase("ppt") || type.equalsIgnoreCase("pptx") || type.equalsIgnoreCase("sql") || type.equalsIgnoreCase("gif") || type.equalsIgnoreCase("jpg") || type.equalsIgnoreCase("BMP") || type.equalsIgnoreCase("png"))) {
			return true;
		} else {
			return false;
		}
	}
}
