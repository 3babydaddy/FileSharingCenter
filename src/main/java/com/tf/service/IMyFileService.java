package com.tf.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.tf.model.MyFile;
import com.tf.model.ShareOrg;
import com.tf.model.ShareUser;
import com.tf.model.vo.UserVo;

public interface IMyFileService extends IService<MyFile> {

	List<MyFile> listFiles(Long id);

	MyFile queryFile(Long id);

	String mkdir(long folderId, String folderName, String filecreatetype);

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
	
	String restoreFileOrFolder(long id);
	
	boolean moveFile(long sourceId, long targetId);
	
	void shareUserSave(ShareUser share)throws Exception;
	
	void shareOrgSave(ShareOrg share)throws Exception;
	
	List<ShareOrg> queryShareOrgList();
	
	List<ShareUser> queryShareUserList();
	
	Map<String, Object> getInfoByName(UserVo id);

	List<MyFile> getOfficeShareList(long id, long treeRootId);
	
	List<MyFile> getPersonalShareList(long id, long treeRootId);
	
	List<MyFile> getSpaceFileList(long id, long treeRootId);
	
	List<MyFile> getDeleteFileList(long id, long treeRootId);
}
