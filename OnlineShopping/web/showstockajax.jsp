<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%            String pid="";
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addvarient where prodid=? and colorid=? and size=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        
                        myst.setString(1, request.getParameter("pid"));
                         myst.setString(2, request.getParameter("cid"));
                          myst.setString(3, request.getParameter("sizeid"));
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print(res.getString("stock"));
                            /*do
                            {                     
                                out.print("<option value='" + res.getString("ColorId") + "'>" + res.getString("Name") + "</option>");
                               // out.print("<option value='100'>Men Apparels</option>");
                            }
                            while(res.next());*/
                        }
                        else
                        {
                             out.print("<option>No stock</option>");
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
