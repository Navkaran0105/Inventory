<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <script src="js/jquery-ui/jquery-ui.js"></script>
       <link rel="stylesheet" href="js/jquery-ui/jquery-ui.css">

       <title>Discount Coupon</title>
        
        
        
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Discount Coupon</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul><li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Discount Coupon</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Discount Coupon</h3>
			<div class="register">
                <form action="#" method="post">			
                        <input placeholder="CouponName" name="Couponname" id="Couponname" type="text" required=""><br/>
                        <div id="showname"></div>
                        <input placeholder="Mintotal" name="mintotal" type="text" required="">
                        <input placeholder="DiscountPercentage" name="disc" type="text" required="">
                        <input placeholder="Maxdiscount" name="maxdis" type="text" required="">
                        <div class="sign-up">
                            <input type="submit" value="Add Coupon" name="submit" id="b1"/>
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
                        String q = "insert into discount(coupname,mintotal,percentage,maxdiscount) values(?,?,?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, request.getParameter("Couponname"));
                        myst.setString(2, request.getParameter("mintotal"));
                        myst.setString(3, request.getParameter("disc"));
                        myst.setString(4, request.getParameter("maxdis"));
                        int res = myst.executeUpdate();
                        if(res==1)
                        {
                             out.print("discount coupon added successfully");
                        }
                        else
                        {
                             out.print("Try again");
                        }
                   }
                   catch(Exception e)
                   {
                       out.print("Error in query " + e.getMessage());
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
