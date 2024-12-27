package servlet.AcceptanceServlet.role4;

import dao.DeliveryOrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/role4/Accept")
public class IsAccept extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(request.getParameter("id"));
        DeliveryOrderDao dao = new DeliveryOrderDao();
        try {
            dao.accept(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("AcceptanceServletSearch");
    }
}