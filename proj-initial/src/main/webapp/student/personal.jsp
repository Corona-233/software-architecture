<%@ page import="entity.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生界面</title>
    <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
    <script src="../resources/js/jquery-1.10.2.js"></script>
    <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    Student student = (Student) session.getAttribute("info");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <h1><%=student.getName()%>同学</h1>
        </div>
        <div id="menu">
            <ul>
                <li class="current_page_item"><a href="personal.jsp">个人信息</a></li>
                <li><a href="main.jsp">成绩信息</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>个人信息</h2>
            <hr/>
        </div>
        <div class="info">
            <div class="info">
                <form method="post" action="#" class="personalForm">
                    学号: <input name="uid" value="<%=student.getId()%>" class="personalInput" readonly><br>
                    姓名: <input type="text" name="name" value="<%=student.getName()%>" class="personalInput" readonly><br>
                    性别: <input type="text" name="sex" value="<%=student.getSex()%>" class="personalInput" readonly><br>
                    专业: <input type="text" name="email" value="<%=student.getMajor()%>" class="personalInput" readonly><br>
                </form>
            </div>
            <button class="password-btn" style="margin-top: 30px; height: 40px">修改安全信息</button>
        </div>
    </div>
</div>

<%--修改密码对话框--%>
<div id="password-dialog" title="修改邮箱和密码">
    <form id="password-form" method="post">
        <input type="hidden" name="id" value="<%=student.getId()%>">
        邮箱: &nbsp;&nbsp;<input type="email" name="email" value="<%=student.getEmail()%>"><br><br>
        新密码:<input type="password" name="password"><br>
        <hr>
        <input style="float: right" type="submit" value="取消" onclick="function x() {
          $('#add-dialog').dialog('close');
        }">
        <input style="float: right; margin-right: 25px" type="submit" value="保存"
               onclick="this.form.action='../update_student'">
    </form>
</div>

<script>
    $('#password-dialog').dialog({
        width: 340,
        autoOpen: false,
        draggable: false,
        modal: true,
        resizable: false
    });
    $('.password-btn').click(function () {
        $('#password-dialog').dialog('open');
    });
</script>

<style>
    .ui-dialog-titlebar-close {
        display: none
    }
</style>
</body>
</html>

