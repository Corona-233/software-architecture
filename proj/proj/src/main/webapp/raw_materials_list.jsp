<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="resources/css/jquery-ui-1.10.4.custom.min.css">
    <script src="resources/js/jquery-1.10.2.js"></script>
    <script src="resources/js/jquery-ui-1.10.4.custom.min.js"></script>
    <title>原材料清单</title>
    <link href="resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <h1>菜单</h1>
        </div>
        <div id="menu" >
            <ul>
                <li class="current_page_item"><a href="#">原材料清单</a></li>
                <li><a href="#">车辆列表</a></li>
                <li><a href="#">驾驶员列表</a></li>
                <li><a href="#">监控设备列表</a></li>
                <li><a href="#">监控中心</a></li>
                <li><a href="#">混凝土出料单</a></li>
            </ul>
        </div>
    </div>
    <div id="main" >
        <div class="top">
            <h2>原材料清单</h2>
            <hr/>
            <button class="btn-add">新建</button>
            <div class="find">
                <form action="../one_page_student" method="post">
                    <input id="find-text" type="text" name="key" placeholder="搜索">
                    <input class="find-btn" type="submit" value="搜索">
                </form>
            </div>
        </div>
        <div class="table">
            <table id="table">
                <tr>
                    <th height="35">日期</th>
                    <th>单号</th>
                    <th>原材料名称</th>
                    <th>净重</th>
                    <th>车号</th>
                    <th>货物规格</th>
                    <th>供货单位</th>
                    <th>操作</th>
                </tr>
                <tr>
                    <form method="post" action="../update_student">
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input value="" name="stusex" class="table-input" style="width: 80px"></td>
                        <td><input type="submit" class="update-btn" value="修改">&nbsp;
                            <a class="btn-delete" onclick="return confirm('确定要删除吗?');" href=<%="'../delete_student?id='"%>>删除</a>&nbsp;&nbsp;
                            <a href="../one_page_score?id=">查看</a>
                        </td>
                    </form>
                </tr>

            </table>
        </div>

    </div>
</div>

<%--添加学生信息对话框--%>
<div id="add-dialog" title="添加原材料清单">
    <form id="add-form" method="post">
        学号:<input name="id" type="text" required><br>
        姓名:<input name="name" type="text"><br>
        性别:<input name="sex" type="text"><br>
        专业:
        <select name="major" style="width: 190px">
            <option value="计算机科学与技术">计算机科学与技术</option>
            <option value="自动化">自动化</option>
            <option value="软件工程">软件工程</option>
            <option value="人工智能">人工智能</option>
        </select>
        <br>
        入学日期:<input name="school_date" type="month" style="width: 190px">
        <hr>
        <input style="float: right" type="submit" value="取消" onclick="function x() {
          $('#add-dialog').dialog('close');
        }">
        <input style="float: right; margin-right: 25px" type="submit" value="确定"
               onclick="this.form.action='../add_student'">
    </form>
</div>

<style>
    .ui-dialog-titlebar-close {
        display: none
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
</script>
</body>
</html>

