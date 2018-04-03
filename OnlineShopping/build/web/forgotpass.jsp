<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
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
                        <input placeholder="Username" name="un" type="text" required="">	
                        	
                        <div class="sign-up">
                            <input type="submit" value="Change Password" name="submit"/></div>
                                 <%
        if(request.getParameter("submit")!=null)
        {
            try
            {
                   Date currdt = new Date();
                   String tstamp = String.valueOf(currdt.getTime());
                   Class.forName("com.mysql.jdbc.Driver");
                   String path = "jdbc:mysql://localhost/shoppingdb";
                    Connection myconn = DriverManager.getConnection(path, dbuser, dbpass);
                     SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                     
                   try
                   {
                           String un=request.getParameter("un");
                            String q = "select * from signup where username=?";
                            PreparedStatement myst =  myconn.prepareStatement(q);
                            myst.setString(1, un);
                            ResultSet res = myst.executeQuery();
                           
                            if(res.next())
                            {
                                    q = "insert into rectime(Username,time) values(?,?)";
                                     myst =  myconn.prepareStatement(q);
                                     myst.setString(1, un);
                                     myst.setString(2, tstamp);
                                    int re = myst.executeUpdate();
                                    Properties props = new Properties();
                                    props.put("mail.smtp.host", "smtp.gmail.com");
                                    props.put("mail.smtp.socketFactory.port", "465");
                                    props.put("mail.smtp.socketFactory.class",
                                                   "javax.net.ssl.SSLSocketFactory");
                                    props.put("mail.smtp.auth", "true");
                                    props.put("mail.smtp.port", "465");

                                    Session session2 = Session.getInstance(props,
                                    new javax.mail.Authenticator() {
                                       protected PasswordAuthentication getPasswordAuthentication() {
                                               return new PasswordAuthentication(emailun,emailpass);
                                       }
                               });

                                    Message message = new MimeMessage(session2);
                                    message.addHeader("Content-type", "text/html; charset=UTF-8");
                                    message.setFrom(new InternetAddress("gtbtrial@gmail.com"));
                                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(un));
                                    message.setSubject("Reset your password");

                                    message.setText("Click the link to reset the password\n\n http://localhost:8080/OnlineShopping/resetpass.jsp?un=" + un + "&seccode=" + tstamp);
                                    Transport.send(message);
                                  out.print("Please check your mail to change password");
                            }
                            else
                            {
                                 out.print("Username Incorrect");
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
                        
                </form>
        </div>
		</div>
	</div>

     <%@include file="footer.jsp" %>
    </body>
</html>
