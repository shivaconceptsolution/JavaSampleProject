/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.Datahelper;
import dao.Register;
import javax.servlet.http.Cookie;
/**
 *
 * @author DELL
 */
public class LoginSer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           Register obj = new Register();
           String email = request.getParameter("txtemail");
           String pass = request.getParameter("txtpass");
           obj.setEmail(email);
           obj.setPassword(pass);
          
           //Class.forName("com.mysql.jdbc.Driver");
           //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb","root","");
           //Statement st = con.createStatement();
           Datahelper.connection();
           //ResultSet res = st.executeQuery();
           ResultSet res = Datahelper.dqlOperation("select * from  `reg`  where `email`='"+obj.getEmail()+"' and  `password`='"+obj.getPassword()+"'");
           if(res.next())
            {
                HttpSession session=request.getSession();
                session.setAttribute("suid",email);
                session.setAttribute("suname", res.getString(4));
                Datahelper.closeConnection();
                 if(request.getParameter("chk")!=null)
           {
               Cookie ref = new Cookie("cuid",email);
               ref.setMaxAge(1000);
               response.addCookie(ref);
               Cookie ref1 = new Cookie("cpass",pass);
               ref1.setMaxAge(1000);
               response.addCookie(ref1);
           }
                response.sendRedirect("UserDashboard.jsp");
            }
           else
           {
               response.sendRedirect("Login.jsp?q="+"Invalid userid and password");
           }
           
        }
        catch(Exception ex)
        {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
