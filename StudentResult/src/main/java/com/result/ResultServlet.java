package com.result;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class ResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 Direct enrollment number request se lena (OTP hata diya)
        String enroll = request.getParameter("enroll");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentresult",
                "root",
                "devpathak"
            );

            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM students WHERE enrollment_no=?");

            ps.setString(1, enroll);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Result JSP ko data bhejna
                request.setAttribute("rs", rs);
                RequestDispatcher rd =
                        request.getRequestDispatcher("result.jsp");
                rd.forward(request, response);

            } else {
                response.getWriter().println("Result Not Found");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}