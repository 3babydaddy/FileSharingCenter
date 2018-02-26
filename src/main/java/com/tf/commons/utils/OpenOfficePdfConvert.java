package com.tf.commons.utils;

import java.io.File;
import java.io.FileNotFoundException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;

public class OpenOfficePdfConvert {

	private static final Logger logger = LogManager.getLogger(OpenOfficePdfConvert.class);
	/**
	 * @param args
	 */
	private static OfficeManager officeManager;

	private static int port[] = { 8100 };

	public synchronized void convert2PDF(String inputFile, String outputFile) throws FileNotFoundException {

		startService();
		logger.info("进行文档转换转换:" + inputFile + " --> " + outputFile);

		OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);
		converter.convert(new File(inputFile), new File(outputFile));

		stopService();

	}

	// 打开服务器
	public static void startService() {
		DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();
		try {
			logger.info("准备启动服务....");
			configuration.setOfficeHome(FileStorage.getProperty("office_home"));// 设置OpenOffice.org安装目录
			configuration.setPortNumbers(port); // 设置转换端口，默认为8100
			configuration.setTaskExecutionTimeout(1000 * 60 * 5L);// 设置任务执行超时为5分钟
			configuration.setTaskQueueTimeout(1000 * 60 * 60 * 24L);// 设置任务队列超时为24小时

			officeManager = configuration.buildOfficeManager();
			officeManager.start(); // 启动服务
			logger.info("office转换服务启动成功!");
		} catch (Exception ce) {
			logger.info("office转换服务启动失败!详细信息:" + ce);
		}
	}

	// 关闭服务器
	public static void stopService() {
		logger.info("关闭office转换服务....");
		if (officeManager != null) {
			officeManager.stop();
		}
		logger.info("关闭office转换成功!");
		logger.info("===========");
	}

	public static void main(String[] args) throws Exception {
		String path = "D:/";
		OpenOfficePdfConvert opc = new OpenOfficePdfConvert();
		opc.convert2PDF(path + "test1.jpg", path + "" + "test.pdf");
	}
}
