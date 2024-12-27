package servlet.DriverListServlet.role2;

import dao.DriverListDao;
import entity.DriverList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/role2/DriverListServletSearch")
public class DriverListServletSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String key = request.getParameter("key");
        DriverListDao dao = new DriverListDao();
        List<DriverList> driverLists;
        if (key == null || key.isEmpty()) {
            try {
                driverLists = dao.getAllDrivers();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            // 转发到显示所有驾驶员信息的 JSP 页面
            request.setAttribute("driverLists", driverLists);
            request.getRequestDispatcher("driver_list.jsp").forward(request, response);
        } else {
            // 搜索逻辑
            driverLists = dao.searchDrivers(key); // 假设 searchDrivers 方法实现搜索功能

            // 转发到显示搜索结果的 JSP 页面
            request.setAttribute("driverLists", driverLists);
            request.getRequestDispatcher("/role1/driver_list.jsp").forward(request, response);
        }
    }
}