<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>

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
                   type: 'post',
                   url: 'addcatajax.jsp',
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
                          $('#msg').html("Category added successfully");   
                          $("#msg").delay(3500).fadeOut(1000);
                        } 
                        else if($.trim(reslt) == "CategoryN")
                        {
                             $('#msg').html("Category not added successfully");
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
        <title>Add Category</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
      <%
            if(session.getAttribute("utype")==null || !session.getAttribute("utype").equals("admin"))
            {
                response.sendRedirect("login.jsp?msg=true");
            }  
        %>
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Add Category</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Add Category</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Add Category</h3>
			<div class="register">
                            <form name="form2"></form>
                <form action="#" method="post" enctype="multipart/form-data" id="form1">			
                        <input placeholder="Category Name" name="catname" type="text" required=""><br/><br/>	
                      
                        <input type="file" name="catpic" class="form-control">	
                        <div class="sign-up">
                            <input type="submit" value="Add Category" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
