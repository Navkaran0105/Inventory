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
                         // window.location.replace("managecat.jsp");
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
                  url: 'delcat.jsp',
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
 
});
</script>    
        <title>Manage Category</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Manage Category</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Manage Category</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Manage Category</h3>
			<div class="register">
            <%              
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addcat";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<table width='100%' class='table table-hover'><tr><th>Picture</th><th>Category Name</th><th>Update</th><th>Delete</th></tr>");
                            do
                            {                     
                                out.print("<tr><td><img src='uploads/"  + res.getString("catpic") + "' width='75'></td><td>" + res.getString("catname") + "</td><td><a href='updatecat.jsp?cid=" + res.getString("catid") + "'>Update</a></td><td><a class='mylink' href='#' id='" + res.getString("catid") + "'>Delete</a></td>");
                            }
                            while(res.next());
                            out.print("</table>");
                        }
                        else
                        {
                             out.print("<option>No Categories</option>");
                        }
                   }
                   catch(Exception e)
                       
                   {
                       out.print("Error in query " + e.getMessage());
                   }
                   finally
                   {
                       myconn.close();
                   }
            }
            catch(Exception e)
            {
                out.print("Error in connection " + e.getMessage());
            }

%>
                        </div>
		</div>
	</div>
     <%@include file="footer.jsp" %>
    </body>
</html>
