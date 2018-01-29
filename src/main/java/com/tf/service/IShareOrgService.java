package com.tf.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.tf.commons.result.PageInfo;
import com.tf.model.MyFile;
import com.tf.model.ShareOrg;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IShareOrgService extends IService<ShareOrg> {

	public PageInfo queryShareOrgList(PageInfo page, Long shareId);
	
	public void shareOrgDel(String shareId);
	
	List<MyFile> queryOrgFiles(Long orgId, Long id);
			
}