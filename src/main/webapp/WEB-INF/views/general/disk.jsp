<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="description" content="This is my page">
<%@ include file="/commons/basejs.jsp"%>
<script type="text/javascript" src="${staticPath }/static/contextmenu/jquery.contextmenu.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticPath }/static/js/progressBar.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticPath }/static/checkInput.v2/checkInput.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticPath }/static/promptBox/jquery.pop.js"></script>
<script type="text/javascript" src="${staticPath }/static/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/dialog/dialog.js"></script>
<script type="text/javascript" src="${staticPath }/static/drop/droppable.js"></script>
<script type="text/javascript" src="${staticPath }/static/drop/draggable.js"></script>
<script type="text/javascript" src="<c:url value='/static/js/general/disk.js?version=${jsversion}'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/pdfobject.js?version=${jsversion}'/>"></script>
<script type="text/javascript" src="${staticPath }/static/ztree/js/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/ztree/js/jquery.ztree.exedit-3.5.min.js"></script>
<link rel="stylesheet" href="${staticPath }/static/css/base.css" />
<link rel="stylesheet" href="${staticPath }/static/css/disk.css" />
<link rel="stylesheet" href="${staticPath }/static/css/mydisk.css"/>
<link rel="stylesheet" href="${staticPath }/static/css/file.css" />
<link rel="stylesheet" href="${staticPath }/static/contextmenu/theme/contextmenu.css" />
<link rel="stylesheet" href="${staticPath }/static/checkInput.v2/skin.css" />
<link rel="stylesheet" href="${staticPath }/static/promptBox/style.css" />
<link rel="stylesheet" href="${staticPath }/static/uploadify/uploadify.css" />
<link rel="stylesheet" href="${staticPath }/static/dialog/css/skin.css" />
<link rel="stylesheet" href="${staticPath }/static/css/skin.css" />

</head>
<body>
	<div id="wrap">
		<div id="sky">
			<a id="logo" href="${ctxPath}/disk" title=""><img src="${staticPath }/static/img/logo_dh.png"/></a>
			<span >文件共享系统</span>
			<div id="cloud">
				<span><shiro:principal/></span>
				<!-- 仅处室管理员与超级管理员可见 -->
				<shiro:hasAnyRoles name="org_admin,admin">
 					<span><a href="${ctxPath}/admin"  title="管理页面" style="color: white;"><img style="vertical-align: middle; height: 20px;" src="${staticPath }/static/img/setting.png"></a></span>
				</shiro:hasAnyRoles>
				<span><a href="javascript:void(0)" onclick="logout()" title="退出" style="color: white;"><img style="vertical-align: middle;" src="${staticPath }/static/img/quit.png"></a></span>
			</div>
		</div>
		<div id="main">
			<div id="left">
				<div id="user_info">
					<div id="portrait">
						<img src="${staticPath }/static/img/default.png" title="${user.name}" />
					</div>
					<div id="user_detail">
						<h4 id="name">天津市委组织部</h4>
						<h4 id="name" title="${org.name}&nbsp;&nbsp;${user.name }">${org.name}&nbsp;&nbsp;${user.name }</h4>
						<span id="gender gender_"></span> <span>共${empty disk.filenumber ? 0 : disk.filenumber}个资源</span>
					</div>
				</div>
				<div id="netdisk">
					<span id="space_bar">空间概览</span>
					<input id="totalsize" type="hidden" value="${empty disk.totalsize ? 0 : disk.totalsize}" />
					<input id="usedsize" type="hidden" value="${empty disk.usedsize ? 0 : disk.usedsize}" />
				</div>
				<!-- 仅当不是admin显示 -->
				<shiro:lacksRole  name="admin">
					<div id="chg_base_info" class="menu_div div-active">
						<!-- <h3>处室共享</h3> -->
						<h3>${org.name}共享文件</h3>
						<shiro:hasRole name="org_admin"> 
						    <input type="hidden" value="pass" id="pass" />
						</shiro:hasRole>
					</div>
					<shiro:lacksRole  name="org_admin">
						<div id="chg_portrait" class="menu_div">
							<!-- <h3>个人空间</h3> -->
							<h3>${user.name }的个人空间</h3>
						</div>
					</shiro:lacksRole>
				</shiro:lacksRole>
				<div id="chg_email" class="menu_div">
					<h3>公共空间</h3>
				</div>
				<input type="hidden" id="fileRootId" value="${fileRootId }" />
				<input type="hidden" id="fileOrgRootId" value="${fileOrgRootId }" />
				<input type="hidden" id="createMkdirType" value="0" />
				<input type="hidden" id="flag" value="0" />
				<input id="maxUploadSize" type="hidden" value="${maxUploadSize}" />
				<!-- 组织机构树形 -->
				<div id="org_tree">
					<ul id="orgTree" class="ztree"></ul>
				</div>
				<!-- 文件夹树形 -->
				<div id="dir_tree" style="display:none;">
					<ul id="dirTree" class="ztree"></ul>
				</div>
			</div>
			<div id="right">
				<div id="file_path">
					<div id="path_wrap">
						<div id="root">
							<span>根目录</span>
						</div>
						<div id="children_path"></div>
					</div>
				</div>
				<div id="tools_bar">
					<!-- <input type="checkbox">全选 -->
					<span id="mkdir" style="display:none;">新建文件夹</span> 
					<span id="upload">上　传<span id="upload_button"></span></span> 
					<span id="share">共　享</span>
					<%-- <div>
						<img id="gridViewImg" src="${staticPath }/static/img/grid-white.png" />
						<img id="listVidwImg" src="${staticPath }/static/img/list.png"/>
					</div> --%>
				</div>
				<div id="folder">
					<ul>
					</ul>
				</div>
			</div>
			<!-- <div id="footer">
				<span>中共天津市委组织部　天津市天房科技发展股份有限公司　联合研发</span>
			</div> -->
		</div>
	</div>
	<div id="upload_queue"></div>
	<div id="dialog"></div>
	<div id="dialogView"></div>
	<!-- 预览pdf的div -->
	<div id="pdfDiv"></div>
	
</body>
</html>
