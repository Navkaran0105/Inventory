<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>

<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="extfiles.jsp" %>
        <script>
$(document).ready(function ()
{
    $('#form1').submit(function (e)
    {
        e.preventDefault();
        var formData = new FormData($(this)[0]);
        $.ajax(
                {
                    url: 'AddOcassionAjax.jsp',
                   type: 'post',
                   data: formData,
		   contentType: false,
		   cache: false,
		   processData: false,
                    beforeSend: function () 
                    { 
                       $("#msg").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function (reslt)
                    {
                        if ($.trim(reslt) == "Sorry")
                        {
                          $('#msg').html("Sorry only pictures are allowed to upload");
                        } 
                        else if ($.trim(reslt) == "CategoryA")
                        {
                          $('#msg').html("Ocassion added successfully");   
                        } 
                        else if($.trim(reslt) == "CategoryN")
                        {
                             $('#msg').html("Ocassion not added successfully");
                        }
                        else
                        {
                             $('#msg').html(reslt);
                        }
                    },
                    error: function (e)
                    {
                        $('#msg').html("error in ajax");
                    }
                });
    });
});
</script>    
        <title>Add ocassion</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Add ocassion </h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Add ocassion</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Add ocassion</h3>
			<div class="register">
                            <form name="form2"></form>
                <form action="#" method="post" enctype="multipart/form-data" id="form1">			
                       
                      <input placeholder="Ocassion Name" name="oname" type="text" required=""><br/><br/>
                        <input type="file" name="opic" class="form-control">	
                        <div class="sign-up">
                            <input type="submit" value="Add ocassion" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>

