
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
<!-- //breadcrumbs -->

<!-- checkout -->
	<div class="checkout">
		<div class="container">
           <% 
               int tcost=0;
            if(session.getAttribute("un")!=null)
            {
                   
                try
                {
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                       try
                       {
                            String q = "select * from carttable,addcolor,addproduct where username=? and addcolor.colorid=carttable.colorid and addproduct.prodid=carttable.productid";
                            PreparedStatement myst =  myconn.prepareStatement(q);
                            myst.setString(1,session.getAttribute("un").toString());

                            ResultSet res = myst.executeQuery();
                            if(res.next()==true)
                            {
                                int x=1;
                               tcost=0;
                               out.print("<h3>Your shopping cart contains: <span>3 Products</span></h3><div class='checkout-right'><table class='timetable_sub'><thead><tr><th>SL No.</th><th>Product Pic</th><th>Product Name</th><th>Size</th><th>Color</th><th>Rate</th><th>Quantity</th><th>Total Cost</th><th>Remove</th></tr></thead>");
                                do
                                {
                                    out.print("<tr><td>" + x + "</td><td><img src='uploads/" + res.getString("prodpic") + "' width='125'></td><td>" + res.getString("prodname")+ "</td><td>" + res.getString("size")+ "</td><td>" + res.getString("Name") + "</td><td>" + res.getString("amount") + "</td><td>" + res.getString("quantity") + "</td><td>" + res.getString("totalcost") + "</td><td>Remove</td></tr>");
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
                }
            }
            else
            {
                out.print("Please login to see your cart");
            }
           %>
                                                        
				
			</div>
			<div class="checkout-left">	
				<div class="checkout-left-basket">
                                    <form><input type="submit" name="b1" value="checkout"/></form>
                                    <%
                                        if(request.getParameter("b1")!=null)
                                        {
                                            response.sendRedirect("checkout.jsp");
                                        }
                                        
                                        %>
					<ul>
						
                                            <li>Total amount<i>-</i> <span><%out.print(tcost); %></span></li>
					</ul>
				</div>
				<div class="checkout-right-basket">
					<a href="products.html"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	
	<div class="w3l_related_products">
		<div class="container">
			<h3>Related Products</h3>
			<ul id="flexiselDemo2">			
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left dresses_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/ss1.jpg" alt=" " class="img-responsive">
								<img src="images/ss2.jpg" alt=" " class="img-responsive">
								<img src="images/ss3.jpg" alt=" " class="img-responsive">
								<img src="images/ss4.jpg" alt=" " class="img-responsive">
								<img src="images/ss5.jpg" alt=" " class="img-responsive">
								<img src="images/ss6.jpg" alt=" " class="img-responsive">
								<img src="images/ss7.jpg" alt=" " class="img-responsive">
								<img src="images/ss8.jpg" alt=" " class="img-responsive">
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.html">Pink Flared Skirt</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$312</span> <i class="item_price">$212</i></p>
								<p><a class="item_add" href="#">Add to cart</a></p>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left dresses_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/ss2.jpg" alt=" " class="img-responsive">
								<img src="images/ss3.jpg" alt=" " class="img-responsive">
								<img src="images/ss4.jpg" alt=" " class="img-responsive">
								<img src="images/ss5.jpg" alt=" " class="img-responsive">
								<img src="images/ss6.jpg" alt=" " class="img-responsive">
								<img src="images/ss9.jpg" alt=" " class="img-responsive">
								<img src="images/ss7.jpg" alt=" " class="img-responsive">
								<img src="images/ss8.jpg" alt=" " class="img-responsive">
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.html">Red Pencil Skirt</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$432</span> <i class="item_price">$323</i></p>
								<p><a class="item_add" href="#">Add to cart</a></p>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left dresses_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/ss3.jpg" alt=" " class="img-responsive">
								<img src="images/ss4.jpg" alt=" " class="img-responsive">
								<img src="images/ss5.jpg" alt=" " class="img-responsive">
								<img src="images/ss6.jpg" alt=" " class="img-responsive">
								<img src="images/ss7.jpg" alt=" " class="img-responsive">
								<img src="images/ss8.jpg" alt=" " class="img-responsive">
								<img src="images/ss9.jpg" alt=" " class="img-responsive">
								<img src="images/ss1.jpg" alt=" " class="img-responsive">
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.html">Yellow Cotton Skirt</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$323</span> <i class="item_price">$310</i></p>
								<p><a class="item_add" href="#">Add to cart</a></p>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left dresses_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/ss4.jpg" alt=" " class="img-responsive">
								<img src="images/ss5.jpg" alt=" " class="img-responsive">
								<img src="images/ss6.jpg" alt=" " class="img-responsive">
								<img src="images/ss7.jpg" alt=" " class="img-responsive">
								<img src="images/ss8.jpg" alt=" " class="img-responsive">
								<img src="images/ss9.jpg" alt=" " class="img-responsive">
								<img src="images/ss1.jpg" alt=" " class="img-responsive">
								<img src="images/ss2.jpg" alt=" " class="img-responsive">
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.html">Black Short</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$256</span> <i class="item_price">$200</i></p>
								<p><a class="item_add" href="#">Add to cart</a></p>
							</div>
						</div>
					</div>
				</li>
			</ul>
				<script type="text/javascript">
					$(window).load(function() {
						$("#flexiselDemo2").flexisel({
							visibleItems:4,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
							responsiveBreakpoints: { 
								portrait: { 
									changePoint:480,
									visibleItems: 1
								}, 
								landscape: { 
									changePoint:640,
									visibleItems:2
								},
								tablet: { 
									changePoint:768,
									visibleItems: 3
								}
							}
						});
						
					});
				</script>
				<script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>
	<div class="modal video-modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModal6">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="col-md-5 modal_body_left">
							<img src="images/39.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="col-md-7 modal_body_right">
							<h4>a good look women's Long Skirt</h4>
							<p>Ut enim ad minim veniam, quis nostrud 
								exercitation ullamco laboris nisi ut aliquip ex ea 
								commodo consequat.Duis aute irure dolor in 
								reprehenderit in voluptate velit esse cillum dolore 
								eu fugiat nulla pariatur. Excepteur sint occaecat 
								cupidatat non proident, sunt in culpa qui officia 
								deserunt mollit anim id est laborum.</p>
							<div class="rating">
								<div class="rating-left">
									<img src="images/star-.png" alt=" " class="img-responsive" />
								</div>
								<div class="rating-left">
									<img src="images/star-.png" alt=" " class="img-responsive" />
								</div>
								<div class="rating-left">
									<img src="images/star-.png" alt=" " class="img-responsive" />
								</div>
								<div class="rating-left">
									<img src="images/star.png" alt=" " class="img-responsive" />
								</div>
								<div class="rating-left">
									<img src="images/star.png" alt=" " class="img-responsive" />
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="modal_body_right_cart simpleCart_shelfItem">
								<p><span>$320</span> <i class="item_price">$250</i></p>
								<p><a class="item_add" href="#">Add to cart</a></p>
							</div>
							<h5>Color</h5>
							<div class="color-quality">
								<ul>
									<li><a href="#"><span></span>Red</a></li>
									<li><a href="#" class="brown"><span></span>Yellow</a></li>
									<li><a href="#" class="purple"><span></span>Purple</a></li>
									<li><a href="#" class="gray"><span></span>Violet</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</section>
			</div>
		</div>
	</div>

     <%@include file="footer.jsp" %>
</body>
</html>