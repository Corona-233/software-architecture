<%@ page import="dao.StudentD" %>
<%@ page import="entity.Student" %>
<%@ page import="dao.ScoreD" %>
<%@ page import="entity.Score" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生界面</title>
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
                <li><a href="personal.jsp">个人信息</a></li>
                <li class="current_page_item"><a href="main.jsp">成绩信息</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>成绩信息</h2>
            <hr/>
        </div>
        <div class="table">
            <table width="800" frame="box" align="center">
                <tr>
                    <th height="35">学号</th>
                    <th>姓名</th>
                    <th>专业</th>
                    <th>数据库</th>
                    <th>Android</th>
                    <th>JavaWeb</th>
                </tr>
                <%
                    try {
                        ScoreD scoD = new ScoreD();
                        StudentD stuD = new StudentD();
                        Score stu = scoD.findWithId(student.getId());
                        String name = stuD.findWithId(student.getId()).getName();
                        String major = stuD.findWithId(student.getId()).getMajor();
                %>
                <tr>
                    <td height="35"><%=stu.getId()%></td>
                    <td><%=name%></td>
                    <td><%=major%></td>
                    <td><%=stu.getDatabase()%></td>
                    <td><%=stu.getAndroid()%></td>
                    <td><%=stu.getJsp()%></td>
                </tr>
                <%
                    }
                    catch (Exception e){
                        out.print(e);
                    }
                %>
            </table>
        </div>
    </div>
</div>
</body>
</html>

