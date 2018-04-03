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
                   url: 'updatecatajax.jsp',
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
                          $('#msg').html("Category updated successfully");   
                          window.location.replace("managecat.jsp");
                        } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("Category not updated successfully");
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
        <title>Update Category</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Category</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Category</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String cname="",cpic="";
        String catid = request.getParameter("cid");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {

                
                String q = "select * from addcat where catid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, catid);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    cname=res.getString("catname");
                    cpic=res.getString("catpic");
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
			<h3>Update Category</h3>
			<div class="register">
                            <form name="form2"></form>
                <form action="#" method="post" enctype="multipart/form-data" id="form1">			
                    <input placeholder="Category Name" name="catname" type="text" required="" value="<%out.print(cname);%>"><br/><br/>	
                    <%
                        out.print("<img src='uploads/" + cpic + "' width='75'>");
                    %>
                    
                    <input type="hidden" name="oldpic" value="<%out.print(cpic);%>"/>
                    <input type="hidden" name="catid" value="<%out.print(catid);%>"/>
                        <input type="file" name="catpic" class="form-control">	
                        <div class="sign-up">
                            <input type="submit" value="Update Category" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
