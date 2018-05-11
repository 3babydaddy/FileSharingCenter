package com.tf.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * @author me
 * 
 */
@TableName("myfile")
public class MyFile implements Comparable<MyFile> {
	private Long id;
	private Long user_id;
	private Long parent_id;
	private long size;
	private String path;
	private String name;
	private String type;
	private String password;
	@TableField(value = "islock")
	private int isLock;
	@TableField(value = "isshare")
	private int isShare;
	@TableField(value = "sharedownload")
	private int shareDownload;
	private String md5;
	private String description;
	private String location;
	@TableField(value = "shareurl")
	private String shareUrl;
	@TableField(value = "createdate")
	private String createDate;
	private String filecreatetype;
	@TableField(value = "del_flag")
	private String delFlag;
	@TableField(value = "del_date")
	private String delDate;
	
	@TableField(exist = false)
	private String attribute;
	@TableField(exist = false)
	private String orgRootId;
	@TableField(exist = false)
	private long usedSize;
	@TableField(exist = false)
	private long totalSize;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long userId) {
		user_id = userId;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setParent_id(Long parent_id) {
		this.parent_id = parent_id;
	}

	public Long getParent_id() {
		return parent_id;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath() {
		return path;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	public int getIsLock() {
		return isLock;
	}

	public void setIsShare(int isShare) {
		this.isShare = isShare;
	}

	public int getIsShare() {
		return isShare;
	}

	public void setShareDownload(int shareDownload) {
		this.shareDownload = shareDownload;
	}

	public int getShareDownload() {
		return shareDownload;
	}

	public void setShareUrl(String shareUrl) {
		this.shareUrl = shareUrl;
	}

	public String getShareUrl() {
		return shareUrl;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateDate() {
		return createDate;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getOrgRootId() {
		return orgRootId;
	}

	public void setOrgRootId(String orgRootId) {
		this.orgRootId = orgRootId;
	}

	 public String getFilecreatetype() {
		return filecreatetype;
	}

	public void setFilecreatetype(String filecreatetype) {
		this.filecreatetype = filecreatetype;
	}

	public long getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(long usedSize) {
		this.usedSize = usedSize;
	}

	public long getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(long totalSize) {
		this.totalSize = totalSize;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public MyFile() {
		super();  
	}
	 
	 public MyFile(Long id, String attribute) {
		 super();
		 this.id = id;
		 this.attribute = attribute;
	 }
	
	@Override
	public int compareTo(MyFile o) {
	  
        int result = this.getId().compareTo(o.getId()) > 0 ? 
        		1 : (this.getId().equals(o.getId()) && this.getAttribute().equals(o.getAttribute()) ? 0 : -1);  
         
        return result;
	}
	 
}
