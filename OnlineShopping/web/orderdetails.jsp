
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
                        
                        String c = "select * from bill where username=? order by orderno desc";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        myset.setString(1,session.getAttribute("un").toString());
                        ResultSet rs = myset.executeQuery();
                        if(rs.next())
                        {
                         out.print("<b>Thanks for shopping on our website. Your order number is " + rs.getString("orderno") + ". Your total cost is Rs." + rs.getString("totalamount") + ". Your order details is below<br/><br/></b>");
                        String q = "select * from carttable,addcolor,addproduct where username=? and addcolor.colorid=carttable.colorid and addproduct.prodid=carttable.productid";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1,session.getAttribute("un").toString());
                        
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                               int x=1;
                              
                               out.print("<div class='checkout-right'><table class='timetable_sub'><thead><tr><th>SL No.</th><th>Product Pic</th><th>Product Name</th><th>Size</th><th>Color</th><th>Rate</th><th>Quantity</th><th>Total Cost</th><th>Remove</th></tr></thead>");
                                do
                                {
                                    out.print("<tr><td>" + x + "</td><td><img src='uploads/" + res.getString("prodpic") + "' width='125'></td><td>" + res.getString("prodname")+ "</td><td>" + res.getString("size")+ "</td><td>" + res.getString("Name") + "</td><td>" + res.getString("amount") + "</td><td>" + res.getString("quantity") + "</td><td>" + res.getString("totalcost") + "</td><td>Remove</td></tr>");
                                    q = "update addvarient set stock=stock-? where prodid=? and colorid=? and size=?";
                                    myst =  myconn.prepareStatement(q);
                                    
                                    myst.setString(1,res.getString("quantity"));
                                    myst.setString(2,res.getString("productid"));
                                    myst.setString(3,res.getString("colorid"));
                                    myst.setString(4,res.getString("size"));
                                    myst.executeUpdate();
                                    
                                    q = "insert into orderdetails1(productid,colorid,size,quantity,amount,totalcost,prodpic,username,orderno) values(?,?,?,?,?,?,?,?,?)";
                                    myst =  myconn.prepareStatement(q);
                                    myst.setString(1, res.getString("ProductID"));
                                    myst.setString(2, res.getString("ColorID"));
                                    myst.setString(3, res.getString("size"));
                                    myst.setString(4, res.getString("quantity"));
                                    myst.setString(5, res.getString("amount"));
                                    myst.setString(6, res.getString("totalcost"));
                                    myst.setString(7, res.getString("prodpic"));
                                    myst.setString(8, session.getAttribute("un").toString());
                                    myst.setString(9, rs.getString("orderno"));
                                    myst.executeUpdate();
                                    x++;
                                }
                                while(res.next());
                                out.print("</table>");
                            }
                            else
                            {
                                 out.print("");
                            }
                        }
                        else
                        {
                            out.print("Problem while showing details");
                        }
                        
                         c = "delete from carttable where username=?";
                         myset =  myconn.prepareStatement(c);
                        myset.setString(1,session.getAttribute("un").toString());
                       myset.executeUpdate();
                       
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