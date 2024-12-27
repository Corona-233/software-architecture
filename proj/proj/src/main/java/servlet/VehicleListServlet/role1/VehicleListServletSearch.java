package servlet.VehicleListServlet.role1;

import dao.VehicleListDao;
import entity.VehicleList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/role1/VehicleListServletSearch")
public class VehicleListServletSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        VehicleListDao dao = new VehicleListDao();
        List<VehicleList> vehicleLists = dao.getAllVehicles();

        request.setAttribute("vehicleLists", vehicleLists);

        RequestDispatcher dispatcher = request.getRequestDispatcher("vehicle_list.jsp");
        dispatcher.forward(request, response);

    }
}
