package com.tf.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.result.PageInfo;
import com.tf.commons.shiro.ShiroUser;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.OrganizationMapper;
import com.tf.mapper.ShareOrgMapper;
import com.tf.mapper.UserMapper;
import com.tf.model.MyFile;
import com.tf.model.Organization;
import com.tf.model.ShareOrg;
import com.tf.model.vo.UserVo;
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
	@Autowired
	private UserMapper userMapper;
    
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

	@Override
	public List<MyFile> queryOrgFiles(Long orgId, Long id) {
		List<MyFile> files = new ArrayList<>();
		TreeSet<MyFile> fileSet = new TreeSet<MyFile>();
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
    	UserVo userInfo = userMapper.selectUserVoById(user.getId());
		if(id == 1){
			//点击机构树查询文件
			fileSet = shareOrgMapper.queryFilesByOrg(userInfo.getOrganizationId(), orgId);
			files.addAll(fileSet);
		}else{
			//点击右侧文件查询子文件
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("parent_id", id);
			files = myFileMapper.selectByMap(map);
		}
		return files;
	}

}