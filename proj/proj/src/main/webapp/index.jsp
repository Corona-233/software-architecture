<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>混凝土质量追踪和动态监管系统</title>

    <!-- 内联CSS样式 -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000; /* 黑色背景 */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background-color: #333333; /* 深灰色背景 */
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            padding: 50px;
            width: 50%;
            text-align: center;
            box-sizing: border-box;
        }

        h1 {
            font-size: 2.5em;
            color: white; /* 白色标题 */
            margin-bottom: 30px;
        }

        p {
            font-size: 1.1em;
            margin-bottom: 30px;
            color: #f0f0f0; /* 浅灰色字体 */
        }

        .role-selection {
            display: flex;
            justify-content: space-between; /* 让选项均匀分布 */
            margin-bottom: 30px;
            text-align: left;
        }

        .role-selection label {
            font-size: 1.1em;
            margin: 0 15px;
            display: flex;
            align-items: center;
            color: #999; /* 默认灰色字体 */
            transition: color 0.3s ease;
        }

        .role-selection input[type="radio"]:checked + label {
            color: white; /* 选中时变为白色字体 */
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        button {
            background-color: #0066cc; /* 蓝色按钮 */
            color: white;
            font-size: 1.2em;
            padding: 12px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005bb5;
        }

        .center-container {
            margin-top: 20px;
        }

        .center-container a {
            text-decoration: none;
            font-size: 1.2em;
            color: #0066cc;
            font-weight: bold;
        }

        .center-container a:hover {
            color: #004c99;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>混凝土质量追踪和动态监管系统</h1>
    <p>请选择您的身份：</p>

    <form action="login" method="POST">
        <div class="role-selection">
            <label>
                <input type="radio" name="roleId" value="1" /> 超级管理员
            </label>
            <label>
                <input type="radio" name="roleId" value="2" /> 监管人员
            </label>
            <label>
                <input type="radio" name="roleId" value="3" /> 实验员
            </label>
            <label>
                <input type="radio" name="roleId" value="4" /> 验收人员
            </label>
        </div>

        <button type="submit">进入系统</button>
    </form>
</div>
</body>
</html>