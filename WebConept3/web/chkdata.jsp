<%@page import="java.sql.*" %>
<%
                   
    String data = request.getParameter("q");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb","root","");
    Statement st = con.createStatement();
    ResultSet res = st.executeQuery("select * from reg where email = '"+data+"'");
    if(res.next())
    {
    out.print("emailid already exist"); 
    }
    
  %>
   