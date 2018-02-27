package com.tf.commons.service;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * OpenOffice文件转换线程池
 * 
 * @author wanghaiwang
 *
 */
public class OpenOfficeCenter {
	private static ExecutorService officeExecutor = Executors.newFixedThreadPool(1);

	public static void addOpenOfficeTask(Runnable task) {
		officeExecutor.execute(task);
	}

}
