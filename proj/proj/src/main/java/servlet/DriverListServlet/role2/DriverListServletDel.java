package servlet.DriverListServlet.role2;

import dao.DriverListDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role2/DriverListServletDel")
public class DriverListServletDel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从请求中获取驾驶员ID
        int id = Integer.parseInt(request.getParameter("id"));

        // 创建DAO对象
        DriverListDao driverDao = new DriverListDao();

        // 调用DAO方法删除驾驶员信息
        driverDao.deleteDriver(id);

        // 重定向到驾驶员列表页面或其他适当的页面
        response.sendRedirect("DriverListServletSearch"); // 假设这是搜索驾驶员的Servlet映射
    }
}