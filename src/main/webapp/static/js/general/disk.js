
var file_template = "<li class='file'>" 
	+ "<span class='file_icon'>"
	+ "<span class='lock'></span>" 
	+ "<span class='share'></span>"
	+ "</span>" 
	+ "<span class='file_name' title='双击重命名'></span>" 
	+ "</li>";
var zTree;


//========================== 页面加载事件 ========================== //
$(function(){ 
	
	/* zTree处理异步加载返回得的数据 */
	dataFilter = function(tId, pNode, myFiles) {
		if (myFiles) {
			var myFile;
			for (var i = 0; i < myFiles.length; i++) {
				myFile = myFiles[i];
				if (myFile.type != "adir") {
					myFile.icon = basePath + "/static/filetype/" + myFile.type + ".gif";
				} else {
					myFile.isParent = true;
				}
			}
		}
		return myFiles;
	};
	/* zTree的context */
	var treeRootId = $("#fileOrgRootId").val();
	var setting = {
		async : {
			enable : true,
			//type:"get",
			autoParam : [ "id" ],
			//url : ctxPath + '/myFile/list',
			otherParam: {'flag': function(){return "baseInfo"}, 'treeRootId':function(){return treeRootId}}, 
			url : ctxPath + '/myFile/getSpaceFileList',
			dataFilter : dataFilter
		},
		data:{keep:{parent:true}},
		callback : {
			beforeAsync : function(tId, tNode) {
				if (tNode.isLock == 1) {
					return false;
				}
				return true;
			},
			onAsyncSuccess : function(event, treeId, tNode, msg) {
				if (tNode.isClick) {
					listFiles(tNode);
				}
			},
			/* 双击目录树，显示文件夹内容 */
			onClick : function(event, treeId, tNode) {
				if (tNode.type != "adir") {
					return;
				}
				if (tNode.isParent && tNode.isClick == null) {
					tNode.isClick = true;
				}
				if (tNode.zAsync == false) {
					zTree.reAsyncChildNodes(tNode, "refresh", true);
				} else {
					listFiles(tNode);
				}
			}
		}
	};
	
	//展示组织机构树形结构
	$('#orgTree').tree({
        url : ctxPath + '/organization/zTree',
        parentField : 'pid',
        lines : true,
        onClick : function(node) {
//            userDataGrid.datagrid('load', {
//                organizationId: node.id
//            });
        	clickTree(node.id);
        	$("#mkdir").hide();
    		$("#upload").hide();
    		$("#share").hide();
        },
        onLoadSuccess:function()  
        {
	    	//默认关闭叶子节点
	        //$("#orgTree").tree("collapseAll");  
        } 
    });
	
	/* 初始化的sTree */
	var zNodes = [ {
		isParent : true,
		name : "我的网盘",
		open : true,
		// TODO:加载某个人/机构的树形，通过treeRootId来加载
		id : treeRootId,
		//id : 1,
		type : "adir"
	} ];
	
	/* 初始化zTree并加载根目录 */
	zTree = $.fn.zTree.init($("#dirTree"), setting, zNodes);
	var root = zTree.getNodeByTId("dirTree_1",true);
	//zTree.reAsyncChildNodes(root, "refresh",true);
	//默认展开第一节点
	zTree.reAsyncChildNodes(root, "refresh");
	// TODO:加载某个人/机构的树形，通过treeRootId来加载
	//$("#root span").data("node_id", "dirTree_1").data("file_id","${treeRootId}");
	$("#root span").data("node_id", "dirTree_1").data("file_id",1);
	root.isClick = true;
		
	/* 创建文件夹按钮点击事件 */
	$("#mkdir").click(function() {
			var fMkdir = "<form class='mkdir'><dl>"
				+ "<dt>文件名：</dt><dd><input name='folderName' type='text'/></dd>"
				+ "<dt></dt><dd><button type='submit'>确定</button></dd>"
				+ "</dl></form>";
			dialog.show(fMkdir, '新建文件夹');
	});
	/*进度条*/
	$("#space_bar").progressBar({
		width : 265,
		height : 15,
		unit : "MB",
		totalProgress : Number(0).toFixed(0),
		currentProgress : 50
	});
	var pBar = $("#space_bar").getProgressBar();
	
	var maxUploadSize = $("#maxUploadSize").val();
	/* 上传按钮点击事件 */
	setTimeout(function(){
		$("#upload_button").uploadify({
			height : 22,
			width : 64,
			swf : basePath + '/static/uploadify/uploadify.swf',
			auto : true,
			queueSizeLimit : 3,
			fileTypeExts : "*.*",
			fileSizeLimit : maxUploadSize + "MB",
			queueID : 'upload_queue',
			onSelect : function(file) {
				var newSize = file.size / (1024*1024) + parseInt(pBar.getCurrent());
				if (newSize > pBar.getTotal()) {
					dialog.show("<center><h1>您的空间不够</h1></center>","出错啦！");
					//alert("您的空间不够");
					return false;
				} else {
					file.uploadUrl = ctxPath + "/myFile/upload/"+ $("#folder").data("folder_id")+"/"+$("#createMkdirType").val();
					pop.show();
					return true;
				}
			},
			onUploadStart : function(file) {
				var newSize = file.size / (1024*1024) + parseInt(pBar.getCurrent());
				if (newSize > pBar.getTotal()) {
					dialog.show("<center><h1>您的空间不够</h1></center>","出错啦！");
					//alert("您的空间不够");
					return false;
				} else {
					return true;
				}
			},
			onUploadSuccess : function(file, data, response) {
				if (data == "fail") {
					dialog.show("<center><h1>您剩余的空间已经无法容下这个文件了</h1></center>","出错啦！");
					//alert("您剩余的空间已经无法容下这个文件了");
				} else {
					var temp = JSON.parse(data);
					addFile(temp.file);
					var newSize = Number(temp.file.usedSize / (1024*1024)).toFixed(0);
					pBar.setProgress(newSize, Number(temp.file.totalSize).toFixed(0));
				}
			},
			onQueueComplete : function() {
				setTimeout(function(){pop.close()},2000);
			},
			onUploadError : function(file, errorCode, errorMsg, errorString) {
				console.log(errorMsg);
			}
		});
	},10);
	
	$("#folder").delegate(".file_name", "dblclick", function() {
		rename($(this).prev(".file_icon"));
	});
	
	/* 双击右边文件夹，显示文件夹的内容 */
	$("#folder ul").delegate(".adir", "dblclick", function() {
		openFile($(this));
	});
	$("#folder ul").delegate(".adir_readonly", "dblclick", function() {
		openFile($(this));
	});
	/* 双击下载文件 */
	$("#folder ul").delegate(".file_icon:not(.adir,.adir_readonly)", "dblclick", function(e) {
		window.location.href =  ctxPath +"/myFile/download/" + $(e.target).data("file_id");
	});
	
	/* 单击预览文件 */
	$("#folder ul").delegate(".file_icon:not(.adir,.adir_readonly)", "click", function(e) {
		if(isNeedView(e)){
//			var pdfView = new PDFObject({ url: ctxPath +"/myFile/showView/" + $(e.target).data("file_id") }).embed("pdfDiv");
			var pdfView = new PDFObject({ url: ctxPath +"/myFile/showView/" + $(e.target).data("file_id") ,pdfOpenParams: { scrollbars: '1', toolbar: '0', statusbar: '1'}}).embed("pdfDiv");
			debugger;
			$("#showPdfDiv").dialog({  
		        content: $("#pdfDiv"),  
		        width: 900,
                height:600,
                maximizable:true,
                draggable: true,
		        //modal: true,  
		        title: "文件预览",  
		        onClose: function () {  
		            $(this).dialog('close');//后面可以关闭后的事件  
		        }  
		    });  
		}else{
			return false;
		}
	});
	
	/*对非只读的文件夹添加点击选中效果 批量进行操作*/
	$("#folder ul").delegate(".folder","click", function(obj) {
		if($(obj.currentTarget).hasClass("active")){
			$(obj.currentTarget).removeClass("active");
		}else{
			$(obj.currentTarget).addClass("active");
		}
	});

	/* 点击路径列出目录的内容 */
	$("#file_path").delegate("#children_path span", "click", function() {
		listFiles(zTree.getNodeByTId($(this).data("node_id")));
	});
	$("#root").click(function() {
		listFiles(zTree.getNodeByTId("my_file_tree_1"));
	});
	
	$(".file").dragble({
		handler : ".file_icon:not(.lock_1):not(.lock_2)"
	});

	$(".folder,#file_path span").droppable({
		accept : ".file",
		activeClass : "active",
		onClass : "on",
		onDrop : function(drag, drop) {
			var tarF = drop.hasClass("file") ? drop.find(".file_icon") : drop;
			var souF = drag.find(".file_icon");
			if ($("#folder").data("folder_id") != tarF.data("file_id")) {
				var url = ctxPath + "/myFile/movefile/";
				var data = "targetId=" + tarF.data("file_id")+ "&sourceId=" + souF.data("file_id");
				$.post(url,data,function(dat) {
					if (dat == "success") {
						var tarN = zTree.getNodeByTId(tarF.data("node_id")), souN = zTree.getNodeByTId(souF.data("node_id"));
						drag.remove();
						if (tarF.hasClass("lock_1")|| !tarN.zAsync) {
							zTree.removeNode(souN);
						} else if (tarN.zAsync) {
							zTree.moveNode(tarN,souN, "inner",true);
						}
					}
				});
			}
		}
	});
	
	/* 文件上传插件 */
	var pop = popbox({
		width : 400,
		height : 240,
		title : "文件上传",
		auto : false,
		content : $("#upload_queue")
	});
	
	/* 对话框点击 */
	$("#dialog").checkInput({
		items : items,
		rules : rules,
		beforeSubmit : function(e, result, form) {
			e.preventDefault();
			if (result) {
				var url = null, data = null;
				if (form.hasClass("mkdir")) {
					url = ctxPath + "/myFile/mkdir/" + $("#folder").data("folder_id") +"/"+$("#createMkdirType").val();
					data = form.serialize();
					$.post(url,data,function(d) {
						addFile(d);
						dialog.updateTitle("新建文件成功").updateContent("<center><h1>新建文件成功</h1></center>");
						setTimeout("dialog.close()",1000);
					},"json");
				} else if (form.hasClass("add_pwd")&& form.data("file")) {
					var f = form.data("file");
					url = "addlock/" + f.data("file_id");
					data = form.serialize();
					$.post(url,data,function(d) {
						if (d == "success") {
							var tNode = zTree.getNodeByTId(f.data("node_id"));
							zTree.removeChildNodes(tNode);
							tNode.isLock = 1;
							tNode.zAsync = false;
							f.addClass("lock_1").removeClass("lock_0");
							dialog.updateTitle("文件加密成功").updateContent("<center><h1>请牢记密码</h1></center>");
							setTimeout("dialog.close()",2500);
						}
					});
				} else if (form.hasClass("change_pwd")&& form.data("file")) {
					var f = form.data("file");
					url = "changefilepwd/" + f.data("file_id");
					data = form.serialize();
					$.post(url,data,function(d) {
						if (d == "success") {
							var tNode = zTree.getNodeByTId(f.data("node_id"));
							zTree.removeChildNodes(tNode);
							tNode.isLock = 1;
							tNode.zAsync = false;
							f.addClass("lock_1").removeClass("lock_2");
							dialog.updateTitle("密码修改成功").updateContent("<center><h1>请牢记新密码</h1></center>");
							setTimeout("dialog.close()",2500);
						} else {
							alert("旧密码不对");
						}
					});
				} 
			}
		}
	});
	
	//切换视图
	$("#gridViewImg").click(function(){
		if($(this).css("background-color") =="rgb(255, 255, 255)"){
			$(this).css("background-color","#38A3DB");
			$(this).attr("src", basePath +"/static/img/grid-white.png");
			$(this).next().css("background-color","white");
			$(this).next().attr("src",basePath +"/static/img/list.png");
		}
		//TODO:列表数据处理
	});

	//切换视图
	$("#listVidwImg").click(function(){
		if($(this).css("background-color") =="rgb(255, 255, 255)"){
			$(this).css("background-color","#38A3DB");
			$(this).attr("src", basePath +"/static/img/list-white.png");
			$(this).prev().css("background-color","white");
			$(this).prev().attr("src",basePath +"/static/img/grid.png");
		}
		//TODO:列表数据处理
		var folder = $("#folder ul");
	});
	
	//共享
	$("#share").click(function() {
		//var fileId = $("#folder").data("folder_id");
		var nodeId = $("#folder").data("node_id");
		var tNode = zTree.getNodeByTId(nodeId);
		parent.$.modalDialog({
	        title : '共享设置',
	        width : 750,
	        height : 500,
	        href : ctxPath + '/myFile/share?id=' + tNode.id + '&shareType=' + tNode.filecreatetype,
	        buttons : [ {
	            text : '关闭',
	            handler : function() {
	               // var f = parent.$.modalDialog.handler.find('#roleGrantForm');
	                //f.submit();
	            	parent.$.modalDialog.handler.dialog('destroy');
	        		parent.$.modalDialog.handler = undefined;
	            }
	        } ]
	    });
		
	});
	
	//处室共享
	$("#chg_base_info").click(function() {
		var fileRootId = $("#fileOrgRootId").val();
		//更改新建文件夹类型
		$("#createMkdirType").val("0");
		$("#flag").val("0");
		clickSpaceTree(ctxPath + '/myFile/getOfficeShareList', fileRootId);

		getProgressData(ctxPath + '/myFile/getDiskSpace', 'office');
	});
	//个人共享
	$("#chg_portrait").click(function() {
		var fileRootId = $("#fileRootId").val();
		//更改新建文件夹类型
		$("#createMkdirType").val("1");
		$("#flag").val("0");
		clickSpaceTree(ctxPath + '/myFile/getPersonalShareList', fileRootId);
		
		getProgressData(ctxPath + '/myFile/getDiskSpace', 'personal');
	});
	//空间共享
	$("#chg_email").click(function() {
		var fileRootId = $("#fileRootId").val();
		//更改新建文件夹类型
		$("#createMkdirType").val("1");
		$("#flag").val("1");
		clickSpaceTree(ctxPath + '/myFile/getSpaceFileList', fileRootId);
	});
	
	//初始化页面；对“新建文件夹”按钮进行操作
	initPage();
	
	$(".menu_div").on("click",function(obj){
		$(".menu_div").each(function(){
			$(this).removeClass("div-active");
		});
		$(obj.currentTarget).addClass("div-active");
	});
	$("#chg_base_info").click();
});  
	
//========================== 页面加载事件 ========================== //

function initPage(){
	var yesNoRole = $("#pass").val();
	if(yesNoRole == 'pass'){
		$("#mkdir").show();
	}else{
		$("#mkdir").hide();
	}
}
//初始化进度条的数据
function getProgressData(url, sign){
	var data = {sign : sign};
	$.post(url, data, function(data) {
		var temp = JSON.parse(data);
		if (temp.sign == "success") {
			//更新磁盘使用量
			var userSize = Number(temp.usersize).toFixed(0);
			var pBar = $("#space_bar").getProgressBar();
			pBar.setProgress(userSize, Number(temp.totalsize).toFixed(0));
		} else if(temp.sign == "fail") {
			alert("网络错误!");
		}
	});
}

/**
 * 判断当前对象是否需要预览
 * @param e
 * @returns {Boolean}
 */
function isNeedView(e){
	var type = e.target.title.substring(e.target.title.lastIndexOf(".")+1);
	if ( type == "txt" || 
			type =="doc" || 
			type =="docx" || 
			type =="xls"|| 
			type =="xlsx" || 
			type =="ppt" || 
			type =="pptx" || 
			type =="sql" || 
			type =="gif" || 
			type =="jpg" || 
			type =="BMP" || 
			type =="png") {
		return true;
	} else {
		return false;
	}
}

var dialog = dialog({
	height : 'auto',
	width : "400",
	speed : 200,
	appendTo : "#dialog"
});

/* 获得字符串实际长度，中文2，英文1，要获得长度的字符串 */
getRealStrLen = function(str) {
	var realLen = 0, len = str.length, charCode = -1;
	for (var i = 0; i < len; i++) {
		charCode = str.charCodeAt(i);
		if (charCode >= 0 && charCode <= 128) {
			realLen += 1;
		} else {
			realLen += 2;
		}
	}
	return realLen;
};

/* 限制字符串的长度，超过长度后面用省略号覆盖 */
strLimit = function(str, len) {
	if (str.length > 20) {
		return str.substr(0, 18) + "...";
	} else {
		return str;
	}
};


/* 取得某个树节点的路径 */
createPath = function(tNode) {
	var tempNode = tNode;
	var cPath = $("#children_path");
	cPath.html("");
	while (tempNode.getParentNode() != null) {
		cPath.prepend($("<span/>").data("file_id", tempNode.id).data("node_id",tempNode.tId).addClass("lock_" + tempNode.isLock).html(tempNode.name));
		cPath.prepend('<img style="height: 18px;vertical-align: middle;" src="'+basePath +'/static/img/path_spilt.png ">');
		tempNode = tempNode.getParentNode();
	}
};

/* 把文件夹的内容展示在右边窗口里 */
listFiles = function(tNode,type) {
	$("#folder").data("folder_id", tNode.id).data("node_id", tNode.tId);
	createPath(tNode);
	var files = tNode.children;
	var file,folder = $("#folder ul");
	folder.html("");
	for(var i=0;i<files.length;i++){
		file = $(file_template);
		if(files[i].type == "adir"){
			file.addClass("folder");
		}
		if(files[i].attribute == undefined){
			if(tNode.attribute == undefined){
				files[i].attribute = '02';
			}else{
				files[i].attribute = tNode.attribute;
			}
		}
		if(files[i].attribute == '01' && files[i].type == 'adir'){
			files[i].type = 'adir_readonly';
		}
		file.find(".file_icon").
			addClass(files[i].type + " lock_" + files[i].isLock + " share_" + files[i].isShare + " role_" + files[i].attribute).
			data("file_id",files[i].id).
			data("node_id",files[i].tId).
			data("shareType",files[i].filecreatetype).
			data("attribute",files[i].attribute).
			attr("title",files[i].name);
		file.find(".file_name").html(strLimit(files[i].name,20));
		folder.append(file);
	}
	//操作按钮的隐藏或者显示
	optionHideShow(tNode);
	
};

function optionHideShow(tNode){
	//得到点击的按钮信息
	var clicksign = $(".div-active")[0];
	if(clicksign != undefined){
		clicksign = $(".div-active")[0].id;
	}
	var yesNoRole = $("#pass").val();
	//debugger;
	//根节点判断：flag表示点击按钮的根节点的类型，yesNoRole判断当前用户是否是处室管理员
	if((clicksign == 'chg_base_info' || $("#flag").val() == '0') && $("#flag").val() != '2' && yesNoRole == 'pass'){
		$("#upload").show();
		$("#share").hide();
		initPage();
	}else if(clicksign == 'chg_portrait' && $("#flag").val() != '2'){
		$("#mkdir").show();
		$("#upload").show();
		$("#share").hide();
	}else{
		$("#mkdir").hide();
		$("#upload").hide();
		$("#share").hide();
	}
	//不是根节点的文件夹处理
	if(tNode.attribute != undefined){
		if(tNode.attribute == '01'){
			$("#mkdir").hide();
			$("#upload").hide();
			$("#share").show();
		}else if(tNode.attribute == '02'){
			$("#mkdir").show();
			$("#upload").show();
			$("#share").show();
		}
	}else{
		$("#share").hide();
	}
}

/* 上传或新建文件夹时更新界面 */
addFile = function(data) {
	//debugger;
	if (data.type == "adir") {
		data.isParent = true;
	} else {
		data.icon = basePath + "/static/filetype/" + data.type + ".gif";
	}
	//上传文件或者新建文件夹默认的权限为读写
	data.attribute = "02";
	var tarNode = zTree.getNodeByTId($("#folder").data("node_id")), file = $(file_template), newNode = zTree.addNodes(tarNode, data, true);
	if (data.type == "adir") {
		file.addClass("folder");
	}
	file.find(".file_icon").data("file_id", data.id)
	.data("node_id",newNode[0].tId)
	.data("shareType",data.filecreatetype)
	.data("attribute",'02')
	.addClass(data.type + " lock_" + data.isLock + " share_0 role_02")
	.attr("title",data.name);
	file.find(".file_name").html(strLimit(data.name, 20));
	$("#folder ul").append(file);
};

/* 打开文件 */
openFile = function(f) {
	var tNode = zTree.getNodeByTId(f.data("node_id"));
	if (f.hasClass("lock_1") && !f.find("#input_pwd")[0]) {
		unlockFile(f);
	} else if (tNode.zAsync == false) {
		zTree.reAsyncChildNodes(tNode, "refresh", true);
		tNode.isClick = true;
	} else {
		listFiles(tNode);
	}
};


/* 文件分享 */
share = function(f) {
	var url = "/home/share", data = "fileId=" + f.data("file_id");
	$.post(url, data, function(data) {
		if (data != "fail") {
			var tNode = zTree.getNodeByTId(f.data("node_id"));
			tNode.isShare = 1;
			zTree.updateNode(tNode);
			f.removeClass("share_0").addClass("share_1");
			dialog.show($("<span>资源主页 : </span>").append($("<input/>").css({
				"width" : 320,
				"vertical-align" : "middle"
			}).val(data)).append("<a href='" + data + "'>去资源主页看看</a>"),
					"分享成功，请记下链接");
		}
		;
	});
};


/* 取消分享 */
cancelShare = function(f) {
	var url = "/home/cancelshare", data = "fileId=" + f.data("file_id");

	$.post(url, data, function(data) {
		if (data != "fail") {
			var tNode = zTree.getNodeByTId(f.data("node_id"));
			tNode.isShare = 0;
			zTree.updateNode(tNode);
			f.removeClass("share_1").addClass("share_0");
		}
	});
};

/* 重命名文件 */
rename = function(f) {
	var text = $("<textarea type='text' style='text-align:center;resize:none;width:91px;height:34px;font-size:11px;'></textarea>");

	gotoEdit = function() {
		text.blur(function() {
			var url = ctxPath + "/myFile/rename/" + f.data("file_id");
			var data = "fileName=" + text.val() + "&pwd=" + text.data("pwd");
			$.post(url, data, function(data) {
				var tNode = zTree.getNodeByTId(f.data("node_id"));
				if (data == "success") {
					tNode.name = text.val();
					zTree.updateNode(tNode);
					f.attr("title", text.val());
					text.parent().html(strLimit(tNode.name, 20));
					//dialog.show("<center><h1>重命名成功啦</h1></center>","成功啦");
					//setTimeout("dialog.close()",500);
				} else {
					if (data == "fail") {
						dialog.show("<span>网络不佳</span>", "出错啦");
						console.log("reName file fail,the reason is " + data);
					}
					text.parent().html(strLimit(tNode.name, 20));
				}
				text.remove();
			});
		});
		text.val(f.attr("title"));
		f.next().html(text);
		text.focus().select();
	}
	/* 如果是加密文件，需要输入密码后才能重命名 */
	if (f.hasClass("lock_1") || f.hasClass("lock_2")) {
		var input = inputPwd(f);
		input.find("#unlock").click(function() {
			text.data("pwd", $("#unlock_pwd").val());
			gotoEdit();
			input.close();
		});
	} else {
		gotoEdit();
	}
};

/* 删除文件 */
deleteFile = function(f) {
	url = ctxPath + "/myFile/delete/" + $(f).data("file_id"), data = "";
	post = function(url, data) {
		$.post(url, data, function(data) {
			if (data.replace(",","").length > 0) {
				var temp = data.split(',');
				var tNode = zTree.getNodeByTId(f.data("node_id"));
				zTree.removeNode(tNode);
				f.parent(".file").remove();
				//更新磁盘使用量
				var newSize = Number(temp[0] / (1024*1024)).toFixed(0);
				var pBar = $("#space_bar").getProgressBar();
				pBar.setProgress(newSize, Number(temp[1]).toFixed(0));
			} else if (data == "fail") {
				alert("网络错误!");
			}
		});
	};

	if (f.hasClass("lock_1") || f.hasClass("lock_2")) {
		var input = inputPwd(f);
		input.find("#unlock").click(function() {
			post(url, "pwd=" + $("#unlock_pwd").val());
			input.close();
		});
	} else {
		post(url, "pwd=");
	}
};

/* 文件解密、删除文件、重命名、删除文件密码时弹出输入框 */
inputPwd = function(f) {
	$("#input_pwd").slideUp(300, function() {
		$(this).remove();
	});
	var input = $("<div id='input_pwd' style='display:none;' onblur='$(\"#input_pwd\").fadeOut(\"slow\",function(){$(this).remove();});'>"
			+ "<h4>请输入密码</h4>"
			+ "<input id='unlock_pwd' name='pwd' placeholder='解密密码' type='password'/>"
			+ "<button type='button' onclick='$(\"#input_pwd\").slideUp(300,function(){$(this).remove();});'>取消</button>"
			+ "<button type='button' id='unlock'>确定</button>" + "</div>");
	input.close = function() {
		this.slideUp(300, function() {
			$(this).remove();
		});
	}
	f.parent(".file").append(input);
	input.find(".input_pwd").focus();
	input.slideDown(300);
	return input;
};

/* 文件夹解密 */
unlockFile = function(f) {
	inputPwd(f).find("#unlock").click(function() {
		var pwd = $("#unlock_pwd");
		var url = "list_myfile";
		var data = "pwd=" + pwd.val() + "&id=" + f.data("file_id");

		$.post(url, data, function(data) {
			var tNode = zTree.getNodeByTId(f.data("node_id"));

			if (data != "fail") {
				if (data == 'null') {
					data = "[]";
				}
				files = dataFilter(null, null, JSON.parse(data));
				zTree.addNodes(tNode, files, true);
				tNode.zAsync = true;
				tNode.isLock = 2;
				listFiles(tNode);
			} else {
				alert("密码错误");
			}
		});
	});
};

/* 文件夹加密 */
addLock = function(f) {
	$("#input_pwd").slideUp(300, function() {
		$(this).remove();
	});
	var input = $("<form class='add_pwd'><dl>"
			+ "<dt>密码：</dt><dd><input name='pwd' id='pwd' type='password'/></dd>"
			+ "<dt>确认：</dt><dd><input name='pwd2' id='password2' type='password'/></dd>"
			+ "<dt></dt><dd>"
			+ "<button type='button' onclick='dialog.close();'>取消</button>"
			+ "<button type='submit'>加密</button>" + "</dd>" + "</dl></form>");
	dialog.show(input, "请输入密码并牢记");
	input.data("file", f);
};
/* 更换文件密码 */
changeFilePwd = function(f) {
	var input = $("<form class='change_pwd'><dl>"
			+ "<dt>旧密码：</dt><dd><input name='oldPwd' id='old_pwd' type='password'/></dd>"
			+ "<dt>新密码：</dt><dd><input name='newPwd' id='new_pwd' type='password'/></dd>"
			+ "<dt>确认：</dt><dd><input name='pwd1' id='password2' type='password'/></dd>"
			+ "<dt></dt><dd>"
			+ "<button type='button' onclick='dialog.close();'>取消</button>"
			+ "<button type='submit' id='change_lock'>更换</button>" + "</dd>"
			+ "</dl></form>");

	dialog.show(input, "请务必牢记更换后的密码");
	input.data("file", f);
};

/* 删除密码 */
deleteLock = function(f) {
	var input = inputPwd(f);
	input.find("#unlock").click(function() {
		var pwd = $("#unlock_pwd");
		var url = "deletelock/" + f.data("file_id");
		var data = "pwd=" + pwd.val();

		$.post(url, data, function(data) {
			var tNode = zTree.getNodeByTId(f.data("node_id"));
			if (data == "success") {
				tNode.isLock = 0;
				f.addClass("lock_0").removeClass("lock_2 lock_1");
				if (tNode.children == null) {
					tNode.zAsync = false;
				}
				input.close();
			} else if (data == "fail") {
				alert("密码错误");
			}
		});
	});
};

shareFile = function (f){
	var nodeIds =[];
	var types=[];
	debugger;
	//获取多选的文件夹
	var selFolders = $("#folder>ul>li.folder.active>span.file_icon");
	if (selFolders.length > 0) {
		selFolders.each(function(index, obj) {
			var tNode = zTree.getNodeByTId($(obj).data("node_id"));
			nodeIds.push(tNode.id);
			types.push(tNode.filecreatetype);
		});
	}else{
		//默认鼠标右键的文件夹
		var tNode = zTree.getNodeByTId(f.data("node_id"));
		nodeIds.push(tNode.id);
		types.push(tNode.filecreatetype);
	}
	nodeIds.join(",");
	types.join(",");
	parent.$.modalDialog({
        title : '共享设置',
        width : 750,
        height : 500,
        href : ctxPath + '/myFile/share?id=' + nodeIds + '&shareType=' + types,
        buttons : [ {
            text : '关闭',
            handler : function() {
            	// var f = parent.$.modalDialog.handler.find('#roleGrantForm');
                //f.submit();
            	parent.$.modalDialog.handler.dialog('destroy');
        		parent.$.modalDialog.handler = undefined;
            }
        } ]
    });
}


// 文件右键
var fileItems = [ {
	text : "下载",
	icon : basePath + "/static/img/download.png",
	action : function(tar) {
		window.location.href = ctxPath +"/myFile/download/" + $(tar).data("file_id");
	}
}, {
//	text : "分享",
//	icon : basePath + "/static/img/share.png",
//	action : function(tar) {
//		share($(tar));
//	}
}, {}, {
	text : "重命名",
	icon : basePath + "/static/img/edit.png",
	action : function(tar) {
		rename($(tar));
	}
}, {
	text : "删除",
	icon : basePath + "/static/img/delete.png",
	action : function(tar) {
		$.messager.confirm('提示','删除的文件不能恢复，您确认是否删除该文件?',function(r){
	        if (r){
	        	deleteFile($(tar));
	        }
	    });
	}
} ];

var fileItemsReadOnly = [ {
	text : "下载",
	icon : basePath + "/static/img/download.png",
	action : function(tar) {
		window.location.href = ctxPath +"/myFile/download/" + $(tar).data("file_id");
	}
} ];

var folderItems = [ {
		text : "打开",
		icon : basePath + "/static/img/open.png",
		action : function(tar) {
			openFile($(tar));
		}
	}, {
		text : "重命名",
		icon : basePath + "/static/img/edit.png",
		action : function(tar) {
			rename($(tar));
		}
	},{
		text : "共享",
		icon : basePath + "/static/img/share.png",
		action : function(tar) {
			shareFile($(tar));
		}
	}, {
		type : "aplit"
	}, {
		text : "删除",
		icon : basePath + "/static/img/delete.png",
		action : function(tar) {
			$.messager.confirm('提示','文件夹可能涉及多个文件，确认要删除?',function(r){
		        if (r){
		        	deleteFile($(tar));
		        }
		    });
		}
} ];

var folderItemReadOnly = [ {
	text : "打开",
	icon : basePath + "/static/img/open.png",
	action : function(tar) {
		openFile($(tar));
	}
} ];


/* 文件的右键菜单 */
$(".share_0.role_02:not(.adir,.adir_readonly )").contextmenu({
	items : fileItems
});

$(".share_0.role_01:not(.adir,.adir_readonly )").contextmenu({
	items : fileItemsReadOnly
});


$(".share_1").contextmenu({
	items : function() {
		fileItems[1] = {
			text : "取消分享",
			icon : basePath + "/static/img/cancel_share.png",
			action : function(tar) {
				cancelShare($(tar));
			}
		};
		fileItems[2] = {
			text : "资源主页",
			action : function(tar) {
				window.location.href = "/share/" + $(tar).data("file_id");
			}
		};
		return fileItems;
	}()
});

/* 文件夹右键菜单 */
$(".adir.role_02:not(.lock_1,.lock_2)").contextmenu({
	items : folderItems
});

$(".adir_readonly.role_01:not(.lock_1,.lock_2)").contextmenu({
	items : folderItemReadOnly
});

$(".adir:not(.lock_0)").contextmenu({
	items : function() {
		folderItems[3] = {
			text : "删除密码",
			icon : basePath + "/static/img/unlock.png",
			action : function(tar) {
				deleteLock($(tar));
			}
		};
		folderItems[2] = {
			text : "更换密码",
			icon : "resource/img/lock.png",
			action : function(tar) {
				changeFilePwd($(tar));
			}
		};
		return folderItems;
	}()
});

message = function() {
	var form = "<form class='leave_message'><dl>"
		+ "<dt>标题：</dt><dd><input name='title' type='text' value=''/></dd>"
		+ "<dt>内容：</dt><dd><textarea name='content'/></dd>"
		+ "<dt></dt><dd>"
		+ "<button type='button' onclick='dialog.close();'>取消</button>"
		+ "<button type='submit'>提交</button>" + "</dd>" + "</dl></form>";
	dialog.show(form, "提交留言和意见");
}

var rules = {
	"len4" : [ /^\s*[\s\S]{4,50}\s*$/, "密码需要超过4位" ],
	"content" : [ /^\s*[\s\S]{1,100}\s*$/, "不能为空，不超过100字符" ],
	"title" : [ /^\s*[\s\S]{1,20}\s*$/, "不能为空，不超过20字符" ],
	"fileName" : [ /^\s*[^#][\s\S]{1,20}\s*$/, "不超过20字符，不以符号开头" ]
};
var items = [ {
	name : "title",
	type : "title"
}, {
	name : "content",
	type : "content"
}, {
	name : "folderName",
	type : "fileName",
	errorMsg : "len4"
}, {
	name : "pwd",
	type : "len4",
	errorMsg : ""
}, {
	name : "pwd2",
	type : "eq",
	eqto : "pwd",
	errorMsg : "两次密码不匹配"
}, {
	name : "oldPwd",
	type : "len4",
	errorMsg : ""
}, {
	name : "newPwd",
	type : "len4",
	errorMsg : ""
}, {
	name : "pwd1",
	type : "eq",
	eqto : "newPwd",
	errorMsg : "两次密码不匹配"
} ];

/**
 * 退出登录按钮事件
 */
function logout(){
    $.messager.confirm('提示','确定要退出?',function(r){
        if (r){
            progressLoad();
            $.post(ctxPath + '/logout', function(result) {
                if(result.success){
                    progressClose();
                    window.location.href = ctxPath;
                }
            }, 'json');
        }
    });
}

function clickTree(orgId){
	//debugger;
	$("#flag").val("2");
	var fileOrgRootId = $("#fileOrgRootId").val();
	var setting = {
			async : {
				enable : true,
				autoParam : [ "id" ],
				otherParam: {'orgId': function(){return orgId}}, 
				url : ctxPath + '/myFile/orgByFileList',
				dataFilter : dataFilter
			},
			data:{keep:{parent:true}},
			callback : {
				beforeAsync : function(tId, tNode) {
					if (tNode.isLock == 1) {
						return false;
					}
					return true;
				},
				onAsyncSuccess : function(event, treeId, tNode, msg) {
					if (tNode.isClick) {
						listFiles(tNode);
					}
				}
				
			}
		};
	/* 初始化的sTree */
	var zNodes = [ {
		isParent : true,
		name : "我的网盘",
		open : true,
		// TODO:加载某个人/机构的树形，通过treeRootId来加载
		//id : {treeRootId},
		id : fileOrgRootId,
		type : "adir"
	} ];
	
	/* 初始化zTree并加载根目录 */
	zTree = $.fn.zTree.init($("#dirTree"), setting, zNodes);
	var root = zTree.getNodeByTId("dirTree_1",true);
	//zTree.reAsyncChildNodes(root, "refresh",true);
	//默认展开第一节点
	zTree.reAsyncChildNodes(root, "refresh");
	// TODO:加载某个人/机构的树形，通过treeRootId来加载
	//$("#root span").data("node_id", "dirTree_1").data("file_id","${treeRootId}");
	$("#root span").data("node_id", "dirTree_1").data("file_id",1);
	root.isClick = true;
}


function clickSpaceTree(url, treeRootId){
	//debugger;
	var setting = {
			async : {
				enable : true,
				autoParam : [ "id" ],
				otherParam: {'treeRootId':function(){return treeRootId}}, 
				url : url,
				dataFilter : dataFilter
			},
			data:{keep:{parent:true}},
			callback : {
				beforeAsync : function(tId, tNode) {
					if (tNode.isLock == 1) {
						return false;
					}
					return true;
				},
				onAsyncSuccess : function(event, treeId, tNode, msg) {
					if (tNode.isClick) {
						listFiles(tNode);
					}
				}
				
			}
		};
	/* 初始化的sTree */
	var zNodes = [ {
		isParent : true,
		name : "我的网盘",
		open : true,
		// TODO:加载某个人/机构的树形，通过treeRootId来加载
		//id : {treeRootId},
		id : treeRootId,
		type : "adir"
	} ];
	
	/* 初始化zTree并加载根目录 */
	zTree = $.fn.zTree.init($("#dirTree"), setting, zNodes);
	var root = zTree.getNodeByTId("dirTree_1",true);
	//zTree.reAsyncChildNodes(root, "refresh",true);
	//默认展开第一节点
	zTree.reAsyncChildNodes(root, "refresh");
	// TODO:加载某个人/机构的树形，通过treeRootId来加载
	//$("#root span").data("node_id", "dirTree_1").data("file_id","${treeRootId}");
	$("#root span").data("node_id", "dirTree_1").data("file_id",1);
	root.isClick = true;
	
}
