<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<div class="header">
        <div class="container">
                <div class="w3l_login">
                   Welcome 
                   <%
                   if(session.getAttribute("nm")!=null)
                   {
                       out.print(session.getAttribute("nm"));
                       out.print(" <a href='changepass.jsp'>Change Password</a> ");
                       out.print("<a href='signout.jsp'>Signout</a>");
                   }
                   else
                   {
                       out.print("Guest");
                       out.print(" <a href='login.jsp'>Login</a> ");
                       out.print("<a href='signup.jsp'>Sign Up</a>");
                   }
                        
                   %>
                    
                        
                </div>
                <div class="w3l_logo">
                        <h1><a href="index.html">Women's Fashion<span>For Fashion Lovers</span></a></h1>
                </div>
                <div class="search">
                        <input class="search_box" type="checkbox" id="search_box">
                        <label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
                        <div class="search_form">
                                <form action="#" method="post">
                                        <input type="text" name="Search" placeholder="Search...">
                                        <input type="submit" value="Send">
                                </form>
                        </div>
                </div>
                <div class="cart box_1">
                        <a href="showcart.jsp">
                                <div class="total">
                                    <span>
                                    <% 
                                        if(session.getAttribute("tcost")!=null)
                                        {
                                            out.print(session.getAttribute("tcost"));
                                        }
                                    %></span> (<span>
            <%
            if(session.getAttribute("un")!=null)
            {
                try
                {
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection myconn = DriverManager.getConnection(dbpath,dbuser,dbpass);
                       try
                       {
                            String c = "select count(srno) from carttable where username=?";
                            PreparedStatement myset =  myconn.prepareStatement(c);
                            myset.setString(1, session.getAttribute("un").toString());
                            ResultSet rs = myset.executeQuery();
                            if(rs.next()==true)
                            {
                                out.print(rs.getString(1));
                            }
                            else
                            {
                                out.print("0" + "Items");
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
                out.print("0 Items");
            }
            %>
                                    </span> )</div>
                                <img src="images/bag.png" alt="" />
                        </a>
                        <p><a href="showcart.jsp" class="simpleCart_empty">Empty Cart</a></p>
                        <div class="clearfix"> </div>
                </div>	
                <div class="clearfix"> </div>
        </div>
</div>
<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">Home</a></li>	
						<!-- Mega Menu -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <b class="caret"></b></a>
                                                        
                           
                                                        <ul class="dropdown-menu multi-column columns-3">
                                                         <div class="row">
			<%
                        try
                        {
                      Connection myconn = DriverManager.getConnection(dbpath,dbuser,dbpass);
                       try
                       {
                            String c = "select * from addcat";
                            PreparedStatement myset =  myconn.prepareStatement(c);
                           
                            ResultSet rs = myset.executeQuery();
                            if(rs.next())//women
                            {
                                do
                                {
                   
                                    String c1 = "select * from addsubcat where MainCatID=?";
                                    PreparedStatement myset1 =  myconn.prepareStatement(c1);
                                    myset1.setString(1,rs.getString("CatId"));
                                    ResultSet rs1 = myset1.executeQuery();
                                      out.print("<div class='col-sm-3'>"
                                                  + "<ul class='multi-column-dropdown'>"
                                                  + "<h6>" + rs.getString("catname") + "</h6>");
                                    if(rs1.next())
                                    {
                                        do
                                        {
                                                  out.print("<li><a href='showprods.jsp?scid= " + rs1.getString("subcatid") + "'><span>" + rs1.getString("subcatname") + "</span></a></li>");    
                                        }
                                        while(rs1.next());
                                    }
                                     out.print("</ul></div>"); 
                                }
                               
                                while(rs.next());
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
                                                                    
									
									
									<div class="clearfix"></div>
								</div>
							</ul>
						</li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li><a href="mail.html" class="act">Mail Us</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>