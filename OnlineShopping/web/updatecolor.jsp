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
       
        $.ajax(
                {
                   type: 'post',
                   url: 'updatecolorajax.jsp',
                   data: $("#form1").serialize(),
		   
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
                          $('#msg').html("Color updated successfully");   
                          window.location.replace("managecolor.jsp");              
                      } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("Color not updated successfully");
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
        <title>Update Color</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Color </h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Color</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String cname="",cpic="", ccode="";
        String id = request.getParameter("cid");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {

                
                String q = "select * from addcolor where colorid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, id);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    cname=res.getString("Name");
                 ccode=res.getString("colorcode");
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
                <form action="#" method="post" id="form1">			
                    <input placeholder="color Name" name="cname" type="text" required="" value="<%out.print(cname);%>"><br/><br/>	
<input placeholder="Color Code" name="cc" type="text" required="" value="<%out.print(ccode);%>"><br/><br/>	
                    
                    <input type="hidden" name="cid" value="<%out.print(id);%>"/>
                        
                        <div class="sign-up">
                            <input type="submit" value="Update Color" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     <%@include file="footer.jsp" %>
    </body>
</html>
