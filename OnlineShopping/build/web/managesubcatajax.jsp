<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>

<%              
            try
            {
                String catid= request.getParameter("name");   
                Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addsubcat where maincatid=?";
                        
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, catid);
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<table width='100%' class='table table-hover'><tr><th>Picture</th><th>Category Name</th><th>Update</th><th>Delete</th></tr>");
                            do
                            {                     
                                out.print("<tr><td><img src='uploads/"  + res.getString("subcatpic") + "' width='75'></td><td>" + res.getString("subcatname") + "</td><td><a class='update' href='updatesubcat.jsp?sid="+res.getString("subcatid")+"' id='" + res.getString("subcatid") + "'>Update</a></td><td><a class='mylink' href='#' id='" + res.getString("subcatid") + "'>Delete</a></td>");
                            }
                            while(res.next());
                            out.print("</table>");
                        }
                        else
                        {
                             out.print("<option>No SubCategories</option>");
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