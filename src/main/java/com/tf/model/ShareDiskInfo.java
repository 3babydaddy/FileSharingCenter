package com.tf.model;

import com.baomidou.mybatisplus.annotations.TableField;
import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 共享空间磁盘信息
 * </p>
 *
 * @author haiwang.wang
 * @since 2018-01-23
 */
@TableName("share_disk_info")
public class ShareDiskInfo extends Model<ShareDiskInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private Long id;
    /**
     * 用户id
     */
	@TableField("user_id")
	private String userId;
    /**
     * 总磁盘空间
     */
	private Long totalsize;
    /**
     * 已用空间
     */
	private Long usedsize;
    /**
     * 文件数
     */
	private Long filenumber;
    /**
     * 创建时间
     */
	@TableField("crete_time")
	private Date creteTime;
    /**
     * 状态
     */
	private String status;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getTotalsize() {
		return totalsize;
	}

	public void setTotalsize(Long totalsize) {
		this.totalsize = totalsize;
	}

	public Long getUsedsize() {
		return usedsize;
	}

	public void setUsedsize(Long usedsize) {
		this.usedsize = usedsize;
	}

	public Long getFilenumber() {
		return filenumber;
	}

	public void setFilenumber(Long filenumber) {
		this.filenumber = filenumber;
	}

	public Date getCreteTime() {
		return creteTime;
	}

	public void setCreteTime(Date creteTime) {
		this.creteTime = creteTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
