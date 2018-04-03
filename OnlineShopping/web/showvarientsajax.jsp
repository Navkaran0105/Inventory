<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %> 
<%              
            try
            {
                   String prodid=request.getParameter("prodid");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select Size,Stock,name,srno from addvarient,addcolor where addvarient.ColorId=addcolor.ColorId and prodid=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, prodid);
                       
                        ResultSet res = myst.executeQuery();
                        
                        if(res.next()==true)
                        {
                            out.print("<table width='100%' class='table table-hover'><tr><th>Size</th><th>Stock</th><th>Color Name</th><th>Delete</th></tr>");
                            do
                            {                     
                                out.print("<tr><td>"+ res.getString("Size")+"</td><td>" +res.getString("stock")+"</td><td>" + res.getString("name")+ "</td><td><a href='' class='mylink' id='"+res.getString("srno")+"'>Delete</a></td>");
                            }
                            while(res.next());
                            out.print("</table>");
                        }
                        else
                        {
                             out.print("No variants");
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