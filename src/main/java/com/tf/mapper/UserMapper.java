package com.tf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.tf.model.User;
import com.tf.model.vo.UserVo;

/**
 *
 * User 表数据库控制层接口
 *
 */
public interface UserMapper extends BaseMapper<User> {

    UserVo selectUserVoById(@Param("id") Long id);

    List<Map<String, Object>> selectUserPage(Pagination page, Map<String, Object> params);

    
    @Select("select u.id from user u, user_role ur, role r where u.id = ur.user_id and "
    		+ "r.id = ur.role_id and u.organization_id = #{orgId} and role_id = '2'")
    List<String> getUserIdList(@Param("orgId") Long orgId);
}