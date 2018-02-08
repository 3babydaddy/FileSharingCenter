package com.tf.commons.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import com.tf.model.MyFile;

/**
 * @author wanghaiwang
 */
public class DownloadSupport {
	public static void download(HttpServletResponse response, MyFile myFile) {
		String fileName = "unknown";
		try {
			fileName = URLEncoder.encode(myFile.getName(), "UTF-8").replace("+", "%20");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		response.reset();
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Length", myFile.getSize() + "");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + myFile.getName() + "\";filename*=utf-8''" + fileName);

		PrintWriter out = null;
		FileInputStream in = null;
		try {
			in = new FileInputStream(myFile.getLocation());
			out = response.getWriter();
			int b;
			while ((b = in.read()) != -1) {
				out.write(b);
			}
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void showView(HttpServletResponse response, MyFile myFile) {

		InputStream inputStream = null;
		OutputStream writer = null;
		try {
			String locationStr = myFile.getLocation().substring(0, myFile.getLocation().lastIndexOf("."));
			inputStream = new FileInputStream(new File(locationStr + ".pdf"));
			writer = response.getOutputStream();
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = inputStream.read(buf)) != -1) {
				writer.write(buf, 0, len); // 写
			}
			inputStream.close();
		} catch (Exception e) {
			// logger.error(e.getMessage(),e);
		} finally {
			try {
				if (inputStream != null) {
					inputStream.close();
				}
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
				// logger.error(e.getMessage(),e);
			}
		}
	}

}
