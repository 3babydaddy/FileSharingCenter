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
<script type="text/javascript" src="${staticPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/js/properties.js"></script>
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
<link rel="stylesheet" href="${staticPath }/static/bootstrap-3.3.7-dist/css/bootstrap.css" /> 
<style type="text/css">
	.navbar {
	    min-height: 50px;
	    margin-bottom: -15px !important;
	    height: 65px !important;
	    margin-top: 15px !important;
	    background: white !important;
	    border: 0 !important;
	}
	.files{
		height:26px;
	}
	.navbar-nav > li > a{
	    padding-bottom: 0px; 
	    padding-top: 12px;
	    background-color: rgba(140, 194, 73, 1);
    	color: white !important;
    	width: 102px;
    	height: 42px;
    	margin: 2px 2px 2px 2px;
	}
	.navbar-default .navbar-nav > .open > a{
		background-color: rgba(140, 194, 73, 1) !important;
	}
	.dropdown-menu{
	    background-color: rgba(140, 194, 73, 1);
    	color: white !important;
	}
	.divider{
		margin:0px !important;
	}
	.uploadify {
	    position: absolute;
	    top: 0px;
	}
	.tiny_prompt_box_head{
		height: 28px;
	}
	.menu_div {
		width: 100% !important;
	}
	.li-color{
		background-color: rgb(111, 191, 11) !important;
	}
	.total_progress, .bar_data {
		padding: 0px;
	}
</style>
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
						<span id="parentOrgName">天津市委组织部</span>
						<%-- <span id="currentOrgName" title="${org.name}&nbsp;&nbsp;${user.name }">${org.name}&nbsp;&nbsp;${user.name }</span> --%>
						<span id="currentOrgName" title="${user.name }">${user.name }</span>
						<span id="fileNumber">共${empty disk.filenumber ? 0 : disk.filenumber}个资源</span>
					</div>
				</div>
				<div id="netdisk">
					<span id="space_bar"></span>
				</div>
				<!-- 仅当不是admin显示 -->
				<shiro:lacksRole  name="admin">
					<div id="chg_base_info" class="menu_div div-active">
						<!-- <h3>处室共享</h3> -->
						<span>${org.name}共享文件</span>
						<shiro:hasRole name="org_admin"> 
						    <input type="hidden" value="pass" id="pass" />
						</shiro:hasRole>
					</div>
					<shiro:lacksRole  name="org_admin">
						<div id="chg_portrait" class="menu_div">
							<!-- <h3>个人空间</h3> -->
							<span>${user.name }的个人空间</span>
						</div>
					</shiro:lacksRole>
				</shiro:lacksRole>
				<div id="chg_email" class="menu_div">
					<span>公共空间</span>
				</div>
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
				<nav class="navbar navbar-default" role="navigation">
				    <div class="container-fluid"> 
				    <div>
				        <ul class="nav navbar-nav">
				       		<li id="mkdir" style="display:none;" onmouseover="$(this).addClass('li-color');" onmouseout="$(this).removeClass('li-color');"><a href="#">新建文件夹</a></li>
				            <li class="dropdown" id="upload" onmouseover="$(this).addClass('li-color');" onmouseout="$(this).removeClass('li-color');">
				                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				                 	  上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传  ▼
				                </a>
				                <ul class="dropdown-menu" style="min-width:102px !important;width:102px;">
				                    <li class="files" onmouseover="$(this).addClass('li-color');" onmouseout="$(this).removeClass('li-color');"><font style="margin-left:20px;">文件</font>
					                    	<div id="upLoadFile" >
											</div>
				                    	</a>
				                    </li>
				                    <li class="divider"></li>
				                    <li><a href="#" onmouseover="$(this).addClass('li-color');" onmouseout="$(this).removeClass('li-color');"><font id="btnFileFolder" style="color:white;">文件夹</font></a></li>
				                </ul>
				            </li>
				            <li id="share" onmouseover="$(this).addClass('li-color');" onmouseout="$(this).removeClass('li-color');"><a href="#">共&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;享</a></li>
				        </ul>
				    </div>
				    </div>
				</nav>
				<form id="fileUploadForm" action="${ctxPath}/myFile/uploadFolder" name="fileUploadForm" method="post" enctype="multipart/form-data">  
					<input type="file" name="fileFolder" id="fileFolder" style="display:none"  webkitdirectory />
					<input type=text name="fileNames" id="fileNames" value="tem" style="display:none" />
				</form>
				<div id="folder">
					<ul>
					</ul>
				</div>
			</div>
			<!-- <div id="footer">
				<span>中共天津市委组织部　天津市天房科技发展股份有限公司　联合研发</span>
			</div> -->
			<input type="hidden" id="fileRootId" value="${fileRootId }" />
			<input type="hidden" id="fileOrgRootId" value="${fileOrgRootId }" />
			<input type="hidden" id="createMkdirType" value="0" />
			<input type="hidden" id="flag" value="0" />
			<input type="hidden" id="maxUploadSize" value="${maxUploadSize}" />
		</div>
	</div>
	<div id="upload_queue"></div>
	<div id="dialog"></div>
	<div id="dialogView"></div>
	<!-- 预览pdf的div -->
	<div id="pdfDiv"></div>
	<div id="showPdfDiv"></div>
	
</body>
</html>
