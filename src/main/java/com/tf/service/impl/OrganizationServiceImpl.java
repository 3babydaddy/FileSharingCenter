package com.tf.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.result.Tree;
import com.tf.commons.result.Ztree;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.OrganizationMapper;
import com.tf.mapper.ShareDiskInfoMapper;
import com.tf.model.MyFile;
import com.tf.model.Organization;
import com.tf.model.ShareDiskInfo;
import com.tf.service.IOrganizationService;

/**
 *
 * Organization 表数据服务层接口实现类
 *
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
	private ShareDiskInfoMapper shareDiskInfoMapper;
    @Autowired
	private MyFileMapper myFileMapper;
    
    @Override
    public List<Tree> selectTree() {
        List<Organization> organizationList = selectTreeGrid();

        List<Tree> trees = new ArrayList<Tree>();
        if (organizationList != null) {
            for (Organization organization : organizationList) {
                Tree tree = new Tree();
                tree.setId(organization.getId());
                tree.setText(organization.getName());
                tree.setIconCls(organization.getIcon());
                tree.setPid(organization.getPid());
                trees.add(tree);
            }
        }
        return trees;
    }
    
    @Override
    public List<Ztree> selectzTree() {
        List<Organization> organizationList = selectTreeGrid();

        List<Ztree> trees = new ArrayList<Ztree>();
        if (organizationList != null) {
            for (Organization organization : organizationList) {
            	Ztree tree = new Ztree();
                tree.setId(organization.getId());
                tree.setText(organization.getName());
                tree.setName(organization.getName());
                tree.setIconCls(organization.getIcon());
                tree.setPid(organization.getPid());
                trees.add(tree);
            }
        }
        return trees;
    }

    @Override
    public List<Organization> selectTreeGrid() {
        EntityWrapper<Organization> wrapper = new EntityWrapper<Organization>();
        wrapper.orderBy("seq");
        return organizationMapper.selectList(wrapper);
    }

	@Override
	public Organization getOrgInfo(Long orgId) {
		return organizationMapper.selectById(orgId);
	}

	@Override
	@Transactional
	public void add(Organization organization)throws Exception{
		organization.setCreateTime(new Date());
		organizationMapper.insert(organization);
        
        MyFile file = new MyFile();
        file.setUser_id(organization.getId());
        file.setName("#"+organization.getId());
        file.setFilecreatetype("0");
        file.setSize(0);
        file.setType("adir");
        file.setPath("/");
        file.setIsLock(0);
        file.setIsShare(0);
        file.setShareDownload(0);
        myFileMapper.insert(file);
        
        ShareDiskInfo shareDiskInfo = new ShareDiskInfo();
        shareDiskInfo.setUserId("O"+organization.getId());
        shareDiskInfo.setTotalsize(organization.getInitStorageSize());
        shareDiskInfo.setCreteTime(new Date());
        shareDiskInfo.setStatus("0");
        shareDiskInfoMapper.insert(shareDiskInfo);
	}
	
	
	@Override
	@Transactional
	public void edit(Organization organization)throws Exception{
		organizationMapper.updateById(organization);
        ShareDiskInfo shareDiskInfo = shareDiskInfoMapper.getUserDiskInfo("O"+organization.getId());
        if(shareDiskInfo == null){
        	ShareDiskInfo info = new ShareDiskInfo();
        	info.setUserId("O"+organization.getId());
        	info.setTotalsize(organization.getInitStorageSize());
        	info.setCreteTime(new Date());
        	info.setStatus("0");
        	shareDiskInfoMapper.insert(info);
        }else{
        	shareDiskInfo.setTotalsize(organization.getInitStorageSize());
        	shareDiskInfoMapper.updateById(shareDiskInfo); 
        }
        MyFile fileTem = new MyFile();
        fileTem.setName("#" + organization.getId());
		fileTem.setFilecreatetype("0");
		MyFile file1 = myFileMapper.selectOne(fileTem);
		if(file1 == null){
			MyFile file = new MyFile();
	        file.setUser_id(organization.getId());
	        file.setName("#"+organization.getId());
	        file.setFilecreatetype("0");
	        file.setSize(0);
	        file.setType("adir");
	        file.setPath("/");
	        file.setIsLock(0);
	        file.setIsShare(0);
	        file.setShareDownload(0);
	        myFileMapper.insert(file);
		}
	}

}