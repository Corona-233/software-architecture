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


@WebServlet("/role1/DeliveryOrderServletAdd")
public class DeliveryOrderServletAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String task_num = request.getParameter("task_num");
        String project_name = request.getParameter("project_name");
        String construction_site = request.getParameter("construction_site");
        String concrete_mark = request.getParameter("concrete_mark");
        String plan_cubic_meter = request.getParameter("plan_cubic_meter");
        String actual_cubic_meter = request.getParameter("actual_cubic_meter");
        String production_date  = request.getParameter("production_date");
        String purchase_unit = request.getParameter("purchase_unit");
        String contract_number = request.getParameter("contract_number");
        String anti_seepage_level = request.getParameter("anti_seepage_level");
        String other_technical  = request.getParameter("other_technical");
        String concrete_strengh = request.getParameter("concrete_strengh");
        String design_ratio = request.getParameter("design_ratio");
        String required_slab_fall  = request.getParameter("required_slab_fall");
        String mixing_plant = request.getParameter("mixing_plant");
        String transport_distance = request.getParameter("transport_distance");
        String remarks = request.getParameter("remarks");

        DeliveryOrderDao dao = new DeliveryOrderDao();
        try {
            dao.addDeliveryOrder(task_num, project_name, concrete_mark, construction_site, production_date, purchase_unit, plan_cubic_meter, contract_number, anti_seepage_level, other_technical, concrete_strengh, design_ratio, required_slab_fall, mixing_plant, transport_distance,actual_cubic_meter, remarks);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("DeliveryOrderServletSearch");
    }
}
