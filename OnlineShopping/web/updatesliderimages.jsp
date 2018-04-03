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
                   url: 'updatesliderimagesajax.jsp',
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
                          $('#msg').html("Slider Image updated successfully"); 
                           window.location.replace("managesliderimages.jsp");
                        } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("Slider Image not updated successfully");
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
        <title>Update Slider Image</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Slider Image </h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Slider Image</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String spic="";
        String id = request.getParameter("sid");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {

                
                String q = "select * from addslider where Srno=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, id);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                   
                    spic=res.getString("sliderpic");
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
                    	
                    <%
                        out.print("<img src='uploads/" + spic + "' width='75'>");
                    %>
                    
                    <input type="hidden" name="oldpic" value="<%out.print(spic);%>"/>
                    <input type="hidden" name="oldid" value="<%out.print(id);%>"/>
                        <input type="file" name="sliderpic" class="form-control">	
                        <div class="sign-up">
                            <input type="submit" value="Update Ocassion" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     <%@include file="footer.jsp" %>
    </body>
</html>
