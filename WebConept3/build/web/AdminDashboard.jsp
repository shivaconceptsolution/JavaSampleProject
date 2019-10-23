
<style type="text/css">
    table{
        color:white;
       top: 50px;
       position: relative;
        margin-left: 100px;
    }
    
    
</style>
<%@page import="dao.Datahelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="adminheader.jsp" %>

<section>
         <%
            if(session.getAttribute("auid")==null)
            {
                response.sendRedirect("AdminLogin.jsp");
            }
            
         %>  
       
       
       
        <table border="1">
            <tr><th>ID</th><th>EmailID</th><th>Password</th><th>Mobile</th><th>Fullname</th><th>Edit|Delete</th></tr>
            
        <%
         String email= (String) session.getAttribute("suid");
         Datahelper.connection();
         ResultSet res =Datahelper.dqlOperation("select * from reg");
         while(res.next())
         {    %>
         
            <tr><td><%= res.getInt(1) %></td><td><%= res.getString(2) %></td><td><%= res.getString(3) %></td><td><%= res.getString(4) %></td><td><%= res.getString(5) %></td>
                <td><a href="Edit.jsp?q=<%= res.getInt(1) %>">Edit</a>||<a href="Delete.jsp?q=<%= res.getInt(1) %>">Delete</a></td>
            </tr>
         
         
         <%
         }
         %>
            
            
        </table>  
        
</section>
         
         <%@include file="footer.jsp" %>