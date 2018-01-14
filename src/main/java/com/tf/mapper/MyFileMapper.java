package com.tf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.MyFile;

public interface MyFileMapper extends BaseMapper<MyFile> {

	List<MyFile> selectFileList(@Param("id") Long id);

}
