<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %> 
<%              
            try
            {
                   String catid=request.getParameter("catid");
                   String subcatid=request.getParameter("subcatid");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "select * from addproduct where maincatid=? and subcatid=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, catid);
                        myst.setString(2, subcatid);
                        ResultSet res = myst.executeQuery();
                        
                        if(res.next()==true)
                        {
                            do
                            {                     
                                out.print("<option value='" + res.getString("prodid") + "'>" + res.getString("prodname") + "</option>");
                               // out.print("<option value='100'>Men Apparels</option>");
                            }
                            while(res.next());
                        }
                        else
                        {
                             out.print("<option>No Products</option>");
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