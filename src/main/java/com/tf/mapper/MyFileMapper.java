package com.tf.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.MyFile;

public interface MyFileMapper extends BaseMapper<MyFile> {

	List<MyFile> listAllFiles(long id);

	int moveDir(String sourcePath, String targetPath, String parentPath);
}