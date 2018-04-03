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
        <title>Manage Product</title>
<script>
$(document).ready(function ()
{
    
         $("#category").change(function()
	{
		var cid = $(this).val();
		$.ajax(
		{
                    url: 'showsubcatajax.jsp',
                    type: 'post',
                    data: {"catid":cid},
                    beforeSend: function () 
                    { 
                            $("#subcatloader").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#subcatloader").html(""); 
                         $('#subcategory').html(result);
                    },
                      error: function(e) 
                    {
                          $('#subcatloader').html("Error in Ajax");
                    }
		});
                });
                
                
         $("#subcategory").change(function()
	{
                    var cid = $("#category").val();	
                    var scid = $(this).val();
                    $.ajax(
		{
                    url: 'manageproductajax.jsp',
                    type: 'post',
                    data: {"catid":cid,"scid":scid},
                    beforeSend: function () 
                    { 
                            $("#msg").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#msg").html(""); 
                         $('#msg').html(result);
                         delproduct();
                    },
                      error: function(e) 
                    {
                          $('#msg').html("Error in Ajax");
                    }
		});
                });
                
    function delproduct()
    {
        $(".mylink").click(function(e)
        {
            e.preventDefault();
            var pid=$(this).attr("id");
            var pr1=$(this).parent();//td
            var pr=$(this).parent().parent();//tr
            if(confirm("Are you sure you want to delete?"))
            {
		$.ajax(
                {
                  url: 'delproduct.jsp',
                  type: 'post',
                  data: {"prodid":pid},
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
        
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Manage Product</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Manage Product</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Manage Product</h3>
			<div class="register">
                <form action="#" method="post">
                    
                    <select name="category" id="category" class="form-control">
                        <option value="">Choose Category</option> 
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
                            do
                            {                     
                                out.print("<option value='" + res.getString("catid") + "'>" + res.getString("catname") + "</option>");
                               // out.print("<option value='100'>Men Apparels</option>");
                            }
                            while(res.next());
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
                    </select><div id="subcatloader"></div><br/>
        
            <select name="subcategory" id="subcategory" class="form-control">
            <option value="">Choose Sub Category</option> 
           
                    </select><br/>
        
                <div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
