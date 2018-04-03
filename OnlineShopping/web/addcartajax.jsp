<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
  
        if(session.getAttribute("un")!=null)
        {
               try
                {
                   int q1= Integer.parseInt(request.getParameter("q"));
                   int r= Integer.parseInt(request.getParameter("remamt"));
                   int a=q1*r;
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "insert into carttable(productid,colorid,size,quantity,amount,totalcost,prodpic,username) values(?,?,?,?,?,?,?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, request.getParameter("pid"));
                        myst.setString(2, request.getParameter("rangid"));
                        myst.setString(3, request.getParameter("size"));
                        myst.setString(4,String.valueOf(q1));
                        myst.setString(5, String.valueOf(r));
                        myst.setString(6, String.valueOf(a));
                        myst.setString(7, request.getParameter("ppic"));
                        myst.setString(8, session.getAttribute("un").toString());
                        int res = myst.executeUpdate();
                        if(res==1)
                        {
                             out.print("success");
                        }
                        else
                        {
                             out.print("fail");
                        }
                   }
                   catch(Exception e)
                   {
                       out.print("Error in query " + e.getMessage());
                   }
                   
            }
            catch(Exception e)
            {
                out.print("Error in connection " + e.getMessage());
            }
        }
        else
        {
            out.print("login");
        }
%>