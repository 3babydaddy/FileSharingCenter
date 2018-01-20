<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">
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
