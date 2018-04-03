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
                String c = "delete from discount where srno=?";
                PreparedStatement myset =  myconn.prepareStatement(c);
                myset.setString(1,request.getParameter("srno"));
                if(myset.executeUpdate()>0)
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