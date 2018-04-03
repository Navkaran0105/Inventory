<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%              
            try
            {
                String catid= request.getParameter("catid");
                 String scatid= request.getParameter("scid"); 
                Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addproduct where maincatid=? and subcatid=?";
                        
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, catid);
                        myst.setString(2, scatid);
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<table width='100%' class='table table-hover'><tr><th>Picture</th><th>Category Name</th><th>Update</th><th>Delete</th></tr>");
                            do
                            {                     
                                out.print("<tr><td><img src='uploads/"  + res.getString("prodpic") + "' width='75'></td><td>" + res.getString("prodname") + "</td><td><a href='updateproduct.jsp?id="+res.getString("prodid")+"'>Update</a></td><td><a href='' class='mylink' id='"+res.getString("prodid")+"'>Delete</a></td>");
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