<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@include file="myvars.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="extfiles.jsp" %>
        <title>Contact Us</title>
    </head>
    <body>
     <%@include file="header.jsp" %>

	<div class="banner10" id="home1">
		<div class="container">
			<h2>Mail Us</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Mail Us</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Mail Us</h3>
			<div class="agile_mail_grids">
				<div class="col-md-5 contact-left">
					<h4>Address</h4>
					<p>est eligendi optio cumque nihil impedit quo minus id quod maxime
						<span>26 56D Rescue,US</span></p>
					<ul>
						<li>Free Phone :+1 078 4589 2456</li>
						<li>Telephone :+1 078 4589 2456</li>
						<li>Fax :+1 078 4589 2456</li>
						<li><a href="mailto:info@example.com">info@example.com</a></li>
					</ul>
				</div>
				<div class="col-md-7 contact-left">
					<h4>Contact Form</h4>
					<form action="#" method="post">
						<input type="text" name="Name" placeholder="Name" required="">
						<input type="email" name="Email" placeholder="Email" required="">
						<input type="text" name="Telephone" placeholder="Telephone" required="">
						<textarea name="message" required=""></textarea>
						<input type="submit" value="Submit" name="submit">
               <%

                    if(request.getParameter("submit")!=null)
                    {
                            String n=request.getParameter("Name");
                            String em=request.getParameter("Email");
                            String ph=request.getParameter("Telephone");
                            String msg=request.getParameter("message");
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
                        
                    try {
                            Message message = new MimeMessage(session2);
                            message.addHeader("Content-type", "text/html; charset=UTF-8");
                            message.setFrom(new InternetAddress("gtbtrial@gmail.com"));
                            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("preettarun@gmail.com"));
                            message.setSubject("Mail from Website");
                            
                            message.setText("Name :- " + n + "\n" + "Email ID:-" + em + "\nPhone:-" + ph + "\nMessage:- " + msg);
                            Transport.send(message);
                            }
                            catch (MessagingException e)
                            {
                                    throw new RuntimeException(e);
                            }
                    }

                                %>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
     
     
     <%@include file="footer.jsp" %>
    </body>
</html>
