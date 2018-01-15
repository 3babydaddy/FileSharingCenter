package com.tf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.mapper.MyFileMapper;
import com.tf.model.MyFile;
import com.tf.service.IMyFileService;

@Service
public class MyFileServiceImpl extends ServiceImpl<MyFileMapper, MyFile> implements IMyFileService {
	@Autowired
	private MyFileMapper mapper;

	@Override
	public List<MyFile> listFiles(Long parent_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parent_id", parent_id);
		return mapper.selectByMap(map);
	}

	@Override
	public MyFile queryFile(Long id) {
		return mapper.selectById(id);
	}

}
