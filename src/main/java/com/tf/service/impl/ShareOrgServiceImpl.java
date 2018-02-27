package com.tf.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
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
import com.tf.commons.utils.MyFileComparator;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.OrganizationMapper;
import com.tf.mapper.ShareOrgMapper;
import com.tf.mapper.ShareUserMapper;
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
	@Autowired
	private ShareUserMapper shareUserMapper;
    
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
			if("01".equals(info.getAttribute())){
				info.setAttribute("只读");
			}else if("02".equals(info.getAttribute())){
				info.setAttribute("读写");
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
    	
    	MyFile file = myFileMapper.selectById(id);
		if(file.getName().equals("#"+user.getOrgId().longValue())){
			//点击机构树查询文件;根目录
			
			//选中机构共享到当前处室
			List<String> orgIds =  new ArrayList<String>();
			orgIds.add(user.getOrgId().toString());
			//选中机构共享到父级处室
			List<String> shargOrgIds = getOrgFileList(orgId, orgIds);
			TreeSet<MyFile> filesByOrg = shareOrgMapper.queryFilesByOrgId(shargOrgIds, orgId);
			fileSet.addAll(filesByOrg);
			//选中机构共享到当前登陆人
			TreeSet<MyFile> filesByUser = shareUserMapper.getFileListByOrgId(user.getId(), orgId);
			fileSet.addAll(filesByUser);
			files.addAll(fileSet);
		}else{
			//点击右侧文件查询子文件
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("parent_id", id);
			files = myFileMapper.selectByMap(map);
		}
		Collections.sort(files, new MyFileComparator()); //外部比较器:通过实现Comparator接口
		return files;
	}

	/**
	 * 递归查询所有机构及父级处室的id
	 * 
	 * @param orgId 选中机构的id
	 * @param files 空List
	 * @return 选中机构父级处室id的集合
	 */
	private List<String> getOrgFileList(Long orgId, List<String> files) {
		Organization org = organizationMapper.selectById(orgId);
		// 当前机构是否存在父机构 
		if (org.getPid() != null) {
			files.add(org.getPid().toString());
			this.getOrgFileList(org.getPid(), files);
		}
		return files;
	}
	
}