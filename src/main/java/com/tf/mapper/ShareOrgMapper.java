package com.tf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.ShareOrg;

/**
 *
 * Share 表数据库控制层接口
 *
 */
public interface ShareOrgMapper extends BaseMapper<ShareOrg> {

	@Select("select id as id, file_id as fileId, org_id as orgId, attribute as attribute,"
			+ "create_time as createTime, creator as creator  from share_to_org where share_user = #{shareId} and status = '1'")
    @ResultType(ShareOrg.class)
	List<ShareOrg> queryShareOrgList(@Param("shareId") Long shareId);

	
	@Update("update share_to_org set status = 0 where id = #{shareId}")
	int shareOrgDel(@Param("shareId") String shareId);
}