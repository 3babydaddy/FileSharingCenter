package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.mapper.MyFileMapper;
import com.tf.model.MyFile;
import com.tf.service.IMyFileService;

@Service
public class MyFileServiceImpl extends ServiceImpl<MyFileMapper, MyFile>
		implements IMyFileService {
	@Autowired
	private MyFileMapper mapper;

	@Override
	public List<MyFile> listFiles(Long id) {
		return mapper.selectFileList(id);
	}

}
