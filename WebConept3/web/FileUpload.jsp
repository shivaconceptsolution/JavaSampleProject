<%-- 
    Document   : FileUpload
    Created on : Oct 19, 2019, 10:25:51 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UploadSer" name="frm1" method="post" enctype="multipart/form-data">
            
            Enter name
            <br>
            <input type="text" name="txtname"  />
            <br>
            <br>
            Upload Text File
            <br>
            <input type="file" name="file" />
            <br>
            Upload Image File
            <br>
             <input type="file" name="file1" />
             <br>
            <input type="submit" name="btnsubmit" value="Upload" />
            
            
        </form>
    </body>
</html>
