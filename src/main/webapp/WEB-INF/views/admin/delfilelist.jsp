<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var fileDataGrid;
    $(function() {
        fileDataGrid = $('#fileDataGrid').datagrid({
            url : '${path }/myFile/getDeleteFileList',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'id',
            sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            frozenColumns : [ [ {
                width : '100',
                title : 'id',
                field : 'id',
                sortable : true,
                hidden : true
            }, {
                width : '200',
                title : '名称',
                field : 'name',
                align : 'center',
                sortable : true
            } , {
                width : '100',
                title : '创建类型',
                field : 'filecreatetype',
                align : 'center',
                sortable : true,
                formatter : function(value, row, index) {
                	if(value == "0"){
                        return '处室创建';
                    }else if(value == "1"){
                        return '个人创建';
                    }
                }
            }, {
                width : '120',
                title : '文件大小(B)',
                field : 'size',
                align : 'center'
            } , {
                width : '100',
                title : '文件类型',
                align : 'center',
                field : 'type',
            }, {
                width : '120',
                title : '删除时间',
                align : 'center',
                field : 'delDate',
            },{
                field : 'action',
                title : '操作',
                align : 'center',
                width : '120',
                formatter : function(value, row, index) {
                    var str = '';
                        //<shiro:hasPermission name="/role/delete">
                            //str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-restore" data-options="plain:true,iconCls:\'fi-eye\'" onclick="restoreFileFun(\'{0}\');" >还原</a>', row.id);
                        //</shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.role-easyui-linkbutton-restore').linkbutton({text:'还原'});
            },
            toolbar : '#roleToolbar'
        });
    });

    function restoreFileFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = fileDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	fileDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要恢复当前文件？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/myFile/restore', {
                	fileId : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        fileDataGrid.datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }

    function searchUserFun() {
    	fileDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
    function cleanUserFun() {
        $('#searchUserForm input').val('');
        fileDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>姓名:</th>
                    <td>
                    	<input name="name" class="easyui-textbox" placeholder="请输入用户姓名"/>
                    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',fit:true,border:false">
        <table id="fileDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="roleToolbar" style="display: none;">
   
</div>