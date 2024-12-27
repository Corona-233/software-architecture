<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.DeliveryOrder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
  <script src="../resources/js/jquery-1.10.2.js"></script>
  <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
  <title>运输线路界面</title>
  <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
  List<DeliveryOrder> deliveryOrders = (List<DeliveryOrder>) request.getAttribute("deliveryOrders");
  if (deliveryOrders == null) {
    deliveryOrders = new ArrayList<>();  // 如果为 null，初始化为空列表
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
        <li><a href="index.jsp">主页</a></li>
        <li><a href="RawMaterialsListServletSearch">原材料清单</a></li>
        <li><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
        <li><a href="DriverListServletSearch">驾驶员列表</a></li>
        <li><a href="VehicleListServletSearch">车辆列表</a></li>
        <li class="current_page_item"><a href="WaysServletSearch">运输线路</a></li>
      </ul>
    </div>
  </div>
  <div id="main">
    <div class="top">
      <h2>运输线路</h2>
      <hr/>
      <div class="find">
        <form action="" method="post">
          <input id="find-text" type="text" name="key" placeholder="输入单号查询">
          <input class="find-btn" type="submit" value="搜索">
        </form>
      </div>
    </div>
    <div class="table">
      <table id="table">
        <tr>
          <th height="35"></th>
          <th>出料单号</th>
          <th>项目名称</th>
          <th>施工部位</th>
          <th>运输路线</th>
          <th>计划方量</th>
          <th>实际方量</th>
          <th>生产日期</th>
          <th>操作</th>
        </tr>
        <%
          for(DeliveryOrder deliveryOrder : deliveryOrders){
        %>
        <tr>
          <form method="post" action="DeliveryOrderServletUpdate">
            <td><input value="<%=deliveryOrder.getId()%>" name="id" hidden="hidden"></td>
            <td><input value="<%=deliveryOrder.getTask_num()%>" name="task_num" class="table-input" ></td>
            <td><input value="<%=deliveryOrder.getProject_name()%>" name="project_name" class="table-input" style="width: 100px" ></td>
            <td><input value="<%=deliveryOrder.getConstruction_site()%>" name="construction_site" class="table-input" ></td>
            <td><input value="<%=deliveryOrder.getWay()%>" name="way" class="table-input" style="width: 50px" ></td>
            <td><input value="<%=deliveryOrder.getPlan_cubic_meter()%>" name="plan_cubic_meter" class="table-input" ></td>
            <td><input value="<%=deliveryOrder.getActual_cubic_meter()%>" name="actual_cubic_meter" class="table-input" style="width: 100px" ></td>
            <td><input value="<%=deliveryOrder.getProduction_date()%>" name="production_date" class="table-input" style="width: 120px" ></td>
            <td>
              &nbsp;&nbsp;<a href="../ways/<%=deliveryOrder.getWay()%>.png" target="_blank">查看</a>
            </td>
          </form>
        </tr>
        <%
          }
        %>
      </table>
    </div>
  </div>
</div>

</body>
</html>

