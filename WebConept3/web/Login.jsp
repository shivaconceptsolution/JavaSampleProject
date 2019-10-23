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

         <h1>Welcome in User Login</h1>
         <hr>
         <%
               String s="",u="";
            if(request.getCookies()!=null)
            {
            Cookie c[] = request.getCookies();
          
            for(int i=0;i<c.length;i++)
            {
                if(c[i].getName().equals("cuid"))
                {
                    s=c[i].getValue();
                }
                if(c[i].getName().equals("cpass"))
                {
                    u=c[i].getValue();
                }
            }
            
            }
             
             %>
         <form action="LoginSer" method="post">
            
            <p>Enter emailid</p>
            <p><input type="email" name="txtemail" required="" value="<%= s %>"  /> </p>
            <p>Enter password</p>
            <p><input type="password" name="txtpass" required="" value="<%= u %>"  /> </p>
            <p><input type="checkbox" value="rem" name="chk" <% if(s!=""){%> checked="" <%}%>/>Remember me</p>
            <p><input type="submit" name="btnsubmit" value="Login" /> </p>
            
         </form>
         <%
          if(request.getParameter("q")!=null)
          {
              out.print(request.getParameter("q"));
          }
             
             
          %>
          <br>
          <br>
        <a href="RegisterForm.jsp">New User Register Here</a>
     </center>
 </section>
          
           <%@include  file="footer.jsp" %>