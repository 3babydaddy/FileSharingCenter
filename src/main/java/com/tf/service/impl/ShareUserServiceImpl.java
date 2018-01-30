package com.tf.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.result.PageInfo;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.ShareUserMapper;
import com.tf.mapper.UserMapper;
import com.tf.model.MyFile;
import com.tf.model.ShareUser;
import com.tf.model.User;
import com.tf.service.IShareUserService;

/**
 *
 * User 表数据服务层接口实现类
 *
 */
@Service
public class ShareUserServiceImpl extends ServiceImpl<ShareUserMapper, ShareUser> implements IShareUserService {

    @Autowired
    private ShareUserMapper shareUserMapper;
	@Autowired
	private MyFileMapper myFileMapper;
	@Autowired
	private UserMapper userMapper;

	@Override
	public PageInfo queryShareUserList(PageInfo page, Long shareId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ShareUser> list = shareUserMapper.queryShareUserList(shareId);
		for(ShareUser info : list){
			User main = userMapper.selectById(info.getUserId());
			if(main != null){
				info.setUserName(main.getName());
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
	public void shareUserDel(String shareId) {
		shareUserMapper.shareUserDel(shareId);
	}

}