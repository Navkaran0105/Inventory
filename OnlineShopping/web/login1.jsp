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

        <title>Login</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <%
        
        if(request.getParameter("msg")!=null)
        {
            out.print("<script>alert('Please login to access the page')</script>");
        }
            
        %>
        <%

        if(request.getParameter("msg2")!=null)
        {
            out.print("<script>alert('Your account has been activated, please login now')</script>");
        }

        %>
        <%
            Cookie cookies[] = request.getCookies();
            Cookie mycookie=null;
            if(cookies!=null)
            {
                
                for(int i=0;i<cookies.length;i++)
                {
                    if(cookies[i].getName().equals("uinfo"))
                    {
                        mycookie = cookies[i];
                        break;
                    }
                }
                if(mycookie!=null)
                {
                    String un = mycookie.getValue();               
                    try 
                    {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                        try 
                        {
                            String q = "select name,username from signup where username=? ";
                            PreparedStatement myst = myconn.prepareStatement(q);
                            myst.setString(1, un);



                            ResultSet res = myst.executeQuery();
                            if (res.next() == true) 
                            {
                                    String n = res.getString("name");
                                    session.setAttribute("nm", n);
                                    session.setAttribute("un", un);
                                    response.sendRedirect("index.jsp");
                            }
                        } 
                        catch (Exception e) 
                        {
                            out.print("Error in query " + e.getMessage());
                        } 
                        finally 
                        {
                            myconn.close();
                        }
                    } 
                    catch (Exception e) 
                    {
                        out.print("Error in connection " + e.getMessage());
                    }
                }
        }
           
           
           
        %>
        
        
        
        

        <!-- //header -->
        <!-- banner -->
        <div class="banner10" id="home1">
            <div class="container">
                <h2>Login</h2>
            </div>
        </div>
        <!-- //banner -->

        <!-- breadcrumbs -->
        <div class="breadcrumb_dress">
            <div class="container">
                <ul>
                    <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
                    <li>Login</li>
                </ul>
            </div>
        </div>
        <!-- //breadcrumbs -->

        <!-- mail -->
        <div class="mail">
            <div class="container">
                <h3>Login</h3>
                <div class="register">
                    <form action="Login.html" method="post" id="form1">			
                        <input placeholder="Username" name="email" type="email" required="">	
                        <input placeholder="Password" name="password" type="password" required=""><br/><br/>
                        <a href="forgotpass.jsp">Forgot Password</a><br/><br/>
                        
                        <label><input type="checkbox" name="cb1">Remember Me</label>
                        
                        
                        
                        <div class="sign-up">
                            <input type="submit" value="Login" name="submit"/>
                            <div id="msgdiv">
                                <%
                                        
                                if(request.getAttribute("msg")!=null)
                                {
                                    out.print(request.getAttribute("msg"));
                                }
                                    
                                %>
                                
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>





        <%@include file="footer.jsp" %>
    </body>
</html>
