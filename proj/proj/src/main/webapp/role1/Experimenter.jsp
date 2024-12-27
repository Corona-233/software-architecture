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
  <title>实验员界面</title>
  <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
  List<DeliveryOrder> deliveryOrders = (List<DeliveryOrder>) request.getAttribute("Experiment");
  if (deliveryOrders == null) {
    deliveryOrders = new ArrayList<>();  // 如果为 null，初始化为空列表
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
          <li><a href="DriverListServletSearch">驾驶员列表</a></li>
          <li><a href="VehicleListServletSearch">车辆列表</a></li>
          <li><a href="WaysServletSearch">运输线路</a></li>
          <li  class="current_page_item"><a href="ExperimentServletSearch">土工实验员界面</a></li>
          <li><a href="AcceptanceServletSearch">工地验收人员界面</a></li>
      </ul>
    </div>
  </div>
  <div id="main">
    <div class="top">
      <h2>出场清单</h2>
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
          <th>出料标号</th>
          <th>是否合格</th>
          <th>是否验收</th>
          <th>操作</th>
        </tr>
        <%
          for(DeliveryOrder deliveryOrder : deliveryOrders){
        %>
        <tr>
          <form method="post" action="DeliveryOrderServletUpdate">
            <td><input value="<%=deliveryOrder.getId()%>" name="id" hidden="hidden"></td>
            <td><input value="<%=deliveryOrder.getTask_num()%>" name="task_num" class="table-input"></td>
            <td><input value="<%=deliveryOrder.getProject_name()%>" name="project_name" class="table-input" style="width: 100px"></td>
            <td><input value="<%=deliveryOrder.getConstruction_site()%>" name="construction_site" class="table-input"></td>
            <td><input value="<%=deliveryOrder.getConcrete_mark()%>" name="concrete_mark" class="table-input" style="width: 50px"></td>
            <td>
              <%
                String isCheckout = deliveryOrder.getIs_checkout(); // 假设此方法返回String类型
                String isCheckoutText = "";

                if ("0".equals(isCheckout) || isCheckout == null || isCheckout.isEmpty()) {
                  isCheckoutText = "未验收";
                } else if ("-1".equals(isCheckout)) {
                  isCheckoutText = "不合格";
                } else if ("1".equals(isCheckout)) {
                  isCheckoutText = "合格";
                } else {
                  isCheckoutText = isCheckout; // 如果有其他情况，直接显示原始值
                }
              %>
              <!-- 直接在td中显示处理后的文本 -->
              <span class="table-input" style="width: 50px;"><%=isCheckoutText%></span>
            </td>
            <td>
              <%
                String Is_accept = deliveryOrder.getIs_accept(); // 假设此方法返回String类型
                String Is_acceptText = "";

                if ("0".equals(Is_accept) || Is_accept == null || Is_accept.isEmpty()) {
                  Is_acceptText = "未接收";
                } else if ("-1".equals(Is_accept)) {
                  Is_acceptText = "未接收";
                } else if ("1".equals(Is_accept)) {
                  Is_acceptText = "已接收";
                } else {
                  Is_acceptText = Is_accept; // 如果有其他情况，直接显示原始值
                }
              %>
              <!-- 直接在td中显示处理后的文本 -->
              <span class="table-input" style="width: 50px;"><%=Is_acceptText%></span>
            </td>
            <td>
              &nbsp;<a class="btn-delete" onclick="return confirm('确定合格吗?');" href="Check1?id=<%=deliveryOrder.getId()%>">合格</a>
              &nbsp;<a class="btn-delete" onclick="return confirm('确定不合格吗?');" href="Check2?id=<%=deliveryOrder.getId()%>">不合格</a>
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
    //初始化对话框，只做一次初始化
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

    //绑定按钮点击事件，打开对话框
    $('.btn-add').click(function () {
      $('#add-dialog').dialog('open');
    });
  });

</script>

</body>
</html>

