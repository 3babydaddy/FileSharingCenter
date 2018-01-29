package com.tf.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tf.commons.result.PageInfo;
import com.tf.commons.utils.BeanUtils;
import com.tf.commons.utils.StringUtils;
import com.tf.mapper.MyFileMapper;
import com.tf.mapper.ShareDiskInfoMapper;
import com.tf.mapper.UserMapper;
import com.tf.mapper.UserRoleMapper;
import com.tf.model.MyFile;
import com.tf.model.ShareDiskInfo;
import com.tf.model.User;
import com.tf.model.UserRole;
import com.tf.model.vo.UserVo;
import com.tf.service.IUserService;

/**
 *
 * User 表数据服务层接口实现类
 *
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private ShareDiskInfoMapper diskMapper;
    @Autowired
    private MyFileMapper myFileMapper;
    
    @Override
    public List<User> selectByLoginName(UserVo userVo) {
        User user = new User();
        user.setLoginName(userVo.getLoginName());
        EntityWrapper<User> wrapper = new EntityWrapper<User>(user);
        if (null != userVo.getId()) {
            wrapper.where("id != {0}", userVo.getId());
        }
        return this.selectList(wrapper);
    }

    @Override
    public void insertByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        user.setCreateTime(new Date());
        this.insert(user);
        Long id = user.getId();
        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();
        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
        //add share_disk_info 
        ShareDiskInfo diskInfo = new ShareDiskInfo();
        diskInfo.setCreteTime(new Date());
        diskInfo.setUserId(user.getId());
        //diskInfo.setFilenumber();
        diskInfo.setTotalsize(userVo.getInitStorageSize().longValue());
        diskInfo.setStatus("0");
        diskMapper.insert(diskInfo);
        
        MyFile file = new MyFile();
        file.setUser_id(id);
        file.setName("#"+id);
        file.setSize(0);
        file.setType("adir");
        file.setPath("/");
        file.setIsLock(0);
        file.setIsShare(0);
        file.setShareDownload(0);
        myFileMapper.insert(file);
    }

    @Override
    public UserVo selectVoById(Long id) {
        return userMapper.selectUserVoById(id);
    }

    @Override
    public void updateByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        if (StringUtils.isBlank(user.getPassword())) {
            user.setPassword(null);
        }
        this.updateById(user);
        
        Long id = userVo.getId();
        List<UserRole> userRoles = userRoleMapper.selectByUserId(id);
        if (userRoles != null && !userRoles.isEmpty()) {
            for (UserRole userRole : userRoles) {
                userRoleMapper.deleteById(userRole.getId());
            }
        }
        
        //update diskInfo
        ShareDiskInfo shareDiskInfo = new ShareDiskInfo();
        shareDiskInfo.setTotalsize(userVo.getInitStorageSize().longValue());
        EntityWrapper<ShareDiskInfo> wrapper = new EntityWrapper<ShareDiskInfo>();
        wrapper.where("user_id = {0}", userVo.getId());
        diskMapper.update(shareDiskInfo, wrapper);

        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();
        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public void updatePwdByUserId(Long userId, String md5Hex) {
        User user = new User();
        user.setId(userId);
        user.setPassword(md5Hex);
        this.updateById(user);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageInfo.getNowpage(), pageInfo.getSize());
        page.setOrderByField(pageInfo.getSort());
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = userMapper.selectUserPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void deleteUserById(Long id) {
        this.deleteById(id);
        userRoleMapper.deleteByUserId(id);
        
    }

}