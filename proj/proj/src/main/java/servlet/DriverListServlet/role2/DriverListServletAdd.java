package servlet.DriverListServlet.role2;

import dao.DriverListDao;
import entity.DriverList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/role2/DriverListServletAdd")
public class DriverListServletAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String idNumber = request.getParameter("idNumber");
        String gender = request.getParameter("gender");
        String contactInfo = request.getParameter("contact");
        String vehicleType = request.getParameter("vehicleType");
        String licenseExpiry = request.getParameter("licenseExpiry");

        // 创建驾驶员对象
        DriverList driver = new DriverList();
        driver.setName(name);
        driver.setIdNumber(idNumber);
        driver.setGender(gender);
        driver.setContactInfo(contactInfo);
        driver.setVehicleType(vehicleType);
        driver.setLicenseExpiry(licenseExpiry);

        // 创建DAO对象
        DriverListDao driverDao = new DriverListDao();

        // 调用DAO方法添加驾驶员信息
        boolean isAdded = driverDao.addDriver(driver);

        // 根据添加结果进行响应
        if (isAdded) { // 注意这里应该是 isAdded，确保变量名一致
            response.sendRedirect("DriverListServletSearch"); // 假设这是搜索驾驶员的Servlet映射
        } else {
            response.getWriter().println("Error in inserting record");
        }
    }
}