package com.tf.service;

import com.tf.model.ShareDiskInfo;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 共享空间磁盘信息 服务类
 * </p>
 *
 * @author haiwang.wang
 * @since 2018-01-23
 */
public interface IShareDiskInfoService extends IService<ShareDiskInfo> {
	
	ShareDiskInfo getUserDiskInfo(Long userId);
	
}
