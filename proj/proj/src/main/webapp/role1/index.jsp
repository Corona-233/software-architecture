<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
  <script src="../resources/js/jquery-1.10.2.js"></script>
  <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
  <title>超级管理员</title>
  <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<div id="page" class="container">
  <div id="header">
    <div id="logo">
      <a href="../index.jsp" style="text-decoration: none; color: white; font-size: 40px">菜单</a>
      <p style="color: #9fcdff">超级管理员</p>
    </div>

    <div id="menu" >
      <ul>
        <li class="current_page_item"><a href="index.jsp">主页</a></li>
        <li><a href="RawMaterialsListServletSearch">原材料清单</a></li>
        <li><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
        <li><a href="DriverListServletSearch">驾驶员列表</a></li>
        <li><a href="VehicleListServletSearch">车辆列表</a></li>
        <li><a href="WaysServletSearch">运输线路</a></li>
        <li><a href="ExperimentServletSearch">土工实验员界面</a></li>
        <li><a href="AcceptanceServletSearch">工地验收人员界面</a></li>
      </ul>
    </div>
  </div>

  <div id="main" >
    <div class="top">
      <h2>你好，超级管理员！</h2>
    </div>
  </div>
</div>

</body>
</html>
