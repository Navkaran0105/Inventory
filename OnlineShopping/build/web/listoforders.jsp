
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<html>
    <head>
        <%@include file="extfiles.jsp" %>
         <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
	<script src="js/fancybox/jquery.fancybox.min.js"></script>
<script>
    $(document).ready(function()
    {
        $("#card").hide();
        $("#dc").click(function(e)
        {
             $("#card").show();
        });
        $("#cod").click(function(e)
        {
             $("#card").hide();
        });
    });
    
</script> 
    </head>
    <body>
     <%@include file="header.jsp" %>
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Checkout</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Checkout</li>
			</ul>
		</div>
	</div>

	<div class="checkout">
		<div class="container">
                  <%
                try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String c = "select * from bill";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        
                        ResultSet rs = myset.executeQuery();
                        if(rs.next())
                        {
                         
                               out.print("<div class='checkout-right'><table class='timetable_sub'><thead><tr><th>Order No.</th><th>Mode</th><th>Status</th><th>Total Amount</th><th>Order Date</th>");
                                do
                                {
                  out.print("<tr><td><a href='javascript:;' data-fancybox data-type='iframe' data-src='orderitems.jsp?oid=" + rs.getString("orderno") + "'>"+ rs.getString("orderno") +"</a></td><td>" + rs.getString("mode")+ "</td><td>" + rs.getString("status")+ "</td><td>" + rs.getString("totalamount") + "</td><td>" + rs.getString("orderdate") + "</td></tr>");
              
                                }
                                while(rs.next());
                                out.print("</table></div>");
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

                    
                    
                    %>
		</div>
		
            
	</div>
     <%@include file="footer.jsp" %>
</body>
</html>