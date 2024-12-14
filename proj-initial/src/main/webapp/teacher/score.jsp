<%@ page import="entity.Teacher" %>
<%@ page import="entity.Score" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.StudentD" %>
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
    ArrayList<Score> stus = (ArrayList<Score>) session.getAttribute("onePageScore");
    int sumIndex = (int) session.getAttribute("sumScoreIndex");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <h1><%=teacher.getName()%>老师</h1>
        </div>
        <div id="menu">
            <ul>
                <li><a href="personal.jsp">个人信息</a></li>
                <li><a href="../one_page_student">学生管理</a></li>
                <li class="current_page_item"><a href="../one_page_score">成绩管理</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>学生成绩管理</h2>
            <hr/>
        </div>
        <form method="post" action="../update_score" style="height: 525px; margin-top: 20px">
            <input type="submit" class="btn-add" style="float: right;margin-bottom: 30px" value="修改">
            <div class="table" style="margin-top: 20px; height: 525px">
                <table id="table" width="800" frame="box" align="center">
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
                            StudentD stuD = new StudentD();
                            for (Score stu : stus) {
                                String name = stuD.findWithId(stu.getId()).getName();
                                String major = stuD.findWithId(stu.getId()).getMajor();
                    %>
                    <tr>
                        <td height="35"><%=stu.getId()%></td>
                        <td><%=name%></td>
                        <td><%=major%></td>
                        <td><input value="<%=stu.getDatabase()==null ? "0" :stu.getDatabase() %>" name="database" class="table-input"></td>
                        <td><input value="<%=stu.getAndroid()==null ? "0" :stu.getAndroid() %>" name="android" class="table-input"></td>
                        <td><input value="<%=stu.getJsp()==null ? "0" :stu.getJsp() %>" name="jsp" class="table-input"></td>
                        <input value="<%=stu.getId()%>" name="id" type="hidden">
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>

            </div>
        </form>

        <%
            if (sumIndex > 1){
        %>
                <div id="index">
                    <a href="../one_page_score?index=1">首页</a>
                    <%
                        for (int i = 1; i <= sumIndex; i++) {
                    %>
                    <a href="../one_page_score?index=<%=i%>">第<%=i%>页</a>
                    <%
                        }
                    %>
                    <a href="../one_page_score?index=<%=sumIndex%>">尾页</a>
                </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>

