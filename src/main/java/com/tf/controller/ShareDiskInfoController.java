package com.tf.controller;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.tf.commons.base.BaseController;
import com.tf.commons.result.PageInfo;
import com.tf.model.ShareDiskInfo;
import com.tf.service.IShareDiskInfoService;

/**
 * <p>
 * 共享空间磁盘信息 前端控制器
 * </p>
 *
 * @author haiwang.wang
 * @since 2018-01-23
 */
@Controller
@RequestMapping("/shareDiskInfo")
public class ShareDiskInfoController extends BaseController {

    @Autowired private IShareDiskInfoService shareDiskInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/shareDiskInfo/shareDiskInfoList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ShareDiskInfo shareDiskInfo, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<ShareDiskInfo> ew = new EntityWrapper<ShareDiskInfo>(shareDiskInfo);
        Page<ShareDiskInfo> pages = new Page<ShareDiskInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        pages = shareDiskInfoService.selectPage(pages, ew);
        pageInfo.setRows(pages.getRecords());
        pageInfo.setTotal(pages.getTotal());
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/shareDiskInfo/shareDiskInfoAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid ShareDiskInfo shareDiskInfo) {
        shareDiskInfo.setCreteTime(new Date());
        shareDiskInfo.setStatus("0");
        boolean b = shareDiskInfoService.insert(shareDiskInfo);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        ShareDiskInfo shareDiskInfo = new ShareDiskInfo();
        shareDiskInfo.setId(id);
        shareDiskInfo.setStatus("1");
        boolean b = shareDiskInfoService.updateById(shareDiskInfo);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }
    
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        ShareDiskInfo shareDiskInfo = shareDiskInfoService.selectById(id);
        model.addAttribute("shareDiskInfo", shareDiskInfo);
        return "admin/shareDiskInfo/shareDiskInfoEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid ShareDiskInfo shareDiskInfo) {
        boolean b = shareDiskInfoService.updateById(shareDiskInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
