<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%              
            try
            {
                   String cid=request.getParameter("catid");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addsubcat where maincatid=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, cid);
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<option value=''>Choose Sub Category</option>");
                            do
                            {                     
                                out.print("<option value='" + res.getString("subcatid") + "'>" + res.getString("subcatname") + "</option>");
                               // out.print("<option value='100'>Men Apparels</option>");
                            }
                            while(res.next());
                        }
                        else
                        {
                             out.print("<option>No Sub Categories</option>");
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