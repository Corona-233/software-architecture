package servlet.DeliveryOrderServlet;

import dao.DeliveryOrderDao;
import entity.DeliveryOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/role1/DeliveryOrderServletUpdate")
public class DeliveryOrderServletUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String task_num = request.getParameter("task_num");
        String project_name = request.getParameter("project_name");
        String construction_site = request.getParameter("construction_site");
        String concrete_mark = request.getParameter("concrete_mark");
        String plan_cubic_meter = request.getParameter("plan_cubic_meter");
        String actual_cubic_meter = request.getParameter("actual_cubic_meter");
        String production_date  = request.getParameter("production_date");

        DeliveryOrderDao dao = new DeliveryOrderDao();
        try {
            dao.updateDeliveryOrder(id,task_num,project_name,construction_site,concrete_mark,plan_cubic_meter,actual_cubic_meter,production_date);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("DeliveryOrderServletSearch");
    }
}
