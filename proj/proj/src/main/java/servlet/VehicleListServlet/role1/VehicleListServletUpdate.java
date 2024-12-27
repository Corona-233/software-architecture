package servlet.VehicleListServlet.role1;

import dao.VehicleListDao;
import entity.VehicleList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role1/VehicleListServletUpdate")
public class VehicleListServletUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String vehicleNum = request.getParameter("vehicle_num");
        String registerationDate = request.getParameter("registeration_date");
        String model = request.getParameter("model");
        String internalNum = request.getParameter("internal_num");
        String curbWeight = request.getParameter("curb_weight");
        String totalWeight = request.getParameter("total_weight");
        String mixerVolume = request.getParameter("mixer_volume");
        String isWorking = request.getParameter("is_working");

        VehicleList vehicle = new VehicleList(id, vehicleNum, registerationDate, model, internalNum, curbWeight, totalWeight, mixerVolume, isWorking);
        VehicleListDao dao = new VehicleListDao();
        dao.updateVehicle(vehicle);

        response.sendRedirect("VehicleListServletSearch");
    }
}
