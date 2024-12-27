package servlet.AcceptanceServlet.role1;
import dao.DeliveryOrderDao;
import entity.DeliveryOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/role1/AcceptanceServletSearch")
public class AcceptanceServletSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String key = request.getParameter("key");
        List<DeliveryOrder> deliveryOrders = null;
        DeliveryOrderDao dao = new DeliveryOrderDao();
        if (key == null || key.isEmpty()) {
            try {
                deliveryOrders=dao.getAllDeliveryOrder();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        } else {
            try {
                deliveryOrders=dao.getKeyDeliveryOrder(key);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        request.setAttribute("acceptance", deliveryOrders);

        RequestDispatcher dispatcher = request.getRequestDispatcher("acceptance.jsp");
        dispatcher.forward(request,response);
    }
}
