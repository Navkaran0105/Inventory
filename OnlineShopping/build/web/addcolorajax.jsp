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
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                       
                        String n="",add="";
                        n = request.getParameter("name");
                        add = request.getParameter("Code");
                        String q = "insert into addcolor(name,colorcode) values(?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, n);
                        myst.setString(2, add);
                        int res = myst.executeUpdate();
                        if(res==1)
                        {
                              out.print("Color Added Successfully");
                        }
                        else
                        {
                             out.print("Color Not Added Successfully");
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

