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
              
                String un = request.getParameter("emid");
                String c = "select * from signup where username=?";
                PreparedStatement myset =  myconn.prepareStatement(c);
                myset.setString(1,un);
                ResultSet rs = myset.executeQuery();
                if(rs.next()==true)
                {
                    out.print("exists"); 
                }
                else
                {
                    out.print("avail");
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