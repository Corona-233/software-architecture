package servlet.RawMaterialsListServlet;

import dao.RawMaterialsListDao;
import entity.RawMaterialsList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/role1/RawMaterialsListServletSearch")
public class RawMaterialsListServletSearch1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String key = request.getParameter("key");
        RawMaterialsListDao dao = new RawMaterialsListDao();
        List<RawMaterialsList> rawMaterialsLists;
        if (key == null || key.isEmpty()) {
            try {
                rawMaterialsLists = dao.getAllRawMaterialsList();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            // 获取上下文路径（应用根路径）
            String contextPath = request.getContextPath(); // 获取应用上下文路径，如 "/proj_war_exploded"

            // 获取当前请求的 URI（包括子路径）
            String requestURI = request.getRequestURI(); // 如 "/proj_war_exploded/role1/RawMaterialsListServletSearch"

            // 提取子目录（如 /role1 或 /role2）
            String basePath = requestURI.substring(contextPath.length(), requestURI.lastIndexOf("/"));

            // 根据子目录拼接正确的 JSP 路径
            String jspPath = basePath + "/raw_materials_list.jsp";  // 确保跳转到正确的 JSP

            // 将查询结果传递到 JSP 页面
            request.setAttribute("rawMaterialsLists", rawMaterialsLists);

            // 使用 RequestDispatcher 跳转到正确的 JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
            dispatcher.forward(request, response);
        } else {
            // 搜索逻辑
            // 这里你可以根据 `key` 参数来过滤结果并返回到正确的 JSP
            rawMaterialsLists = dao.getkeyRawMaterialsList(key);

            // 获取上下文路径（应用根路径）
            String contextPath = request.getContextPath(); // 获取应用上下文路径，如 "/proj_war_exploded"

            // 获取当前请求的 URI（包括子路径）
            String requestURI = request.getRequestURI(); // 如 "/proj_war_exploded/role1/RawMaterialsListServletSearch"

            // 提取子目录（如 /role1 或 /role2）
            String basePath = requestURI.substring(contextPath.length(), requestURI.lastIndexOf("/"));

            // 根据子目录拼接正确的 JSP 路径
            String jspPath = basePath + "/raw_materials_list.jsp";  // 确保跳转到正确的 JSP

            // 将查询结果传递到 JSP 页面
            request.setAttribute("rawMaterialsLists", rawMaterialsLists);

            // 使用 RequestDispatcher 跳转到正确的 JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
            dispatcher.forward(request, response);

        }
    }
}
