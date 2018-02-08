package com.tf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.tf.commons.base.BaseController;
import com.tf.commons.csrf.CsrfToken;
import com.tf.commons.shiro.ShiroUser;
import com.tf.commons.utils.FileStorage;
import com.tf.commons.utils.StringUtils;
import com.tf.commons.utils.WebUtils;
import com.tf.model.MyFile;
import com.tf.model.Organization;
import com.tf.model.ShareDiskInfo;
import com.tf.model.User;
import com.tf.model.vo.UserVo;
import com.tf.service.IMyFileService;
import com.tf.service.IOrganizationService;
import com.tf.service.IShareDiskInfoService;
import com.tf.service.IUserService;

/**
 * @description：登录退出
 * @author：wanghaiwang @date：2018/2/8 14:51
 */
@Controller
public class LoginController extends BaseController {
	// @Autowired
	// private DreamCaptcha dreamCaptcha;
	@Autowired
	private IUserService userService;
	@Autowired
	private IOrganizationService organizationService;
	@Autowired
	private IShareDiskInfoService shareDiskInfoService;
	@Autowired
	private IMyFileService myFileService;

	/**
	 * 首页
	 *
	 * @return
	 */
	@GetMapping("/")
	public String index() {
		return "redirect:/disk";
	}

	/**
	 * 首页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/admin")
	public String index(Model model) {
		return "admin";
	}

	/**
	 * 文件共享主页面
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/disk")
	public String disk(Model model) {
		long usersize = 0;
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		UserVo userInfo = userService.selectVoById(user.getId());
		if (userInfo != null) {
			Organization orgInfo = organizationService.getOrgInfo(userInfo.getOrganizationId().longValue());
			ShareDiskInfo disk = shareDiskInfoService.getUserDiskInfo(userInfo.getId());
			if (disk.getUsedsize() != null && disk.getUsedsize() > 0) {
				usersize = (long) Math.ceil(disk.getUsedsize() / 1048576);
				if (disk.getUsedsize() % 1048576 > 0) {
					usersize += 1;
				}
				disk.setUsedsize(usersize);
			}
			MyFile file = myFileService.getInfoByName(userInfo);
			model.addAttribute("user", userInfo);
			model.addAttribute("org", orgInfo);
			model.addAttribute("disk", disk);
			model.addAttribute("fileRootId", file.getId());
			model.addAttribute("fileOrgRootId", file.getOrgRootId());
			model.addAttribute("maxUploadSize", FileStorage.getProperty("max_upload_size"));
		}
		return "/general/disk";
	}

	/**
	 * GET 登录
	 * 
	 * @return {String}
	 */
	@GetMapping("/login")
	@CsrfToken(create = true)
	public String login(HttpServletRequest request) {
		logger.info("[ 跳转login mapping ]");
		// 获取登陆ip 根据IP地址 判断是否是合法用户
		String ipAddr = "";
		try {
			ipAddr = WebUtils.getIpAddr(request);
		} catch (Exception e) {
			logger.info("[getIpAddr has Exception]", e);
		}
		logger.info("[ 判断用户IP是否绑定账号 ]");
		logger.info("[ 获取的ip地址] [ ipAddr ={}]", ipAddr);
		Map<String, Object> columnMap = new HashMap<String, Object>();
		columnMap.put("ip", ipAddr);
		List<User> selectByMap = userService.selectByMap(columnMap);
		// 如果配置了IP，则直接登录准入
		if (selectByMap != null && selectByMap.size() > 0) {
			Subject user = SecurityUtils.getSubject();
			User userPo = selectByMap.get(0);
			logger.info("[ user表配置IP] [IP ={}] [ {}] [loginName={}] ", new Object[] { ipAddr, "系统自动登录", userPo.getLoginName() });
			UsernamePasswordToken token = new UsernamePasswordToken(userPo.getLoginName(), userPo.getRealPass() != null ? userPo.getRealPass() : "");
			// 设置记住密码
			token.setRememberMe(true);
			try {
				user.login(token);
				logger.info("[ 用户自动登录成功]  [loginName={}] [IP ={}]", new Object[] { userPo.getLoginName(), ipAddr });
				if (SecurityUtils.getSubject().hasRole("admin")) {
					return "redirect:/admin";
				} else {
					return "redirect:/disk";
				}
			} catch (UnknownAccountException e) {
				logger.info("账号不存在！", e);
				return "login";
			} catch (DisabledAccountException e) {
				logger.info("账号未启用！", e);
				return "login";
			} catch (IncorrectCredentialsException e) {
				logger.info("密码错误！", e);
				return "login";
			} catch (Throwable e) {
				logger.info(e.getMessage(), e);
				return "login";
			}
		} else {
			// 如果IP在用户表未配置，则执行用户登录操作
			logger.info("[ user表未配置IP] [IP ={}] [ {}]", new Object[] { ipAddr, "强制跳转登录页面login" });
			if (SecurityUtils.getSubject().isAuthenticated()) {
				return "redirect:/disk";
			}
			return "login";
		}
	}

	/**
	 * POST 登录 shiro 写法
	 *
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return {Object}
	 */
	@PostMapping("/login")
	@CsrfToken(remove = true)
	@ResponseBody
	public Object loginPost(HttpServletRequest request, HttpServletResponse response, String username, String password, String captcha, @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe) {
		logger.info("[ 用户通过POST请求登录] [userName ={}]", username);
		// 改为全部抛出异常，避免ajax csrf token被刷新
		if (StringUtils.isBlank(username)) {
			throw new RuntimeException("用户名不能为空");
		}
		if (StringUtils.isBlank(password)) {
			throw new RuntimeException("密码不能为空");
		}
		// if (StringUtils.isBlank(captcha)) {
		// throw new RuntimeException("验证码不能为空");
		// }
		// if (!dreamCaptcha.validate(request, response, captcha)) {
		// throw new RuntimeException("验证码错误");
		// }
		Subject user = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		// 设置记住密码
		token.setRememberMe(1 == rememberMe);
		try {
			user.login(token);
			// 登录成功后绑定IP
			EntityWrapper<User> wrapper = new EntityWrapper<User>();
			wrapper.setEntity(new User());
			wrapper.eq("login_name", username);
			User one = userService.selectOne(wrapper);
			one.setIp(WebUtils.getIpAddr(request));
			userService.updateAllColumnById(one);
			logger.info("[ 登录成功后绑定IP]  [userName = {}] [bindIP ={}]", username, one.getIp());
			return renderSuccess();
		} catch (UnknownAccountException e) {
			throw new RuntimeException("账号不存在！", e);
		} catch (DisabledAccountException e) {
			throw new RuntimeException("账号未启用！", e);
		} catch (IncorrectCredentialsException e) {
			throw new RuntimeException("密码错误！", e);
		} catch (Throwable e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 未授权
	 * 
	 * @return {String}
	 */
	@GetMapping("/unauth")
	public String unauth() {
		if (SecurityUtils.getSubject().isAuthenticated() == false) {
			return "redirect:/login";
		}
		return "unauth";
	}

	/**
	 * 退出
	 * 
	 * @return {Result}
	 */
	@PostMapping("/logout")
	@ResponseBody
	public Object logout() {
		Subject subject = SecurityUtils.getSubject();
		// 登出的同时清除绑定IP
		ShiroUser user = (ShiroUser) subject.getPrincipal();
		logger.info("[ 用户登出 logout]  [userName = {}]", user.getLoginName());
		User po = userService.selectById(user.getId());
		logger.info("[ 清除登录用户的IP] [userName = {}] [userIP={}]", user.getLoginName(), po.getIp());
		po.setIp("");
		userService.updateById(po);
		subject.logout();
		return renderSuccess();
	}

}
