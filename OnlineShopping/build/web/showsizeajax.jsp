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
                        String q = "select * from addvarient where prodid=? and colorid=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1,request.getParameter("pid"));
                         myst.setString(2,request.getParameter("rangid"));
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            out.print("<option value=''>Choose Size</option>");
                            do
                            {                     
                                out.print("<option>" + res.getString("Size") + "</option>");
                               // out.print("<option value='100'>Men Apparels</option>");
                            }
                            while(res.next());
                        }
                        else
                        {
                             out.print("<option>No size</option>");
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