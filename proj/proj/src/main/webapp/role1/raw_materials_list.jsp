<%@ page import="entity.RawMaterialsList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
    <script src="../resources/js/jquery-1.10.2.js"></script>
    <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
    <title>原材料清单</title>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    List<RawMaterialsList> rawMaterialsLists = (List<RawMaterialsList>) request.getAttribute("rawMaterialsLists");
    if (rawMaterialsLists == null) {
        rawMaterialsLists = new ArrayList<>();  // 如果为 null，初始化为空列表
    }
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <a href="../index.jsp" style="text-decoration: none; color: white; font-size: 40px">菜单</a>
            <p style="color: #9fcdff">超级管理员</p>
        </div>
        <div id="menu">
            <ul>
                <ul>
                    <li><a href="index.jsp">主页</a></li>
                    <li  class="current_page_item"><a href="RawMaterialsListServletSearch">原材料清单</a></li>
                    <li><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
                    <li><a href="DriverListServletSearch">驾驶员列表</a></li>
                    <li><a href="VehicleListServletSearch">车辆列表</a></li>
                    <li><a href="WaysServletSearch">运输线路</a></li>
                    <li><a href="ExperimentServletSearch">土工实验员界面</a></li>
                    <li><a href="AcceptanceServletSearch">工地验收人员界面</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>原材料清单</h2>
            <hr/>
            <button class="btn-add">新建</button>
            <div class="find">
                <form action="RawMaterialsListServletSearch" method="post">
                    <input id="find-text" type="text" name="key" placeholder="输入单号查询">
                    <input class="find-btn" type="submit" value="搜索">
                </form>
            </div>
        </div>
        <div class="table">
            <table id="table">
                <tr>
                    <th height="35"></th>
                    <th>日期</th>
                    <th>单号</th>
                    <th>原材料名称</th>
                    <th>净重(kg)</th>
                    <th>车牌号</th>
                    <th>货物规格</th>
                    <th>供货单位</th>
                    <th>操作</th>
                </tr>
                <% for (RawMaterialsList rawMaterialsList : rawMaterialsLists) { %>
                <tr>
                    <form method="post" action="RawMaterialsListServletUpdate">
                        <td><input value="<%=rawMaterialsList.getId()%>" name="id" hidden="hidden"></td>
                        <td><input value="<%=rawMaterialsList.getDate()%>" name="date" class="table-input"></td>
                        <td><input value="<%=rawMaterialsList.getOdernum()%>" name="odernum" class="table-input" style="width: 100px"></td>
                        <td><input value="<%=rawMaterialsList.getName()%>" name="name" class="table-input"></td>
                        <td><input value="<%=rawMaterialsList.getWeight()%>" name="weight" class="table-input" style="width: 50px"></td>
                        <td><input value="<%=rawMaterialsList.getVehicle_num()%>" name="vehicle_num" class="table-input"></td>
                        <td><input value="<%=rawMaterialsList.getSpecifications()%>" name="specifications" class="table-input" style="width: 100px"></td>
                        <td><input value="<%=rawMaterialsList.getSupplier()%>" name="supplier" class="table-input" style="width: 120px"></td>
                        <td>
                            <input type="submit" class="update-btn" value="修改">
                            &nbsp;<a class="btn-delete" onclick="return confirm('确定要删除吗?');" href="RawMaterialsListServletDel?id=<%=rawMaterialsList.getId()%>">删除</a>
                            &nbsp;&nbsp;<a href="#">查看</a>
                        </td>
                    </form>
                </tr>
                <% } %>
            </table>
        </div>
    </div>
</div>

<%-- 添加原材料清单对话框 --%>
<div id="add-dialog" title="添加原材料清单" style="display:none;">
    <form id="add-form" method="post">
        单号:<input name="odernum" type="text" class="form-control"><br>
        原材料名称:<input name="name" type="text" class="form-control"><br>
        净重(kg):<input name="weight" type="text" class="form-control"><br>
        车牌号:<input name="vehicle_num" type="text" class="form-control"><br>
        货物规格:<input name="specifications" type="text" class="form-control"><br>
        供货单位:<input name="supplier" type="text" class="form-control"><br>
        日期:<input name="date" type="date" class="form-control" style="width: 190px">
        <hr>
        <button type="button" class="btn btn-secondary" onclick="$('#add-dialog').dialog('close');">取消</button>
        <button type="submit" class="btn btn-primary" formaction="RawMaterialsListServletAdd">确定</button>
    </form>
</div>

<style>
    .ui-dialog-titlebar-close {
        display: none;
    }
</style>

<script>
    $('#add-dialog').dialog({
        width: 310,
        autoOpen: false,
        draggable: false,
        modal: true,
        resizable: false
    });
    $('.btn-add').click(function () {
        $('#add-dialog').dialog('open');
    });
    $(function () {
        $("#add-dialog").dialog({
            autoOpen: false,
            modal: true,
        });
    });
</script>

</body>
</html>

