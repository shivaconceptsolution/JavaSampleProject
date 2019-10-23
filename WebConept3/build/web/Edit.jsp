<%-- 
    Document   : Edit
    Created on : Oct 16, 2019, 10:39:32 AM
    Author     : DELL
--%>

<%@page import="dao.Datahelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
         
        Datahelper.connection();
         ResultSet res =Datahelper.dqlOperation("select * from reg where id='"+request.getParameter("q")+"'");
         if(res.next())
         {
         
        %>
        <form action="UpdateAdminSer" method="post">
            <input type="hidden" value="<%= res.getInt(1) %>" name="txtid" />
        <p>Email Id is : <input type="text" name="txtemail"  value="<%= res.getString(2)   %>" /> </p>
        <p>Password Id is : <input type="text" name="txtpass"  value=" <%= res.getString(3)   %>" /> </p>
        <p>Mobile no is : <input type="text" name="txtmobile"  value=" <%= res.getString(4)   %>" /> </p>
        <p>Fullname is :  <input type="text" name="txtfname"  value="<%= res.getString(5)   %>" /> </p>
        <p><input type="submit" value="Update" name="btnupdate" /></p>
        </form>
        <%
         }
         %>
    </body>
</html>
