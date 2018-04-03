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
        <title>Stock Update</title>
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
		var sid = $(this).val();
		$.ajax(
		{
                    url: 'showprodajax.jsp',
                    type: 'post',
                    data: {"catid":cid,"subcatid":sid},
                    beforeSend: function () 
                    { 
                            $("#subcatloader").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#subcatloader").html(""); 
                         
                         $('#pro').html("<option>Choose Product</option>"+result);
                    },
                      error: function(e) 
                    {
                          $('#subcatloader').html("Error in Ajax");
                    }
		});
                });
                
                
                $("#pro").change(function()
	{
               
                var pid = $(this).val();
		$.ajax(
		{
                    url: 'showcolorajax.jsp',
                    type: 'post',
                    data: {"prodid":pid},
                    beforeSend: function () 
                    { 
                            $("#subcatloader").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#subcatloader").html(""); 
                         $('#rang').html("<option>Choose Color</option>"+result);
                    },
                      error: function(e) 
                    {
                          $('#subcatloader').html("Error in Ajax");
                    }
		});
                });
                $("#rang").change(function()
	{
                var pid = $("#pro").val();
                var rid = $(this).val();
		$.ajax(
		{
                    url: 'showsizeajax.jsp',
                    type: 'post',
                    data: {"rangid":rid,"pid":pid},
                    beforeSend: function () 
                    { 
                            $("#subcatloader").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#subcatloader").html(""); 
                         $('#size').html("<option>Choose Size</option>"+result);
                    },
                      error: function(e) 
                    {
                          $('#subcatloader').html("Error in Ajax");
                    }
		});
                });
                
                $("#size").change(function()
	{       
               var pid = $("#pro").val();
               var cid = $("#rang").val();
                var id = $(this).val();
		$.ajax(
		{
                    url: 'showstockajax.jsp',
                    type: 'post',
                   data: {"sizeid":id,"pid":pid,"cid":cid},
                    beforeSend: function () 
                    { 
                            $("#subcatloader").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                         $("#subcatloader").html(""); 
                         $('#stock').html(result);
                    },
                      error: function(e) 
                    {
                          $('#subcatloader').html("Error in Ajax");
                    }
		});
                });
                
                
        
        $('#form1').submit(function (e)
    {
        e.preventDefault();
       
        $.ajax(
                {
                   type: 'post',
                   url: 'updatestockajax.jsp',
                   data: $("#form1").serialize(),
		   
                    beforeSend: function () 
                    { 
                       $("#msg").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function (reslt)
                    {
                       
                         if ($.trim(reslt) == "ProductA")
                        {
                          $('#msg').html("Product added successfully");   
                        } 
                        else if($.trim(reslt) == "ProductN")
                        {
                             $('#msg').html("Product not added successfully");
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
</head>
<body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Stock Update</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Stock Update</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Stock Update</h3>
			<div class="register">
                <form action="#" method="post" id="form1">
                     	
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
        
                 <select name="product" id="pro" class="form-control">
            <option value="">Choose Product</option> 
            

                    </select><br/> 
                     <select name="color" id="rang" class="form-control">
            <option value="">Choose Color</option> 
                    </select><br/> 
                     <select name="Size" class="form-control" id="size">
            <option value="">Choose Size</option> 
             
            

                    </select>
                        
                        
                        <label id="stock"> </label>
                          <input placeholder="Enter New Stock" name="nstock" type="text" required=""><br/><br/>
                        <div class="sign-up">
                            <input type="submit" value="Update Product" name="submit"/>
                        </div>
        
         <div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>

