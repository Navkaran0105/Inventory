<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>

<%
        
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String un = request.getParameter("un");
                        String code = request.getParameter("seccode");
                        String c = "select * from signup where Username=? and ActCode=?";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        myset.setString(1,un);
                        myset.setString(2,code);
                        ResultSet rs = myset.executeQuery();
                        if(rs.next()==true)
                        {
                           c = "update signup set activated=? where actcode=? and username=?"; 
                           
                               myset =  myconn.prepareStatement(c);
                               myset.setString(1,"Yes");
                               myset.setString(2,code);
                                myset.setString(3,un);
                               int rc = myset.executeUpdate();
                               if(rc==1)
                               {
                                   
                                   response.sendRedirect("login.jsp?msg2=true");
                               }
                   
                        }
                        
                        else
                        {
                            out.print("Problem while signing up");
                        }
                           
                        
                   }
                   catch(Exception e)
                   {
                        out.print("Error in connection " + e.getMessage());
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