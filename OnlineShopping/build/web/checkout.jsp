
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
                    <form name="form1" method="post" id="form1" >
                    <h2>Choose Payment Option</h2><br/>
                    <input type="radio" name="poption" value="cod" id="cod">Cash on Delivery
                    <input type="radio" name="poption" value="card" id="dc">Debit Card<br/><br/>
                    <div id="card">
                        Card No <input type="text" name="cardno" class="form-control">
                        Holder Name <input type="text" name="holdname" class="form-control">
                        Company <input type="text" name="coname" class="form-control">
                        Expiry Date <input type="text" name="expdt" class="form-control">
                        CVV No <input type="text" name="ccno" class="form-control">
                    </div>
                       Shipping Address
                     <textarea name="saddress" class="form-control"></textarea><br/><br/>
                   <input type="submit" name="s1" value="Make Payment" class="form-control">
                    <%
                    if(request.getParameter("s1")!=null)
                    {
                        String ppic="",pname="",cname="",scname="",bname="",desc="";      
  
                    try
                    {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        Date currdt = new Date();
                        SimpleDateFormat myformat = new SimpleDateFormat("yyyy-MM-dd");
                        String edate = myformat.format(currdt);
                        
                        String c = "insert into bill(mode,cardno,holdername,company,exp,cvv,address,status,totalamount,orderdate,username) values(?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        myset.setString(1, request.getParameter("poption"));
                        myset.setString(2, request.getParameter("cardno"));
                        myset.setString(3, request.getParameter("holdname"));
                        myset.setString(4, request.getParameter("coname"));
                        myset.setString(5, request.getParameter("expdt"));
                        myset.setString(6, request.getParameter("ccno"));
                        myset.setString(7, request.getParameter("saddress"));
                        myset.setString(8, "Payment Received, Processing");
                        myset.setString(9, session.getAttribute("tcost").toString());
                        myset.setString(10, edate);
                        myset.setString(11,session.getAttribute("un").toString());
                        int rs = myset.executeUpdate();
                        if(rs>0)
                        {
                               response.sendRedirect("orderdetails.jsp");
                        }
                        else
                        {
                            out.print("Problem while parsing your payment");
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
     <%@include file="footer.jsp" %>
</body>
</html>