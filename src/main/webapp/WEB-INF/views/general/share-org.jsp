<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#shareOrganizationId').combotree({
            url : '${path }/organization/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        });
		loadData();
	});
	
	function submitInfo(){
		
		var orgId = $("input[name='organizationId']")[0].value;
		var shareRoleAtt = $('#shareRoleAtt').combobox('getValue');
		var fileId = $('#fileId').val();
		if(orgId == null || orgId == ''){
			alert('请选择组群');
			return;
		}
		
		$.ajax({
			url:'${path }/myFile/shareOrgSave',
			type : 'post',
			data:{fileId:fileId, orgId:orgId, attribute:shareRoleAtt},
			async: false,
			success:function(result){
				alert(result);
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
				queryParams : {flag:'org'},
				title: '共享信息列表',
				rownumbers:true,
				fitColumns : true,
				striped : true,
				singleSelect : false,
				remoteSort: true,
				pagination:true,
				nowrap:false,
				columns : [ [
					 {field :"fileName",title :"共享文件",width :"60", align:"center",formatter:ifNullShowHeng}
					,{field :"orgName",title :"共享机构",width :"90", align:"center",formatter:ifNullShowHeng}
		            ,{field :"creator",title :"创建人",width :"70", align:"center",formatter:ifNullShowHeng}
		            ,{field :"createTimeStr",title :"共享时间",width :"70", align:"center",formatter:ifNullShowHeng}
		            ,{field : 'statusAndDo',title : '操作',width : "60" ,align:'center',
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
			url:'${path }/myFile/shareOrgDel',
			type : 'post',
			data:{shareId:shareId},
			success:function(result){
				alert(result);
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

<div id="shareViewRight" class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'north',title:'共享给群组',split:true" style="height: 30%;">
		<table>
			<tr>
				<td>群组:</td>
                <td><select id="shareOrganizationId" name="organizationId" style="width: 180px; height: 29px;" class="easyui-validatebox easyui-combobox" data-options="required:true"></select></td>
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
		</table>
		<input id="fileId" type="hidden" value="${fileId }" />
	</div>
	<div data-options="region:'south',split:true"  style="width:100%;height:70%;">
		<div style="width:98%;" id="gridPanel"></div>
	</div>
</div>
