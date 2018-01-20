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
	});
</script>

<div id="shareView" class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'north',title:'共享给群组',split:true" style="height: 30%;">
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
