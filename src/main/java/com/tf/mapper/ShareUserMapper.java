package com.tf.mapper;

import java.util.List;
import java.util.TreeSet;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.tf.model.MyFile;
import com.tf.model.ShareUser;

/**
 *
 * Share 表数据库控制层接口
 *
 */
public interface ShareUserMapper extends BaseMapper<ShareUser> {

	@Select("select id as id, file_id as fileId, user_id as userId, attribute as attribute, "
			+ "create_time as createTime, creator as creator from share_to_user "
			+ "where share_user = #{shareId} and status = '1' ORDER BY attribute")
	@ResultType(ShareUser.class)
	List<ShareUser> queryShareUserList(@Param("shareId") Long shareId);

	@Update("update share_to_user set status = 0 where id = #{shareId}")
	int shareUserDel(@Param("shareId") String shareId);
	
	@Select("select m.*, o.attribute as attribute from share_to_user o LEFT JOIN myfile m on o.file_id = m.id "
			+ "where o.user_id = #{userId} and status = 1")
	@ResultType(MyFile.class)
	TreeSet<MyFile> getFileInfoList(@Param("userId") Long userId);
	
	TreeSet<MyFile> getSameUserFiles(@Param("userId") Long userId, @Param("userIdList") List<String> userIdList);
}