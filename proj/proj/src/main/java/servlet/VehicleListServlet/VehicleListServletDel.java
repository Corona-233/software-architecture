package servlet.VehicleListServlet;

import dao.VehicleListDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role1/VehicleListServletDel")
public class VehicleListServletDel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        VehicleListDao dao = new VehicleListDao();
        dao.deleteVehicle(id);

        response.sendRedirect("VehicleListServletSearch");
    }
}
