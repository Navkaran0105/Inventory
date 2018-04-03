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

                String un = request.getParameter("email");
                String pass = request.getParameter("password");
                String q = "select name,username,usertype,activated from signup where username=? and password=md5(?) union all select name,username,usertype,null from admintable where username=? and password=md5(?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, un);
                myst.setString(2, pass+salt);
                myst.setString(3, un);
                myst.setString(4, pass+salt);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    if(res.getString("Activated").equalsIgnoreCase("No"))
                    {
                        out.print("notactivated");
                    }
                    else
                    {
                        String n = res.getString("name");
                        session.setAttribute("nm", n);
                        session.setAttribute("un", un);
                        
                        if(request.getParameter("cb1")!=null)
                        {
                            Cookie mycookie = new Cookie("uinfo",un);
                            mycookie.setMaxAge(7*24*60*60);
                            response.addCookie(mycookie);
                        }
                        
                        if (res.getString("usertype").equalsIgnoreCase("admin")) 
                        {
                            session.setAttribute("utype", "admin");
                            out.print("admin");
                        } 
                        else if (res.getString("usertype").equalsIgnoreCase("normal"))
                        {
                            session.setAttribute("utype", "normal");
                            out.print("normal");
                        }
                    }
                } 
                else 
                {
                    out.print("incorrect");
                }
            } 
            catch (Exception e) 
            {
                out.print("Error in query " + e.getMessage());
            } 
            finally 
            {
                myconn.close();
            }
        } 
        catch (Exception e) 
        {
            out.print("Error in connection " + e.getMessage());
        }
%>   