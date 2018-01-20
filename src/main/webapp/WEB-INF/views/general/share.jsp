<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">
	$(function() {
		//$("#share_to").panel('refresh', ctxPath + "/myFile/shareOrg");
		$("#linkBtnMan").click(function() {
			$("#share_to").panel('refresh', ctxPath + "/myFile/shareUser");
		});
		$("#linkBtnGrop").click(function() {
			$("#share_to").panel('refresh', ctxPath + "/myFile/shareOrg");
		});
		
		$('#shareOrganizationId').combotree({
            url : '${path }/organization/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        });
	});
</script>
<div id="shareView" class="easyui-layout" style="width: 100%; height: 100%;">
	<!-- <div data-options="region:'north',title:'共享文件设置',split:true" style="height: 100px;"></div> -->
	<!-- <div data-options="region:'south',title:'South Title',split:true" style="height: 100px;"></div> -->
	<!-- <div data-options="region:'east',title:'East',split:true" style="width: 100px;"></div> -->
	<div data-options="region:'west',title:'类型',split:true" style="width: 30%; text-align: center; padding-top: 30px">
		<a id="linkBtnMan" href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-man">共享给用户</a>
		<a id="linkBtnGrop" href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-company" style="margin-top: 15px">共享给群组</a>
	</div>
	<div id="share_to" data-options="region:'center',title:'共享设置',split:true" style="padding: 5px; background: #eee;">
		<div id="shareView" class="easyui-layout" style="width: 100%; height: 100%;">
			<div data-options="region:'north',title:'共享给机构',split:true" style="height: 30%;">
				<table>
					<tr>
						<td>群组:</td>
	                    <td><select id="shareOrganizationId" name="organizationId" style="width: 180px; height: 29px;" class="easyui-validatebox easyui-combobox" data-options="required:true"></select></td>
						<td>权限:</td>
	                    <td>
	                    	<select id="shareRoleAtt" name="shareRoleAtt" style="width: 80px; height: 29px;" class="easyui-validatebox easyui-combobox" data-options="required:true">
	                    		<option value="0">只读</option>
	                    		<option value="1">读写</option>
	                    	</select>
	                    </td>
	                    <td>
	                    	<button class="easyui-linkbutton">保存</button>
	                    </td>
					</tr>	
				</table>
			</div>
			<div data-options="region:'south',title:'明细',split:true" style="height: 70%;"></div>
		</div>
	</div>
</div>
