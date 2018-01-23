package com.tf.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.result.PageInfo;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.OrganizationMapper;
import com.tf.mapper.ShareOrgMapper;
import com.tf.model.MyFile;
import com.tf.model.Organization;
import com.tf.model.ShareOrg;
import com.tf.service.IShareOrgService;

/**
 *
 * User 表数据服务层接口实现类
 *
 */
@Service
public class ShareOrgServiceImpl extends ServiceImpl<ShareOrgMapper, ShareOrg> implements IShareOrgService {

    @Autowired
    private ShareOrgMapper shareOrgMapper;
    @Autowired
	private OrganizationMapper organizationMapper;
	@Autowired
	private MyFileMapper myFileMapper;
    
	@Override
	public PageInfo queryShareOrgList(PageInfo page, Long shareId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ShareOrg> list = shareOrgMapper.queryShareOrgList(shareId);
		for(ShareOrg info : list){
			Organization main = organizationMapper.selectById(info.getOrgId());
			if(main != null){
				info.setOrgName(main.getName());
			}
			MyFile file = myFileMapper.selectById(info.getFileId());
			if(file != null){
				info.setFileName(file.getName());
			}
			info.setCreateTimeStr(sdf.format(info.getCreateTime()));
		}
		page.setRows(list);
		page.setTotal(list.size());
	    return page;
	}

	@Override
	public void shareOrgDel(String shareId) {
		shareOrgMapper.shareOrgDel(shareId);
	}
   

}