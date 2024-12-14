package servlet;

import dao.ScoreD;
import dao.StudentD;
import dao.TeacherD;
import entity.Student;
import entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DatabaseMetaData;
import java.sql.Date;

@WebServlet("/add_student")
public class add_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();

        StudentD studentD = new StudentD();
        ScoreD scoreD = new ScoreD();
        TeacherD teacherD = new TeacherD();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String major = request.getParameter("major");
        String school_date = request.getParameter("school_date");

        try {
            Teacher teacher =teacherD.findWithId(id);
            Student student =studentD.findWithId(id);
            if(teacher == null && student == null) {
                studentD.insertStudent(id, name, sex, school_date, major);
                scoreD.insertScore(id);
                out.print("<script>alert(\"添加成功！\");location.href = \"one_page_student\";</script>");
            }
            else {
                out.print("<script>alert(\"学号已被使用！\");location.href = \"one_page_student\";</script>");
            }
        }
        catch (Exception e){
            out.print(e);
        }
    }
}
