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
        <script src="js/jquery-ui/jquery-ui.js"></script>
       <link rel="stylesheet" href="js/jquery-ui/jquery-ui.css">

<script>
  $( function() 
  {
    $( "#dob" ).datepicker({
      changeMonth: true,
      changeYear: true
    })
    $( "#dob" ).datepicker( "option", "dateFormat", "yy-mm-dd");
 });
  </script>
        <title>Sign Up</title>
        
<script>
$(document).ready(function()
{
	$("#name").blur(function()
	{
		var nm = $(this).val();
		$.ajax(
		{
		  url: 'showname.jsp',
		  type: 'post',
		  data: {"name":nm},
                 beforeSend: function () 
		 { 
		 	$("#showname").html("<img src='pics/preloader.gif'>"); 
		 },
		 success: function(result) 
                    {
                          $('#showname').html(result);
                    },
		  error: function(e) 
			  {
				$('#showname').html("Error in Ajax");
			  }
		});
	});
        
        $("#email").blur(function()
	{
		var em = $(this).val();
		$.ajax(
		{
                    url: 'checkavailajax.jsp',
                    type: 'post',
                    data: {"emid":em},
                    beforeSend: function () 
                    { 
                            $("#availdiv").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                        if($.trim(result)=="exists")
                        {
                          $('#email').css("border-color","red");
                          $('#availdiv').html("You have already signed up.<br/><a href='forgotpass.jsp'>Recover Password</a>");
                          //$("#b1").hide()
                          $( "#b1" ).prop( "disabled", true);
                        }
                        else
                        {
                            $('#email').css("background-color","green");
                            $('#availdiv').html("");
                            $( "#b1" ).prop("disabled",false);
                        }
                    },
                    error: function(e) 
                    {
                          $('#availdiv').html("Error in Ajax");
                    }
		});
	});
});
</script>
<script type="text/javascript">
 function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }
</script>
        
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Sign Up</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul><li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Sign Up</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Sign Up</h3>
			<div class="register">
                <form action="#" method="post">			
                    <input placeholder="Name" name="name" id="name" type="text" required="" minlength="3"><br/>
                        <div id="showname"></div>
                        <input placeholder="Address" name="add" type="text" required="">
                        <input placeholder="City" name="city" type="text" required="">
                        <input placeholder="State" name="state" type="text" required="">
                        <input placeholder="Phone" name="phone" type="text" pattern="\d*" required="" minlength="10" maxlength="10" onkeydown="return isNumberKey(event)">
                        <input placeholder="Email (Username)" name="email" type="email" id="email" required="">	
                        <div id="availdiv"></div>
                        <input placeholder="Password" name="password" type="password" required="">	
                        <input placeholder="Confirm Password" name="password" type="password" required="">
                      <br/><br/>
                        <label class="radio-inline">
                            <input type="radio" name="gen" value="Male" aria-label="Male" required="">Male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gen" value="Female" aria-label="Female" required="">Female
                        </label>
                        <br/><br/>
                        <select name="country" class="form-control" required="">
                            <option value="">Choose Country</option>
                            <option>India</option>
                            <option>USA</option>
                            <option>UK</option>
                            <option>China</option>
                            <option>Others</option>
                        </select>
                        <input type="text" id="dob" name="dob" placeholder="Date of Birth"/>
                        <div class="sign-up">
                            <input type="submit" value="Create Account" name="submit" id="b1"/>
                        </div>         
        <%
        if(request.getParameter("submit")!=null)
        {
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                       Date currdt = new Date();
                       String tstamp = String.valueOf(currdt.getTime());
                        String n = request.getParameter("name");
                        String add = request.getParameter("add");
                        String ct = request.getParameter("city");
                        String st = request.getParameter("state");
                        String ph = request.getParameter("phone");
                        String un = request.getParameter("email");
                        String pass = request.getParameter("password");
                        String gen = request.getParameter("gen");
                        String co = request.getParameter("country");
                        
                        String db = request.getParameter("dob");
                        String c = "select * from signup where username=?";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        myset.setString(1,un);
                        ResultSet rs = myset.executeQuery();
                        if(rs.next()==true)
                        {
                            out.print("User Already Exists"); 
                        }
                        else
                        {
                        String q = "insert into signup values(?,?,?,?,?,?,md5(?),?,?,?,?,?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, n);
                        myst.setString(2, add);
                        myst.setString(3, ct);
                        myst.setString(4, st);
                        myst.setString(5, ph);
                        myst.setString(6, un);
                        myst.setString(7, pass+salt);
                        myst.setString(8, gen);
                        myst.setString(9, co);
                        myst.setString(10, "normal");
                        myst.setString(11, db);
                        myst.setString(12, "No");
                        myst.setString(13, tstamp);
                        int res = myst.executeUpdate();
                        if(res==1)
                        {
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
                            message.setSubject("Activate your account");
                            
                            message.setText("Dear " + n + "\n\nThanks for signing up on our website. Click on the follwoing link to activate your account \n\n http://localhost:8080/OnlineShopping/activate.jsp?un=" + un + "&seccode=" + tstamp);
                            Transport.send(message);
                            response.sendRedirect("thx.jsp");
                        }
                        else
                        {
                            out.print("Problem while signing up");
                        }
                           
                        }
                   }
                   catch(Exception e)
                   {
                        out.print("Error in connection " + e.getMessage());
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
        }
        %>
  </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
