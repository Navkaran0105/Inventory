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
                   url: 'updateocassionajax.jsp',
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
                          $('#msg').html("Ocassion updated successfully"); 
                           window.location.replace("manageoccassion.jsp");
                        } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("Ocassion not updated successfully");
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
        <title>Update Ocassion</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Ocassion </h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Ocassion</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String oname="",opic="";
        String id = request.getParameter("oid");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {

                
                String q = "select * from addocassion where id=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, id);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    oname=res.getString("Name");
                    opic=res.getString("Ocassionpic");
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
                    <input placeholder="Ocassion Name" name="oname" type="text" required="" value="<%out.print(oname);%>"><br/><br/>	
                    <%
                        out.print("<img src='uploads/" + opic + "' width='75'>");
                    %>
                    
                    <input type="hidden" name="oldpic" value="<%out.print(opic);%>"/>
                    <input type="hidden" name="oid" value="<%out.print(id);%>"/>
                        <input type="file" name="catpic" class="form-control">	
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
