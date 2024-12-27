package servlet.RawMaterialsListServlet.role1;

import dao.RawMaterialsListDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/role1/RawMaterialsListServletAdd")
public class RawMaterialsListServletAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String date = request.getParameter("date");
        String odernum = request.getParameter("odernum");
        String name = request.getParameter("name");
        String weight = request.getParameter("weight");
        String vehicle_num = request.getParameter("vehicle_num");
        String specifications = request.getParameter("specifications");
        String supplier = request.getParameter("supplier");


        RawMaterialsListDao dao = new RawMaterialsListDao();
        dao.addRawMaterialsList(date, odernum, name, weight, vehicle_num, specifications, supplier);

        response.sendRedirect("RawMaterialsListServletSearch");
    }

}
