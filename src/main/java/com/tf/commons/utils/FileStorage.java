package com.tf.commons.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 读取storage.properties配置文件，获得上传文件的根目录。 主要是为了存储位置的灵活配置。
 * 
 * @author wanghw
 */
public class FileStorage {

	private static final Logger logger = LoggerFactory.getLogger(FileStorage.class);
	private static Properties props;

	synchronized static private void loadProps() {
		logger.info("开始加载properties文件内容.......");
		props = new Properties();
		InputStream in = null;
		try {
			// 要加载的属性文件
			in = FileStorage.class.getClassLoader().getResourceAsStream("storage.properties");
			props.load(in);
		} catch (FileNotFoundException e) {
			logger.error("storage.properties文件未找到");
		} catch (IOException e) {
			logger.error("出现IOException");
		} finally {
			try {
				if (null != in) {
					in.close();
				}
			} catch (IOException e) {
				logger.error("storage.properties文件流关闭出现异常");
			}
		}
		logger.info("加载properties文件内容完成...........");
		logger.info("properties文件内容：" + props);
	}

	/**
	 * 读取storage.properties配置文件，获得上传文件的根目录。
	 * 
	 * @return
	 */
	public static String getFilePath() {
		return getProperties().getProperty("file_path");
	}
	
	/**
	 * 获取对应的property
	 * @param property 属性名
	 * @return 属性值
	 */
	public static String getProperty(String property){
		return getProperties().getProperty(property);
	}

	/**
	 * 获取临时肖像图片路径
	 * 
	 * @return
	 */
	public static String getTempPortraitPath() {
		return getProperties().getProperty("temp_portrait_path");
	}

	/**
	 * 获取肖像图片路径
	 * 
	 * @return
	 */
	public static String getPortraitPath() {
		return getProperties().getProperty("portrait_path");
	}

	/**
	 * 获得配置
	 * 
	 * @return
	 */
	private static Properties getProperties() {
		if (null == props) {
			loadProps();
		}
		return props;
	}
}
