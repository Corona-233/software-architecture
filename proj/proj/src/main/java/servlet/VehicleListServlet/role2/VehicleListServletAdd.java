package servlet.VehicleListServlet.role2;

import dao.VehicleListDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role2/VehicleListServletAdd")
public class VehicleListServletAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String vehicleNum = request.getParameter("vehicle_num");
        String registerationDate = request.getParameter("registeration_date");
        String model = request.getParameter("model");
        String internalNum = request.getParameter("internal_num");
        String curbWeight = request.getParameter("curb_weight");
        String totalWeight = request.getParameter("total_weight");
        String mixerVolume = request.getParameter("mixer_volume");
        String isWorking = request.getParameter("is_working");

        VehicleListDao dao = new VehicleListDao();
        dao.addVehicle(vehicleNum, registerationDate, model, internalNum, curbWeight, totalWeight, mixerVolume, isWorking);

        response.sendRedirect("VehicleListServletSearch");
    }
}
