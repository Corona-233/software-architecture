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
  <title>出料单界面</title>
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
        <li  class="current_page_item"><a href="DeliveryOrderServletSearch">混凝土出料单</a></li>
        <li><a href="DriverListServletSearch">驾驶员列表</a></li>
        <li><a href="VehicleListServletSearch">车辆列表</a></li>
        <li><a href="WaysServletSearch">运输线路</a></li>
      </ul>
    </div>
  </div>
  <div id="main">
    <div class="top">
      <h2>出料单</h2>
      <hr/>
      <button class="btn-add">新建</button>
      <div class="find">
        <form action="experimentshow" method="post">
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
              <input type="submit" class="update-btn" value="修改">
              &nbsp;<a class="btn-delete" onclick="return confirm('确定要删除吗?');" href="DeliveryOrderServletDel?id=<%=deliveryOrder.getId()%>">删除</a>
              &nbsp;&nbsp;<a href="#">查看</a>
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

<%-- 添加原材料清单对话框 --%>
<div id="add-dialog" title="添加出场清单" style="display:none;">
  <form id="add-form" method="post">
    <!-- 使用 .form-row 包裹每三个输入项 -->
    <div class="form-row">
      <label for="task_num">出料单号:</label>
      <input name="task_num" type="text" class="form-control" id="task_num">

      <label for="project_name">项目名称:</label>
      <input name="project_name" type="text" class="form-control" id="project_name">

      <label for="concrete_mark">混凝土标号:</label>
      <input name="concrete_mark" type="text" class="form-control" id="concrete_mark">
    </div>
    <div class="form-row">
      <label for="way">运输路线:</label>
      <input name="way" type="text" class="form-control" id="way">

      <label for="production_date">生产日期:</label>
      <input name="production_date" type="date" class="form-control" id="production_date">

      <label for="purchase_unit">购买单位<span style="color:red">*</span>:</label>
      <input name="purchase_unit" type="text" class="form-control" id="purchase_unit">
    </div>
    <div class="form-row">
      <label for="plan_cubic_meter">计划方量:</label>
      <input name="plan_cubic_meter" type="text" class="form-control" id="plan_cubic_meter">

      <label for="contract_number">合同单号<span style="color:red">*</span>:</label>
      <input name="contract_number" type="text" class="form-control" id="contract_number">

      <label for="anti_seepage_level">抗渗等级<span style="color:red">*</span>:</label>
      <input name="anti_seepage_level" type="text" class="form-control" id="anti_seepage_level">
    </div>
    <div class="form-row">
      <label for="other_technical">其他技术要求<span style="color:red">*</span>:</label>
      <input name="other_technical" type="text" class="form-control" id="other_technical">

      <label for="concrete_strength">混凝土强度等级<span style="color:red">*</span>:</label>
      <input name="concrete_strength" type="text" class="form-control" id="concrete_strength">

      <label for="required_slab_fall">要求塌落度<span style="color:red">*</span>:</label>
      <input name="required_slab_fall" type="text" class="form-control" id="required_slab_fall">
    </div>
    <div class="form-row">
      <label for="design_ratio">设计配合比比例<span style="color:red">*</span>:</label>
      <input name="design_ratio" type="text" class="form-control" id="design_ratio">

      <label for="mixing_plant">发货搅拌站<span style="color:red">*</span>:</label>
      <input name="mixing_plant" type="text" class="form-control" id="mixing_plant">

      <label for="transport_distance">运输距离<span style="color:red">*</span>:</label>
      <input name="transport_distance" type="text" class="form-control" id="transport_distance">
    </div>
    <div class="form-row">
      <label for="actual_cubic_meter">实际方量<span style="color:red">*</span>:</label>
      <input name="actual_cubic_meter" type="text" class="form-control" id="actual_cubic_meter">

      <label for="remarks">备注<span style="color:red">*</span>:</label>
      <input name="remarks" type="text" class="form-control" id="remarks">

      <label for="construction_site">施工部位<span style="color:red">*</span>:</label>
      <input name="construction_site" type="text" class="form-control" id="construction_site">

    </div>
    <p><span style="color:red">填写时请注意：标*号的属性一经填写不可修改！</span></p>
    <hr>
    <button type="button" class="btn btn-secondary" onclick="$('#add-dialog').dialog('close');">取消</button>
    <button type="submit" class="btn btn-primary" formaction="DeliveryOrderServletAdd" @keyup.enter.native="submit">确定</button>
  </form>
</div>

<style>
  .ui-dialog-titlebar-close {
    display: none;
  }

  /* 弹出框的基本样式 */
  #add-dialog {
    position: relative;
    padding: 20px;
    font-size: 14px; /* 设置弹出框内的默认字体大小 */
    width: 90%; /* 增加宽度 */
    max-width: 1200px; /* 设置最大宽度，确保足够空间容纳6个表单项 */
    height: auto; /* 自动调整高度 */
    box-sizing: border-box; /* 确保padding被包含在width和height之内 */
    margin: auto; /* 居中 */
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    overflow: hidden; /* 防止内容溢出 */
  }

  #update-dialog {
    position: relative;
    padding: 20px;
    font-size: 14px; /* 设置弹出框内的默认字体大小 */
    width: 90%; /* 增加宽度 */
    max-width: 1200px; /* 设置最大宽度，确保足够空间容纳6个表单项 */
    height: auto; /* 自动调整高度 */
    box-sizing: border-box; /* 确保padding被包含在width和height之内 */
    margin: auto; /* 居中 */
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    overflow: hidden; /* 防止内容溢出 */
  }

  .form-row {
    display: grid;
    grid-template-columns: repeat(6, 1fr); /* 创建六列 */
    gap: 15px; /* 设置列之间的间距 */
    margin-bottom: 15px; /* 行与行之间的间距 */
  }

  .form-group {
    display: flex;
    flex-direction: column;
  }

  .form-group label {
    margin-bottom: 5px;
    font-size: 20px; /* 标签字体大小 */
    color: #333;
  }

  .form-control {
    width: 100%; /* 占满各自网格的宽度 */
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 12px; /* 减小输入框内的字体大小 */
    background-color: #fff;
    transition: border-color 0.3s ease;
  }

  .form-control:focus {
    border-color: #007bff;
    outline: none;
  }

  /* 操作按钮的样式 */
  .btn {
    float: right;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px; /* 减小按钮内的字体大小 */
    margin-top: 10px; /* 添加顶部间距 */
    transition: background-color 0.3s ease;
  }

  .btn-secondary {
    background-color: #6c757d;
    color: white;
  }

  .btn-primary {
    background-color: #007bff;
    color: white;
    margin-right: 10px;
  }

  .btn-secondary:hover,
  .btn-primary:hover {
    opacity: 0.9;
  }

  /* 清除浮动 */
  #add-dialog::after {
    content: "";
    display: table;
    clear: both;
  }

  /* 针对日期选择器的特殊样式 */
  input[type="date"] {
    width: 100%; /* 确保日期选择器与其它输入框宽度一致 */
  }

  /* 美化表单 */
  .form-group {
    background-color: #f9f9f9;
    border: 1px solid #eaeaea;
    border-radius: 4px;
    padding: 10px;
    transition: box-shadow 0.3s ease;
  }

  .form-group:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .form-control {
    border-color: #ddd;
  }

  .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  }
</style>

<script>
  $(function () {
    // 初始化对话框，只做一次初始化
    $('#add-dialog').dialog({
      width: '1200px', // 设置宽度为父容器的90%，也可以指定一个具体数值如800
      maxWidth: 800, // 设置最大宽度
      autoOpen: false,
      draggable: false,
      modal: true,
      resizable: false,
      open: function (event, ui) {
        // 当对话框打开时，可以在这里添加额外的样式或操作
        $(this).parent().css('max-height', '90vh'); // 确保高度不超过视口的90%
        $(this).css('overflow-y', 'auto'); // 如果内容超出，则允许滚动
      },

    });

    // 绑定按钮点击事件，打开对话框
    $('.btn-add').click(function () {
      $('#add-dialog').dialog('open');
    });
  });
</script>

</body>
</html>