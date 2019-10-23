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
        <script>
            function chkemail(a)
            {
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                document.getElementById("res").innerHTML= xmlhttp.responseText;         
                }
                xmlhttp.open("POST","chkdata.jsp?q="+a,true);
                xmlhttp.send();
            }
        </script>
        <h1>Employee Register Here</h1>
        <hr>
        
        <form action="RegSer" method="post" enctype="multipart/form-data">
            
            <p>Enter emailid</p>
            <p><input type="email" name="txtemail" required="" onblur="chkemail(this.value)"  /> </p>
           <div id="res">
           </div>
            <p>Enter password</p>
            <p><input type="password" name="txtpass" required=""  /> </p>
            <p>Enter mobileno</p>
            <p><input type="number" name="txtmobile"  required="" /> </p>
            <p>Enter fullname</p>
            <p><input type="text" name="txtfname" required="" /> </p>
            <p><input type="file" name="rimg"  /> </p>
            <p><input type="submit" name="btnsubmit" value="Click" /></p>
            
            
            
            
        </form>
     </center>
 </section>
<%@include  file="footer.jsp" %>