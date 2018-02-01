package com.tf.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.JsonUtils;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.OrganizationMapper;
import com.tf.mapper.ShareDiskInfoMapper;
import com.tf.mapper.ShareOrgMapper;
import com.tf.mapper.ShareUserMapper;
import com.tf.mapper.UserMapper;
import com.tf.model.MyFile;
import com.tf.model.Organization;
import com.tf.model.ShareDiskInfo;
import com.tf.model.ShareOrg;
import com.tf.model.ShareUser;
import com.tf.model.User;
import com.tf.model.vo.UserVo;
import com.tf.service.IMyFileService;

@Service
public class MyFileServiceImpl extends ServiceImpl<MyFileMapper, MyFile> implements IMyFileService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private MyFileMapper mapper;
	@Autowired
	private ShareUserMapper shareUserMapper;
	@Autowired
	private ShareOrgMapper shareOrgMapper;
	@Autowired
	private ShareDiskInfoMapper shareDiskInfoMapper;
	@Autowired
	private OrganizationMapper organizationMapper;
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<MyFile> listFiles(Long parent_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parent_id", parent_id);
		return mapper.selectByMap(map);
	}

	@Override
	public MyFile queryFile(Long id) {
		return mapper.selectById(id);
	}

	@Override
	public String mkdir(long folderId, String folderName, String filecreatetype) {
		// 查询当前文件夹所在路径
		MyFile currentFile = mapper.selectById(folderId);
		// 新建文件夹的路径
		String path = currentFile.getPath() + folderId + "/";
		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		MyFile dir = new MyFile();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dir.setCreateDate(sdf.format(new Date()));
		dir.setParent_id(folderId);
		dir.setName(folderName);
		dir.setFilecreatetype(filecreatetype);
		dir.setPath(path);
		dir.setType("adir");
		dir.setDescription("");
		dir.setUser_id(user.getId());
		dir.setSize(0);
		mapper.insert(dir);
		logger.info("新建文件夹成功");
		MyFile mkdir = mapper.selectOne(dir);
		dir.setId(mkdir.getId());
		return JsonUtils.toJson(dir);
	}

	@Override
	public boolean reName(long folderId, String folderName) {
		MyFile myFile = new MyFile();
		myFile.setId(folderId);
		myFile.setName(folderName);
		Integer result = mapper.updateById(myFile);
		return result > 0 ? true : false;
	}

	@Override
	public String deleteFileOrFolder(long id) {
		MyFile myFile = mapper.selectById(id);
		// 如果要删除的事文件。直接从数据库删除该文件并更新相应的磁盘空间
		if (!myFile.getType().equals("adir")) {
			EntityWrapper<MyFile> wrapper = new EntityWrapper<MyFile>();
			wrapper.setEntity(myFile);
			mapper.delete(wrapper);
			// 删除磁盘上的文件
			new File(myFile.getLocation()).delete();

		} else {
			// 如果删除的是文件夹，则删除该文件夹及所有的子文件夹及文件
			// 列出文件夹、所有子文件夹下的全部文件
			List<MyFile> listAllFiles = mapper.listAllFiles(id);
			Map<String, Object> colms = new HashMap<String, Object>();
			colms.put("id", myFile.getId());
			colms.put("user_id", myFile.getUser_id());
			// 删除文件夹级联删除
			mapper.deleteByMap(colms);
			for (MyFile deleteFile : listAllFiles) {
				// 删除磁盘上的文件
				new File(deleteFile.getLocation()).delete();
			}
		}
		// TODO：更新磁盘信息mydiskinfo
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user.getId());
		List<MyFile> files = mapper.selectByMap(map);
		long usedsize = 0;
		long filenumber = 0;
		for(MyFile file : files){
			usedsize = usedsize + file.getSize();
			filenumber++;
		}
		ShareDiskInfo diskInfo = shareDiskInfoMapper.getUserDiskInfo(user.getId());
		diskInfo.setUsedsize((long)Math.ceil(usedsize/1048576));
		diskInfo.setFilenumber(filenumber);
		shareDiskInfoMapper.updateAllColumnById(diskInfo);
		return (diskInfo.getTotalsize() - usedsize) + "";
	}

	@Override
	public boolean moveFile(long sourceId, long targetId) {
		MyFile sourceFile = mapper.selectById(sourceId);
		MyFile targetFile = mapper.selectById(targetId);

		if (sourceFile.getType().equals("adir")) {
			// 移动该文件夹下面所有的子文件和文件夹
			mapper.moveDir(sourceFile.getPath(), targetFile.getPath() + targetFile.getId() + "/", sourceFile.getPath() + sourceFile.getId() + "/%");
		}
		// 更新文件夹或者文件的路径和父id
		MyFile selectById = mapper.selectById(sourceId);
		selectById.setParent_id(targetFile.getId());
		selectById.setPath(targetFile.getPath());
		Integer updateById = mapper.updateById(selectById);

		return updateById>0?true:false;
	}
	
	@Override
	public void shareUserSave(ShareUser share)throws Exception{
		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		share.setShareUser(user.getId());
		share.setCreateTime(new Date());
		share.setCreator(user.getName());
		share.setStatus("1");
		shareUserMapper.insert(share);
	}
	
	@Override
	public void shareOrgSave(ShareOrg share)throws Exception{
		// 获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		share.setShareUser(user.getId());
		share.setCreateTime(new Date());
		share.setCreator(user.getName());
		share.setStatus("1");
		shareOrgMapper.insert(share);
		
	}

	@Override
	public List<ShareOrg> queryShareOrgList() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return shareOrgMapper.queryShareOrgList(user.getId());
	}

	@Override
	public List<ShareUser> queryShareUserList() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return shareUserMapper.queryShareUserList(user.getId());
	}

	@Override
	public MyFile getInfoByName(UserVo user) {
		MyFile fileTem = new MyFile();
		fileTem.setName("#"+user.getId());
		MyFile file = mapper.selectOne(fileTem);
		fileTem.setName("#"+user.getOrganizationId());
		fileTem = mapper.selectOne(fileTem);
		file.setOrgRootId(fileTem.getId()+"");
		return file;
	}

	@Override
	public List<MyFile> getSpaceFileList(String flag, long id, long treeRootId) {
		List<MyFile> files = new ArrayList<>();
		TreeSet<MyFile> fileSet = new TreeSet<MyFile>();
		//获取当前用户
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		
		if("baseInfo".equals(flag) && id == treeRootId){
			//处室空间
			User userInfo = userMapper.selectById(user.getId());
			Organization orgInfo = organizationMapper.selectById(userInfo.getOrganizationId());
			//查询出本部门中的处室管理员
			List<String> userIdList = userMapper.getUserIdList(orgInfo.getId());
			if(userIdList.size() > 0){
				//分享处室
				TreeSet<MyFile> filesByOrg = shareOrgMapper.querySameOrgFiles(orgInfo.getId(), userIdList);
				fileSet.addAll(filesByOrg);
				//分享个人
				TreeSet<MyFile> filesByUser = shareUserMapper.getSameUserFiles(user.getId(), userIdList);
				fileSet.addAll(filesByUser);
				//处室管理员新建
				if(user.getRoles().contains("org_admin")){
					TreeSet<MyFile> filesByCreate = mapper.getMyFiles("#"+orgInfo.getId());
					fileSet.addAll(filesByCreate);
				}
			}
			logger.info("[userName={}] [userRole={}] [getSpaceFileList 查询处室文件]",new Object[]{user.getLoginName(),user.getRoles()});
		}else if("portrait".equals(flag) && id == treeRootId){
			//个人空间
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("parent_id", id);
			map.put("filecreatetype", '1');
			files = mapper.selectByMap(map);
			logger.info("查询个人空间");
			return files;
		}else if("email".equals(flag) && id == treeRootId){
			//共享空间
			User userInfo = userMapper.selectById(user.getId());
			Organization orgInfo = organizationMapper.selectById(userInfo.getOrganizationId());
			//分享处室及上级
			fileSet = this.getOrgFileList(orgInfo);
			//分享个人
			TreeSet<MyFile> filesByUser = shareUserMapper.getFileInfoList(user.getId());
			fileSet.addAll(filesByUser);
			logger.info("查询共享空间文件");
		}else{
			//文件树查询
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("parent_id", id);
			files = mapper.selectByMap(map);
		}
		files.addAll(fileSet);
		return files;
	}
	
	private TreeSet<MyFile> getOrgFileList(Organization orgInfo){
		TreeSet<MyFile> files = new TreeSet<MyFile>();
		TreeSet<MyFile> filesByOrg = shareOrgMapper.queryOrgFiles(orgInfo.getId());
		files.addAll(filesByOrg);
		
		Organization org = new Organization();
		org.setId(orgInfo.getPid());
		Organization pidOrg = organizationMapper.selectOne(org);
		if(pidOrg.getPid() != null){
			this.getOrgFileList(pidOrg);
		}
		return files;
	}
	
}
