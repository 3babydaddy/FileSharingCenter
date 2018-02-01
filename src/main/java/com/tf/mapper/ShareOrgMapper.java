package com.tf.mapper;

import java.util.List;
import java.util.TreeSet;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.MyFile;
import com.tf.model.ShareOrg;

/**
 *
 * Share 表数据库控制层接口
 *
 */
public interface ShareOrgMapper extends BaseMapper<ShareOrg> {

	@Select("select id as id, file_id as fileId, org_id as orgId, attribute as attribute,"
			+ "create_time as createTime, creator as creator from share_to_org "
			+ "where share_user = #{shareId} and status = '1' ORDER BY attribute")
    @ResultType(ShareOrg.class)
	List<ShareOrg> queryShareOrgList(@Param("shareId") Long shareId);

	
	@Update("update share_to_org set status = 0 where id = #{shareId}")
	int shareOrgDel(@Param("shareId") String shareId);
	

	@Select("select m.*, o.attribute as attribute from share_to_org o LEFT JOIN myfile m on o.file_id = m.id "
			+ "where o.org_id = #{orgId} and status = 1")
    @ResultType(MyFile.class)
	TreeSet<MyFile> queryOrgFiles(@Param("orgId") Long orgId);
	
	TreeSet<MyFile> queryFilesByOrg(@Param("orgId") Integer orgId, @Param("shareOrgId") Long shareOrgId);	
	
	TreeSet<MyFile> querySameOrgFiles(@Param("orgId") Long orgId, @Param("userIdList") List<String> userIdList);
	
}