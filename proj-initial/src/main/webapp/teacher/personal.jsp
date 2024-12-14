<%@ page import="entity.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>老师界面</title>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    Teacher teacher = (Teacher) session.getAttribute("info");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <h1><%=teacher.getName()%>老师</h1>
        </div>
        <div id="menu">
            <ul>
                <li class="current_page_item"><a href="personal.jsp">个人信息</a></li>
                <li><a href="../one_page_student">学生管理</a></li>
                <li><a href="../one_page_score">成绩管理</a></li>
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
            <form method="post" action="../update_teacher" class="personalForm">
                <input name="uid" value="<%=teacher.getId()%>" type="hidden">
                姓名: <input type="text" name="name" value="<%=teacher.getName()%>" class="personalInput"><br>
                性别: <input type="text" name="sex" value="<%=teacher.getSex()%>" class="personalInput"><br>
                邮箱: <input type="text" name="email" value="<%=teacher.getEmail()%>" class="personalInput"><br>
                密码: <input type="text" name="password" value="<%=teacher.getPassword()%>" class="personalInput"><br>
                <input type="submit" value="保存" style="width: 100px; height: 30px; margin-top: 20px">
            </form>
        </div>
    </div>
</div>
</body>
</html>
