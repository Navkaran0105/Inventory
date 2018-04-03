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
        <title>Change Password</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Change Password</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
	<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Change Password</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Change Password</h3>
			<div class="register">
                <form action="#" method="post">			
                        <input placeholder="Current Password" name="currpass" type="password" required="">	
                        <input placeholder="New  Password" name="newpass" type="password" required="">
                        <input placeholder="Confirm New Password" name="cpass" type="password" required="">	
                        <div class="sign-up">
                            <input type="submit" value="Change Password" name="submit"/>
        <%
        if(session.getAttribute("nm")==null)
        {
             response.sendRedirect("login.jsp?msg=hello");
        }
        if(request.getParameter("submit")!=null)
        {
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   String path = "jdbc:mysql://localhost/shoppingdb";
                    Connection myconn = DriverManager.getConnection(path, dbuser, dbpass);
                   try
                   {
                       String newpass,cnewpass;
                       newpass = request.getParameter("newpass");
                       cnewpass = request.getParameter("cpass");
                       if(newpass.equals(cnewpass))
                       {
                            String q = "update signup set password=? where username=? and password=?";
                            PreparedStatement myst =  myconn.prepareStatement(q);
                            myst.setString(1, newpass);
                            myst.setString(2, session.getAttribute("un").toString());
                            myst.setString(3, request.getParameter("currpass"));
                            int res = myst.executeUpdate();
                            if(res==1)
                            {
                                out.print("Password changed successfully");
                            }
                            else
                            {
                                 out.print("Current Password Incorrect");
                            }
                       }
                       else
                       {
                           out.print("New Password doesn't match");
                       }
                   }
                   catch(Exception e)
                   {
                       out.print("Error in query " + e.getMessage());
                   }
            }
            catch(Exception e)
            {
                out.print("Error in connection " + e.getMessage());
            }
        }
        %> 
                        </div>
                </form>
        </div>
		</div>
	</div>

     <%@include file="footer.jsp" %>
    </body>
</html>
