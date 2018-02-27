<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">
$(function() {
	loadData();
});

$("#shareUsers").combobox({
	valueField : 'id',
	textField : 'name',
	url : '${path }/user/listAll',
	//mode : 'remote', //从服务器加载就设置为‘remote‘
	hasDownArrow : false, //为true时显示下拉选项图标
	/* onBeforeLoad : function(param) { //在请求加载数据之前触发，返回 false 则取消加载动作          
		if(param == null || param.q == null || param.q.replace(/ /g, '') == ''){
			var value = $(this).combobox('getValue');
			if(value){// 修改的时候才会出现q为空而value不为空
				param.id = value;
				return true;
			}
			return false;
		}
	}, */
	filter: function(q, row){  
        var opts = $(this).combobox('options');  
        return row[opts.textField].indexOf(q) == 0;  
    },
	onSelect : function(row) { //当用户选择一个列表项时触发。
		//这样赋值便于取值（否则该字段为空）
		console.log(row.name);
	}
})

	function submitInfo(){
	
		var userId = $("input[name='shareUsers']")[0].value;
		var shareRoleAtt = $('#shareRoleAtt').combobox('getValue');
		var fileId = $('#fileId').val();
		var shareType = $('#shareType').val();
		if(userId == null || userId == ''){
			//alert('请选择用户');
			parent.$.messager.alert('提示', "请选择用户", 'info');
			return;
		}
		//debugger;
		$.ajax({
			url:'${path }/myFile/shareUserSave',
			type : 'post',
			data:{fileIds:fileId, userId:userId, attribute:shareRoleAtt, shareTypes:shareType},
			//dataType:'json',
			async: false,
			success:function(result){
				parent.$.messager.alert('提示', result, 'info');
				$('#gridPanel').datagrid('reload');
			},
			 error: function(XMLHttpRequest, textStatus, errorThrown) {
				 //debugger;
			 },
		});
	}

	function loadData(){
		var options = {
				url : '${path }/myFile/queryShareList',
				queryParams : {flag:'user'},
				title: '共享信息列表',
				rownumbers:true,
				fitColumns : true,
				striped : true,
				singleSelect : false,
				remoteSort: true,
				pagination:true,
				fit: true,
				nowrap:false,
				columns : [ [
					 {field :"fileName",title :"共享文件",width :"26%", align:"center",formatter:ifNullShowHeng}
					,{field :"userName",title :"共享人员",width :"26%", align:"center",formatter:ifNullShowHeng}
		            ,{field :"creator",title :"创建人",width :"26%", align:"center",formatter:ifNullShowHeng}
		            ,{field :"attribute",title :"权限",width :"10%", align:"center",formatter:ifNullShowHeng}
		            ,{field : 'statusAndDo',title : '操作',width : "10%" ,align:'center',
						formatter:function(value,row,index){
							return '<a href="javascript:void(0)" class="easyui-linkbutton" name="editBtn" onclick="deleteOption(\''+ row.id  + '\')">删除</a>';
			            }	
		             }
		       ] ],
		       onLoadSuccess : function(data) {
	
		       }
		};
		
		$('#gridPanel').datagrid(options);
		
	}
	
	function deleteOption(shareId){
		$.ajax({
			url:'${path }/myFile/shareUserDel',
			type : 'post',
			data:{shareId:shareId},
			success:function(result){
				parent.$.messager.alert('提示', result, 'info');
				$('#gridPanel').datagrid('reload');
			},
			 error: function(XMLHttpRequest, textStatus, errorThrown) {
				 //debugger;
			 },
		});
	}
	
	function ifNullShowHeng(value,row,index){
		if(value==null||value==undefined||value==""){
			return "－";
		}
		return value;
	}

</script>
<div id="shareView" class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'north',title:'共享给用户',split:true" style="height: 30%;">
		<table>
			<tr>
				<td>用户:</td>
                <td>
                	<input class="easyui-combobox easyui-validatebox" id="shareUsers" name="shareUsers" data-options="required:true"  style="width: 150px;height: 29px"/>
                </td>
				<td>权限:</td>
                <td>
                	<select id="shareRoleAtt" name="shareRoleAtt" style="width: 80px; height: 29px;" class="easyui-validatebox easyui-combobox" data-options="required:true">
                		<option value="01">只读</option>
                  		<option value="02">读写</option>
                	</select>
                </td>
                <td>
                	<button type="button" class="btn btn-primary" onclick="javascript:submitInfo();">保存</button>
                </td>
			</tr>
			<input id="fileId" type="hidden" value="${fileId }" />
			<input id="shareType" type="hidden" value="${shareType }" />
		</table>
	</div>
	<div data-options="region:'south',split:true"  style="width:100%;height:70%;">
		<div style="width:98%;" id="gridPanel"></div>
	</div>
</div>
