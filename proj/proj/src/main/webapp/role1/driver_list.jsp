<%@ page import="entity.DriverList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
  <script src="../resources/js/jquery-1.10.2.js"></script>
  <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
  <title>驾驶员列表界面</title>
  <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
  List<DriverList> driverLists = (List<DriverList>) request.getAttribute("driverLists");
  if (driverLists == null) {
    driverLists = new ArrayList<>();  // 如果为 null，初始化为空列表
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
        <li><a href="index.jsp">主页</a></li>
        <li><a href="RawMaterialsListServletSearch">原材料清单</a></li>
        <li><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
        <li class="current_page_item"><a href="DriverListServletSearch">驾驶员列表</a></li>
        <li><a href="VehicleListServletSearch">车辆列表</a></li>
        <li><a href="WaysServletSearch">运输线路</a></li>
        <li><a href="ExperimentServletSearch">土工实验员界面</a></li>
        <li><a href="AcceptanceServletSearch">工地验收人员界面</a></li>
      </ul>
    </div>
  </div>
  <div id="main">
    <div class="top">
      <h2>驾驶员清单</h2>
      <hr/>
      <button class="btn-add">新建</button>
      <div class="find">
        <form action="DriverListServletSearch" method="post">
          <input id="find-text" type="text" name="key" placeholder="输入姓名或身份证号查询">
          <input class="find-btn" type="submit" value="搜索">
        </form>
      </div>
    </div>
    <div class="table">
      <table id="table">
        <tr>
          <th height="35"></th>
          <th>姓名</th>
          <th>身份证号</th>
          <th>性别</th>
          <th>联系方式</th>
          <th>准驾车型</th>
          <th>驾照到期时间</th>
          <th>操作</th>
        </tr>
        <% for (DriverList driver : driverLists) { %>
        <tr>
          <form method="post" action="DriverListServletUpdate">
            <td><input value="<%=driver.getId()%>" name="id" hidden="hidden"></td>
            <td><input value="<%=driver.getName()%>" name="name" class="table-input"></td>
            <td><input value="<%=driver.getIdNumber()%>" name="idNumber" class="table-input"></td>
            <td><input value="<%=driver.getGender()%>" name="gender" class="table-input"></td>
            <td><input value="<%=driver.getContactInfo()%>" name="contact" class="table-input"></td>
            <td><input value="<%=driver.getVehicleType()%>" name="vehicleType" class="table-input"></td>
            <td><input value="<%=driver.getLicenseExpiry()%>" name="licenseExpiry" class="table-input" style="width: 100px"></td>
            <td>
              <input type="submit" class="update-btn" value="修改">
              &nbsp;<a class="btn-delete" onclick="return confirm('确定要删除吗?');" href="DriverListServletDel?id=<%=driver.getId()%>">删除</a>
              &nbsp;&nbsp;<a href="#">查看</a>
            </td>
          </form>
        </tr>
        <% } %>
      </table>
    </div>
  </div>
</div>

<!-- 添加驾驶员对话框 -->
<div id="add-dialog" title="添加驾驶员" style="display:none;">
  <form id="add-form" method="post">
    姓名:<input name="name" type="text" class="form-control"><br>
    身份证号:<input name="idNumber" type="text" class="form-control"><br>
    性别:<input name="gender" type="text" class="form-control"><br>
    联系方式:<input name="contact" type="text" class="form-control"><br>
    准驾车型:<input name="vehicleType" type="text" class="form-control"><br>
    驾照到期时间:<input name="licenseExpiry" type="text" class="form-control"><br>
    日期:<input name="date" type="date" class="form-control" style="width: 190px">
    <hr>
    <button type="button" class="btn btn-secondary" onclick="$('#add-dialog').dialog('close');">取消</button>
    <button type="submit" class="btn btn-primary" formaction="DriverListServletAdd">确定</button>
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