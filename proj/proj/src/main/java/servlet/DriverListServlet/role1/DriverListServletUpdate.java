package servlet.DriverListServlet.role1;

import dao.DriverListDao;
import entity.DriverList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role1/DriverListServletUpdate")
public class DriverListServletUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String idNumber = request.getParameter("idNumber");
        String gender = request.getParameter("gender");
        String contactInfo = request.getParameter("contact");
        String vehicleType = request.getParameter("vehicleType");
        String licenseExpiry = request.getParameter("licenseExpiry");
        String isWorking = request.getParameter("isWorking");

        DriverList driver = new DriverList(id, name, idNumber, gender, contactInfo, vehicleType, licenseExpiry, isWorking);

        DriverListDao dao = new DriverListDao();
        dao.updateDriver(driver);

        response.sendRedirect("DriverListServletSearch");
    }
}