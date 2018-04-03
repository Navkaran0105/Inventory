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
    
        $.ajax(
                {
                   type: 'post',
                   url: 'manageoccassionajax.jsp',
                  
                    beforeSend: function () 
                    { 
                       $("#msg").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function (reslt)
                    {
                      
                             $('#msg').html(reslt);
                       color();
                    },
                    error: function (e)
                    {
                        $('#msg').html("error in ajax");
                    }
                });
                
       function color()
       {
        $(".mylink").click(function(e)
        {
            e.preventDefault();
            var cid=$(this).attr("id");
            var pr1=$(this).parent();//td
            var pr=$(this).parent().parent();//tr
            if(confirm("Are you sure you want to delete?"))
            {
		$.ajax(
                {
                  url: 'deleteoccassion.jsp',
                  type: 'post',
                  data: {"catid":cid},
                 beforeSend: function() 
                 {
                         pr1.append("<img src='pics/preloader.gif'>")
                 },
                  success: function(reslt) 
                    {
                          if($.trim(reslt)=="success")
                          {
                                  pr.css({'backgroundColor':'#fb6c6c'});
                                  pr.fadeOut(600,function()
                                  {
                                          pr.remove()
                                  })
                          }
                          else
                          {
                                  alert("Some Problem occured");
                          }
                    },
                  error: function(e) 
                          {
                                  alert("Error in Ajax")
                          }
                });
            }
         });      
     }
});
</script>    
        <title>Manage Occassion</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Manage Occassion</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Manage Occassion</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Manage Occassion</h3>
			<div class="register">
          
                        </div><div id="msg"></div>
		</div>
	</div>
     <%@include file="footer.jsp" %>
    </body>
</html>
