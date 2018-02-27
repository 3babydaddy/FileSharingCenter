package com.tf.mapper;

import com.tf.model.ShareDiskInfo;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  * 共享空间磁盘信息 Mapper 接口
 * </p>
 *
 * @author haiwang.wang
 * @since 2018-01-23
 */
public interface ShareDiskInfoMapper extends BaseMapper<ShareDiskInfo> {

	@Select("select id as id, user_id as userId, totalsize, usedsize, "
			+ "filenumber, crete_time as creteTime, status  from share_disk_info where user_id = #{userId}")
	@ResultType(ShareDiskInfo.class)
	ShareDiskInfo getUserDiskInfo(@Param("userId") String userId);
	
}