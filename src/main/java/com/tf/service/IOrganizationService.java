package com.tf.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.tf.commons.result.Tree;
import com.tf.commons.result.Ztree;
import com.tf.model.Organization;

/**
 *
 * Organization 表数据服务层接口
 *
 */
public interface IOrganizationService extends IService<Organization> {

    List<Tree> selectTree();
    
    List<Ztree> selectzTree();

    List<Organization> selectTreeGrid();
    
    Organization getOrgInfo(Long orgId);

}