
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
    </head>
    <body>
    

	<div class="checkout">
		<div class="container">
           <%      
              int tcost=0;   
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from orderdetails1,addcolor,addproduct where orderno=? and addcolor.colorid=orderdetails1.colorid and addproduct.prodid=orderdetails1.productid";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1,request.getParameter("oid"));
                        
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            int x=1;
                           tcost=0;
                           out.print("<table class='timetable_sub'><thead><tr><th>Product Pic</th><th>Product Name</th><th>color</th><th>Size</th><th>Quantity</th><th>Amount</th><th>Total Cost</th>");
                            do
                            {
                                out.print("<tr><td><img src='uploads/" + res.getString("prodpic") + "' width='125'></td><td>" + res.getString("prodname")+ "</td><td>" + res.getString("name")+ "</td><td>" + res.getString("size") + "</td><td>" + res.getString("quantity") + "</td><td>" + res.getString("amount") + "</td><td>" + res.getString("totalcost") + "</td></tr>");
                                x++;
                                tcost+=res.getInt("totalcost");
                                session.setAttribute("tcost",tcost);
                            }
                            while(res.next());
                            out.print("</table>");
                        }
                        else
                        {
                             out.print("");
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
            }%>
                                                        
				
			</div>
			
		</div>

</body>
</html>