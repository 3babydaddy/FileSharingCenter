package com.tf.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.tf.commons.utils.JsonUtils;

import java.io.Serializable;
import java.util.Date;


/**
 * 共享单位类
 */
@TableName("share_to_org")
public class ShareOrg implements Serializable {

	private static final long serialVersionUID = 1010L;

	//主键id
	private Long id;
	
	//共享文件id
	@TableField(value = "file_id")
	private Long fileId;
	
	//被共享人id 
	@TableField(value = "org_id")
	private Long orgId;
	
	//共享人id 
	@TableField(value = "share_user")
	private Long shareUser;
	
	//共享人类型
	@TableField(value = "share_type")
	private Long shareType;
	
	//权限 
	private String attribute;
	
	//创建时间 
	@TableField(value = "create_time")
	private Date createTime;
	
	//创建人
	private String creator;
	
	//状态 
	private String status;

	@TableField(exist = false)
	private String orgName;
	@TableField(exist = false)
	private String fileName;
	@TableField(exist = false)
	private String createTimeStr;
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getFileId() {
		return fileId;
	}


	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}

	public Long getOrgId() {
		return orgId;
	}


	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}


	public Long getShareUser() {
		return shareUser;
	}


	public void setShareUser(Long shareUser) {
		this.shareUser = shareUser;
	}


	public String getAttribute() {
		return attribute;
	}


	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public String getCreator() {
		return creator;
	}


	public void setCreator(String creator) {
		this.creator = creator;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getOrgName() {
		return orgName;
	}


	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getCreateTimeStr() {
		return createTimeStr;
	}


	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}


	public Long getShareType() {
		return shareType;
	}


	public void setShareType(Long shareType) {
		this.shareType = shareType;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return JsonUtils.toJson(this);
	}
}
