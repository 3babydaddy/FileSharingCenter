package com.tf.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
