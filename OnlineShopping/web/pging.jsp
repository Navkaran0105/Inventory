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
<script>
$(document).ready(function ()
{
    $('#form1').submit(function (e)
    {
        e.preventDefault();
        $.ajax(
                {
                    type: 'post',
                    url: 'loginajax.jsp',
                    data: $("#form1").serialize(),
                    beforeSend: function () 
                    { 
                       $("#msgdiv").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function (reslt)
                    {
                        if ($.trim(reslt) == "admin")
                        {
                           window.location = "adminpanel.jsp";
                        } 
                        else if ($.trim(reslt) == "normal")
                        {
                             window.location = "index.jsp";
                        } 
                        else if($.trim(reslt) == "incorrect")
                        {
                            $('#msgdiv').html("Incorrect Username/Password");
                        }
                        else if($.trim(reslt) == "notactivated")
                        {
                            $('#msgdiv').html("Please activate your account");
                        }
                    },
                    error: function (e)
                    {
                        $('#msgdiv').html("error in ajax");
                    }
                });
    });
});
</script>    



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
                <h3>List of Products</h3>
                <div class="register">
    <%
     try 
     {
            Class.forName("com.mysql.jdbc.Driver"); //driver communication
            Connection con = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try 
            {
                String q = "SELECT count(*) as cnt from addproduct";
                PreparedStatement st1 = con.prepareStatement(q);
                
                ResultSet rs = st1.executeQuery();
                if(rs.next())
                {
                    double total_entries = rs.getDouble("cnt");
                    int page_number = 0;
                    int total_pages = 0;
                    if (request.getParameter("page_number") != null) 
                    {
                        page_number = Integer.parseInt(request.getParameter("page_number"));
                    } 
                    else 
                    {
                        page_number = 1;
                    }
                    int entries_per_page = 5;

                    total_pages = (int) Math.ceil(total_entries / entries_per_page);
                    
                    int offset = (int) ((page_number - 1) * entries_per_page);

                    String b = "select * from addproduct LIMIT " + offset + "," + entries_per_page;
                    PreparedStatement mystatement = con.prepareStatement(b);
                    ResultSet myresult = mystatement.executeQuery();
                    if (myresult.next()) 
                    {

                        out.println("<table width=700px align=center cellpadding=5 border=1>"
                                + "<tr bgcolor='lightgrey'><th>Product ID</th>"
                                + "<th>Product Name</th><th>Occassion</th></tr>");
                        int y = 2;
                        do 
                        {
                            if (y % 2 == 0) 
                            {
                                out.println("<tr bgcolor='lightyellow'>");
                            } 
                            else 
                            {
                                out.println("<tr bgcolor='white'>");
                            }
                            y++;
                            out.println("<td>" + myresult.getString("prodid") + "</td>");
                            out.println("<td>" + myresult.getString("prodname") + "</td>");
                            out.println("<td>" + myresult.getString("Ocassion") + "</td>");

                            out.println("</tr>");
                                                                         
                        }
                        while (myresult.next());

                        out.println("</table><table align=center cellpadding=2><tr>");
                        for (int i = 1; i <= total_pages; i++) 
                        {
                            if (i == page_number) 
                            {

                                out.println("<td>" + i + "</td>");
                            } 
                            else 
                            {

                                out.println("<td bgcolor=lightyellow><a href='pging.jsp?page_number=" + i + "'>" + i + "</a></td>");

                            }

                        }
                        out.println("</tr></table>");
                    } 
                    else 
                    {

                        out.println("No Records found");
                    }
                }

            } 
            catch (Exception e) 
            {
                out.println("Query error" + e.getMessage());
                e.printStackTrace();
            }
            con.close();
        } 
        catch (Exception e) 
        {
               e.printStackTrace();
               out.println("Connection error" + e.getMessage());
           }
                                                        

                        
%>
                </div>
            </div>
        </div>





        <%@include file="footer.jsp" %>
    </body>
</html>
