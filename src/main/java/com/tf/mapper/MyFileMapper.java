package com.tf.mapper;

import java.util.List;
import java.util.TreeSet;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.MyFile;

public interface MyFileMapper extends BaseMapper<MyFile> {

	List<MyFile> listAllFiles(long id);

	int moveDir(@Param("sourcePath") String sourcePath,@Param("targetPath") String targetPath,@Param("parentPath") String parentPath);
	
	@Select("select *, '02' as attribute from myfile where parent_id = (select id from myfile where name = #{orgId} and filecreatetype = '0')")
    @ResultType(MyFile.class)
	TreeSet<MyFile> getMyFiles(@Param("orgId") String orgId);
}