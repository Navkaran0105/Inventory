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
                   type: 'post',
                   url: 'updatesubcatajax.jsp',
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
                        else if ($.trim(reslt) == "success")
                        {
                          $('#msg').html("Sub Category updated successfully");  
                           window.location.replace("managesubcat.jsp");
                        } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("Sub Category not updated successfully");
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
        <title>Update Sub Category</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Sub Category</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Sub Category</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String scname="",scpic="",oldcatid="";
        String scatid = request.getParameter("sid");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {

                
                String q = "select * from addsubcat where subcatid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, scatid);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    oldcatid=res.getString("maincatid");
                    scname=res.getString("subcatname");
                    scpic=res.getString("subcatpic");
                } 
            } 
            catch (Exception e) 
            {
                out.print("Error in query " + e.getMessage());
            } 
            finally 
            {
                myconn.close();
            }
        } 
        catch (Exception e) 
        {
            out.print("Error in connection " + e.getMessage());
        }
%>  
	<div class="mail">
		<div class="container">
			<h3>Update Sub Category</h3>
			<div class="register">
                <form action="#" method="post" enctype="multipart/form-data" id="form1">			
                    <select name="category" class="form-control">
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
                                if(oldcatid.equals(res.getString("catid")))
                                {
                                    out.print("<option value='" + res.getString("catid") + "' selected>" + res.getString("catname") + "</option>");
                                }
                                else
                                {
                                    out.print("<option value='" + res.getString("catid") + "'>" + res.getString("catname") + "</option>");
                                }
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

                    </select>
                     
                    <input placeholder="Sub Category Name" name="subcatname" type="text" required="" value="<%out.print(scname);%>"><br/><br/>	
                    <img src="uploads/<%out.print(scpic);%>" width="75"/>
                    <input type="hidden" name="oldpicname" value="<%out.print(scpic);%>"/>
                    <input type="hidden" name="oldsubid" value="<%out.print(scatid);%>"/>
                     <input type="file" name="subcatpic" class="form-control">	
                        <div class="sign-up">
                            <input type="submit" value="Update Sub Category" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
