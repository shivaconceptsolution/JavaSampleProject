
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  import="dao.Datahelper" %>

<style type="text/css">
    p,h1{
        color:white;
    }
    
    
</style>
<%@include file="userheader.jsp" %>


<section>
        <%
            if(session.getAttribute("suid")==null)
            {
                response.sendRedirect("Login.jsp");
            }
            
           
            
         %>   
          
        <h1>Welcome in <%=  session.getAttribute("suid")   %> In Dashboard</h1>
        <h1>Name is <%= session.getAttribute("suname")    %></h1>
        <%
         String email= (String) session.getAttribute("suid");
         Datahelper.connection();
         ResultSet res = Datahelper.dqlOperation("select * from reg where email='"+email+"'");
         if(res.next())
         {
         
        %>
        <p>Email Id is :  <%= res.getString(2)   %> </p>
        <p>Password Id is :  <%= res.getString(3)   %> </p>
        <p>Mobile no is :  <%= res.getString(4)   %> </p>
        <p>Fullname is :  <%= res.getString(5)   %> </p>
        <p><img src="upload/<%= res.getString(6)   %>" width="100" height="100"  />
        
        <%
         }
         Datahelper.closeConnection();
         %>
         
</section>
         <%@include  file="footer.jsp" %>