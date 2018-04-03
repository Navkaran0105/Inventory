<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%              
            try
            {
                String vid= request.getParameter("srno");
                
                Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "delete from addvarient where srno=?" ;
                        
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, vid);
                    
                        int res = myst.executeUpdate();
                        if(res>0)
                        {
                            out.print("success");
                        }
                        else
                        {
                             out.print("error");
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