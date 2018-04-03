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
        String cname=request.getParameter("cname");
        String colorcode=request.getParameter("cc");
        String cid=request.getParameter("cid");
               try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "update addcolor set Name=?,colorcode=? where ColorId=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, cname);
                        myst.setString(2, colorcode);
                        myst.setString(3, cid);
                        int res = myst.executeUpdate();
                        if(res==1)
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
                   
            }
            catch(Exception e)
            {
                out.print("Error in connection " + e.getMessage());
            }
           
%>