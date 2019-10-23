<style>
    section h1{
        color:white;
    }
    section p
    {
        margin-top: 5px;
        color:white;
    }
    
</style> 
<%@include  file="header.jsp" %>
 
 <section>
     <center>
        <h1>Admin Login Form</h1>
        <hr>
         <form action="Adminloginser" method="post">
            
            <p>Enter emailid</p>
            <p><input type="text" name="txtemail" required=""  /> </p>
            <p>Enter password</p>
            <p><input type="password" name="txtpass" required=""  /> </p>
            <p></p>
            <p><input type="submit" name="btnsubmit" value="Login" /> </p>
         </form>
         <%
          if(request.getParameter("q")!=null)
          {
              out.print(request.getParameter("q"));
          }
             
             
          %>
          
     </center>
 </section>
 
  <%@include  file="footer.jsp" %>
   