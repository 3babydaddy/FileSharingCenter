package com.tf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.ShareUser;

/**
 *
 * Share 表数据库控制层接口
 *
 */
public interface ShareUserMapper extends BaseMapper<ShareUser> {

	@Select("select id as id, file_id as fileId, user_id as userId, attribute as attribute, "
			+ "create_time as createTime, creator as creator from share_to_user where share_user = #{shareId} and status = '1'")
	@ResultType(ShareUser.class)
	List<ShareUser> queryShareUserList(@Param("shareId") Long shareId);

	@Update("update share_to_user set status = 0 where id = #{shareId}")
	int shareUserDel(@Param("shareId") String shareId);
}