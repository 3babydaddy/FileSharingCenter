package com.tf.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.tf.model.MyFile;
import com.tf.model.ShareOrg;
import com.tf.model.ShareUser;

public interface IMyFileService extends IService<MyFile> {

	List<MyFile> listFiles(Long id);

	MyFile queryFile(Long id);

	String mkdir(long folderId, String folderName);

	boolean reName(long folderId, String folderName);

	/**
	 * 删除文件或文件夹<br>
	 * 1.type 为dir 删除文件夹下所有的子文件夹及文件<br>
	 * 2.直接删除对应的文件<br>
	 * 3.删除磁盘上对应的文件及文件夹
	 * 
	 * @param id
	 *            主键
	 * @return 是否成功标示
	 */
	String deleteFileOrFolder(long id);
	
	boolean moveFile(long sourceId, long targetId);
	
	void shareUserSave(ShareUser share)throws Exception;
	
	void shareOrgSave(ShareOrg share)throws Exception;
	
	List<ShareOrg> queryShareOrgList();
	
	List<ShareUser> queryShareUserList();

}
