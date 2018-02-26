package com.tf.commons.service;

import java.io.FileNotFoundException;

import com.tf.commons.utils.OpenOfficePdfConvert;

public class OpenOfficeTask implements Runnable {

	private String inputFile;
	private String outputFile;

	public OpenOfficeTask(String inputFile, String outputFile) {
		this.inputFile = inputFile;
		this.outputFile = outputFile;
	}

	@Override
	public void run() {
		OpenOfficePdfConvert openOfficePdfConvert = new OpenOfficePdfConvert();
		try {
			openOfficePdfConvert.convert2PDF(inputFile, outputFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
