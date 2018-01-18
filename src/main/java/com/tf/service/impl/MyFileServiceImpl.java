package com.tf.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.JsonUtils;
import com.tf.mapper.MyFileMapper;
import com.tf.model.MyFile;
import com.tf.service.IMyFileService;

@Service
public class MyFileServiceImpl extends ServiceImpl<MyFileMapper, MyFile> implements IMyFileService {
	@Autowired
	private MyFileMapper mapper;

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
	public String mkdir(long folderId, String folderName) {
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
		dir.setPath(path);
		dir.setType("adir");
		dir.setDescription("");
		dir.setUser_id(user.getId());
		dir.setSize(0);
		mapper.insert(dir);
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

		return "";
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
}
