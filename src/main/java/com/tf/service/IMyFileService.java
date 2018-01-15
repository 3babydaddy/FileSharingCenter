package com.tf.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.tf.model.MyFile;

public interface IMyFileService extends IService<MyFile> {

	List<MyFile> listFiles(Long id);

	MyFile queryFile(Long id);

}
