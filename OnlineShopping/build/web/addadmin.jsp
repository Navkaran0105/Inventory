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
        <title>Add Admin</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Add Admin</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Add Admin</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
                    <ul><li><h3>Add Admin</h3></li></ul>

			<div class="register">
                <form action="#" method="post">			
                        <input placeholder="Name" name="name" type="text" required="">
                        <input placeholder="Address" name="add" type="text" required="">
                        <input placeholder="City" name="city" type="text" required="">
                        <input placeholder="State" name="state" type="text" required="">
                        <input placeholder="Phone" name="phone" type="text" required="">
                        <input placeholder="Email Address" name="email" type="email" required="">	
                        <input placeholder="Password" name="password" type="password" required="">	
                        <input placeholder="Confirm Password" name="password" type="password" required="">
                      
                        <label class="radio-inline">
                            <input type="radio" name="gen" value="Male" aria-label="Male">Male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gen" value="Female" aria-label="Female">Female
                        </label>
                        <br/><br/>
                        <select name="country" class="form-control">
                            <option value="">Choose Country</option>
                            <option>India</option>
                            <option>USA</option>
                            <option>UK</option>
                            <option>China</option>
                            <option>Others</option>
                        </select>
                        
                        <div class="sign-up">
                            <input type="submit" value="Create Account" name="submit"/>
                        </div>
                </form>
        </div>
		</div>
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
                        String n = request.getParameter("name");
                        String add = request.getParameter("add");
                        String ct = request.getParameter("city");
                        String st = request.getParameter("state");
                        String ph = request.getParameter("phone");
                        String un = request.getParameter("email");
                        String pass = request.getParameter("password");
                        String gen = request.getParameter("gen");
                        String co = request.getParameter("country");
                        
                        String c = "select * from admintable where username=?";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        myset.setString(1,un);
                        ResultSet rs = myset.executeQuery();
                        if(rs.next()==true)
                        {
                            out.print("User Already Exists"); 
                        }
                        else
                        {
                        String q = "insert into admintable values(?,?,?,?,?,?,md5(?),?,?,?)";
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
                        myst.setString(10, "admin");

                        int res = myst.executeUpdate();
                        if(res==1)
                        {
                             response.sendRedirect("thx.jsp");
                        }
                        else
                        {
                             out.print("Problem while signing up. Try again");
                        }
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


     
     <%@include file="footer.jsp" %>
    </body>
</html>
