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
                        String q = "select * from addvarient where prodid=? and colorid=? and size=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1,request.getParameter("pid"));
                         myst.setString(2,request.getParameter("rangid"));
                         myst.setString(3,request.getParameter("sizeid"));
                        ResultSet res = myst.executeQuery();
                        if(res.next()==true)
                        {
                            String st=res.getString("stock");
                            String dis=res.getString("dis");
                            String mrp=res.getString("mrp");
                            int di=Integer.parseInt(dis);
                            int mr=Integer.parseInt(mrp);
                            int remamt=mr-((di*mr)/100);
                            out.print("{\"stock\":\"" + st + "\",\"dis\":\"" + dis + "\",\"mrp\":\"" + mrp + "\",\"remamt\":\""+remamt+"\"}");
                        }
                        else
                        {
                             out.print("");
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