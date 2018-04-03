<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>

 <%              
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addcolor";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<table width='100%' class='table table-hover'><tr><th>Picture</th><th>Update</th><th>Delete</th></tr>");
                            do
                            {                     
                                out.print("<tr><td>" + res.getString("Name")+"</td><td><a href='updatecolor.jsp?cid=" + res.getString("colorid") + "'>Update</a></td><td><a class='mylink' href='#' id='" + res.getString("colorid") + "'>Delete</a></td>");
                            }
                            while(res.next());
                            out.print("</table>");
                        }
                        else
                        {
                             out.print("<option>No Categories</option>");
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