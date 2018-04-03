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
        <title>Add Color</title>
        
<script>
$(document).ready(function()
{
	$("#form1").submit(function(e)
	{
		e.preventDefault();
		$.ajax(
		{
		  url: 'addcolorajax.jsp',
		  type: 'post',
		 data: $("#form1").serialize(),
                 beforeSend: function () 
		 { 
		 	$("#showname").html("<img src='pics/preloader.gif'>"); 
		 },
		 success: function(result) 
                    {
                          $('#showname').html(result);
                    },
		  error: function(e) 
			  {
				$('#showname').html("Error in Ajax");
			  }
		});
	});
        
       
	});
</script>
        
        
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Add Color</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul><li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Add Color</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Add Color</h3>
			<div class="register">
                <form action="#" method="post" id="form1">			
                        <input placeholder="Name" name="name" id="name" type="text" required=""><br/>
                       
                        <input placeholder="ColorCode" name="Code" type="text" required="">
                        <div class="sign-up">
                            <input type="submit" value="Add Color" name="submit" id="b1"/>
                        </div> <div id="showname"></div>
                        
                         
                </form>
        </div>
		</div>
	</div>
     <%@include file="footer.jsp" %>
    </body>
</html>
