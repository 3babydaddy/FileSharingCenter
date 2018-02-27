package com.tf.service.impl;

import com.tf.model.ShareDiskInfo;
import com.tf.mapper.ShareDiskInfoMapper;
import com.tf.service.IShareDiskInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 共享空间磁盘信息 服务实现类
 * </p>
 *
 * @author haiwang.wang
 * @since 2018-01-23
 */
@Service
public class ShareDiskInfoServiceImpl extends ServiceImpl<ShareDiskInfoMapper, ShareDiskInfo> implements IShareDiskInfoService {

	@Autowired
	private ShareDiskInfoMapper shareDiskInfoMapper;
	
	@Override
	public ShareDiskInfo getUserDiskInfo(String userId) {
		return shareDiskInfoMapper.getUserDiskInfo(userId);
	}
	
}
