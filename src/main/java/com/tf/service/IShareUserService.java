package com.tf.service;

import com.baomidou.mybatisplus.service.IService;
import com.tf.commons.result.PageInfo;
import com.tf.model.ShareUser;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IShareUserService extends IService<ShareUser> {

	public PageInfo queryShareUserList(PageInfo page, Long shareId);
	
	public void shareUserDel(String shareId);
	
}