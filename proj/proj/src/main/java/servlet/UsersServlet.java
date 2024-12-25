package servlet;
import dao.RawMaterialsListDao;
import entity.RawMaterialsList;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/login")
public class UsersServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/proj";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123456";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("roleId"));  // 假设通过 ID 登录
        User user = getUserById(userId);  // 从数据库获取用户信息

        if (user != null) {
            // 设置用户信息到 session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("roleId", user.getRoleId());

            // 根据权限跳转到对应目录的 index.jsp
            String redirectPage = getRedirectPage(user.getRoleId());
            response.sendRedirect(redirectPage);  // 跳转到对应目录的 index.jsp
        } else {
            response.sendRedirect("loginFailed.jsp");  // 用户不存在或登录失败
        }
    }

    private String getRedirectPage(int roleId) {
        // 根据 roleId 返回不同的目录路径
        if (roleId == 1) {
            return "role1/index.jsp";  // 权限1对应 role1 目录
        } else if (roleId == 2) {
            return "role2/index.jsp";  // 权限2对应 role2 目录
        } else if (roleId == 3) {
            return "role3/index.jsp";  // 权限3对应 role3 目录
        } else if (roleId == 4) {
            return "role4/index.jsp";  // 权限3对应 role3 目录
        }
        return "login.jsp";  // 默认跳转到登录页面
    }

    private User getUserById(int userId) {
        User user = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 创建数据库连接
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // 编写 SQL 查询
            String sql = "SELECT id, name, roleId FROM users WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            // 执行查询
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // 从结果集中获取数据
                String name = rs.getString("name");
                int roleId = rs.getInt("roleId");

                // 创建 User 对象并返回
                user = new User(userId, name, roleId);
            }

            // 关闭连接
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}