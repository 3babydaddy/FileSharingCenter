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
			<a id="logo" href="${ctxPath}/disk" title=""><img src="${staticPath }/static/img/share.png" style="height: 30px;height: 30px"/></a>
			<div id="cloud">
				<span>${user.name}</span>| <span><a href="javascript:void(0)" onclick="logout()" style="color: white;">[退出]</a></span>
			</div>
		</div>
		<div id="main">
			<div id="left">
				<div id="user_info">
					<div id="portrait">
						<img src="${staticPath }/static/img/portrait.jpg" title="${user.name}" />
					</div>
					<div id="user_detail">
						<h4 id="name">天津市委组织部</h4>
						<h4 id="name">信息管理处 刘军</h4>
						<span id="gender gender_"></span> <span>共11个资源</span>
					</div>
				</div>
				<div id="netdisk">
					<span id="space_bar">空间概览</span>
				</div>
				<div id="chg_base_info">
					<h3>处室共享</h3>
				</div>
				<div id="chg_portrait">
					<h3>个人共享</h3>
				</div>
				<div id="chg_email">
					<h3>共享空间</h3>
				</div>
				<!-- 组织机构树形 -->
				<div id="org_tree">
					<ul id="orgTree" class="ztree"></ul>
				</div>
				<!-- 文件夹树形 -->
				<div id="dir_tree">
					<ul id="dirTree" class="ztree"></ul>
				</div>
			</div>
			<div id="right">
				<div id="file_path">
					<div id="path_wrap">
						<div id="root">
							<span>我的网盘</span>:
						</div>
						<div id="children_path"></div>
					</div>
				</div>
				<div id="tools_bar">
					<span id="mkdir">新建文件夹</span> <span id="upload">上传<span id="upload_button"></span></span> <a href="/share/u/${user.id }" id="share">共享</a>
					<div style="float:right;">
						<img id="gridViewImg" src="${staticPath }/static/img/grid.png" style="height: 30px;height: 30px;"/>
						<img id="listVidwImg" src="${staticPath }/static/img/list.png" style="height: 30px;height: 30px;"/>
					</div>
				</div>
				<div id="folder">
					<ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="upload_queue"></div>
	<div id="dialog"></div>
</body>
</html>
