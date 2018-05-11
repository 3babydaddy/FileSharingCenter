package com.tf.mapper;

import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.tf.model.MyFile;

public interface MyFileMapper extends BaseMapper<MyFile> {

	List<MyFile> listAllFiles(long id);

	int moveDir(@Param("sourcePath") String sourcePath,@Param("targetPath") String targetPath,@Param("parentPath") String parentPath);
	
	@Select("select *, '02' as attribute from myfile where parent_id = (select id from myfile where name = #{orgId} and filecreatetype = '0') and del_flag = 0")
    @ResultType(MyFile.class)
	TreeSet<MyFile> getMyFiles(@Param("orgId") String orgId);
	
	int updateStatusById(@Param("fileId") long id, @Param("delFlag") String delFlag);
	
	List<MyFile> queryFileByParentId(@Param("fileId") long id, @Param("delFlag") String delFlag);
	
	List<Map<String, Object>> getDelFilePage(Pagination page, Map<String, Object> params);
}