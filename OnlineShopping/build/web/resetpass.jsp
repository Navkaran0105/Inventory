
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
       <%
        if(request.getParameter("submit")!=null)
        {
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select time from rectime where username=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1,request.getParameter("un"));
                        ResultSet res = myst.executeQuery();
                        if(res.next())
                        {
                            Date currdt = new Date();
                            long date1 = res.getLong("time");
                            long date2 = currdt.getTime();
                            long difference = date2 - date1;
                            long timeDifMinutes = difference / (60 * 1000);
                           
                            if(timeDifMinutes>15)
                            {
                                out.print("Your Link has Expired, Regenrate your Link");
                            }
                            else
                            {
                                 String seccode,newpass,cnewpass;
                                 seccode = request.getParameter("seccode");
                                 newpass = request.getParameter("newpass");
                                 cnewpass = request.getParameter("cpass");
                            if(newpass.equals(cnewpass))
                            {
                            q = "update signup set password=md5(?) where username=?";
                            myst =  myconn.prepareStatement(q);
                            myst.setString(1, newpass+salt);
                            myst.setString(2,request.getParameter("un"));
                           
                            int rs = myst.executeUpdate();
                            if(rs==1)
                            {
                                out.print("Password changed successfully");
                                q="delete from rectime where username=?";
                                myst =  myconn.prepareStatement(q);
                                myst.setString(1,request.getParameter("un"));
                                int re =myst.executeUpdate();
                                if (re==1)
                                {
                                    out.print("database cleared");
                                }
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
                        }
                        else
                        {
                            out.print("Username or Code does not match");
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
                        	
                        <input placeholder="New  Password" name="newpass" type="password" required="">
                        <input placeholder="Confirm New Password" name="cpass" type="password" required="">	
                        <div class="sign-up">
                            <input type="submit" value="Change Password" name="submit"/>
                               
                        </div>
                </form>
        </div>
		</div>
	</div>

     <%@include file="footer.jsp" %>
    </body>
</html>
