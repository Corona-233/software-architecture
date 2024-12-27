<%@ page import="entity.VehicleList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
  <script src="../resources/js/jquery-1.10.2.js"></script>
  <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
  <title>车辆列表</title>
  <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
  List<VehicleList> vehicleLists = (List<VehicleList>) request.getAttribute("vehicleLists");
  if (vehicleLists == null) {
    vehicleLists = new ArrayList<>();  // 如果为 null，初始化为空列表
  }
%>
<div id="page" class="container">
  <div id="header">
    <div id="logo">
      <a href="../index.jsp" style="text-decoration: none; color: white; font-size: 40px">菜单</a>
      <p style="color: #9fcdff">监管人员</p>
    </div>
    <div id="menu">
      <ul>
        <ul>
          <li><a href="index.jsp">主页</a></li>
          <li><a href="RawMaterialsListServletSearch">原材料清单</a></li>
          <li><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
          <li><a href="DriverListServletSearch">驾驶员列表</a></li>
          <li  class="current_page_item"><a href="VehicleListServletSearch">车辆列表</a></li>
          <li><a href="WaysServletSearch">运输线路</a></li>
        </ul>
      </ul>
    </div>
  </div>
  <div id="main">
    <div class="top">
      <h2>车辆列表</h2>
      <hr/>
      <button class="btn-add">新建</button>
      <div class="find">
        <form action="VehicleListServletSearch" method="post">
          <input id="find-text" type="text" name="key" placeholder="输入车牌号查询">
          <input class="find-btn" type="submit" value="搜索">
        </form>
      </div>
    </div>
    <div class="table">
      <table id="table">
        <tr>
          <th height="35"></th>
          <th>车牌号码</th>
          <th>注册日期</th>
          <th>车辆型号</th>
          <th>内部编号</th>
          <th>整备质量</th>
          <th>总重量</th>
          <th>搅拌容积</th>
          <th>状态</th>
          <th>操作</th>
        </tr>
        <% for (VehicleList vehicle : vehicleLists) { %>
        <tr>
          <form method="post" action="VehicleListServletUpdate">
            <td><input value="<%=vehicle.getId()%>" name="id" hidden="hidden"></td>
            <td><input value="<%=vehicle.getVehicleNum()%>" name="vehicle_num" class="table-input"></td>
            <td><input value="<%=vehicle.getRegisterationDate()%>" name="registeration_date" class="table-input"></td>
            <td><input value="<%=vehicle.getModel()%>" name="model" class="table-input"></td>
            <td><input value="<%=vehicle.getInternalNum()%>" name="internal_num" class="table-input"></td>
            <td><input value="<%=vehicle.getCurbWeight()%>" name="curb_weight" class="table-input"></td>
            <td><input value="<%=vehicle.getTotalWeight()%>" name="total_weight" class="table-input"></td>
            <td><input value="<%=vehicle.getMixerVolume()%>" name="mixer_volume" class="table-input"></td>
            <td><input value="<%=vehicle.getIsWorking()%>" name="is_working" class="table-input"></td>
            <td>
              <input type="submit" class="update-btn" value="修改">
              &nbsp;<a class="btn-delete" onclick="return confirm('确定要删除吗?');" href="VehicleListServletDel?id=<%=vehicle.getId()%>">删除</a>
              &nbsp;&nbsp;<a href="#">查看</a>
            </td>
          </form>
        </tr>
        <% } %>
      </table>
    </div>
  </div>
</div>

<%-- 添加车辆对话框 --%>
<div id="add-dialog" title="添加车辆" style="display:none;">
  <form id="add-form" method="post">
    车牌号码:<input name="vehicle_num" type="text" class="form-control"><br>
    注册日期:<input name="registeration_date" type="date" class="form-control" style="width: 190px"><br>
    车辆型号:<input name="model" type="text" class="form-control"><br>
    内部编号:<input name="internal_num" type="text" class="form-control"><br>
    整备质量:<input name="curb_weight" type="text" class="form-control"><br>
    总重量:<input name="total_weight" type="text" class="form-control"><br>
    搅拌容积:<input name="mixer_volume" type="text" class="form-control"><br>
    状态:<input name="is_working" type="text" class="form-control"><br>
    <hr>
    <button type="button" class="btn btn-secondary" onclick="$('#add-dialog').dialog('close');">取消</button>
    <button type="submit" class="btn btn-primary" formaction="VehicleListServletAdd">确定</button>
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
