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
        String cid="",scid="" ,imagename="", path="",pname="",color="",psize="",nstock="";
        
               try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                       cid=request.getParameter("category");
                        scid=request.getParameter("subcategory");
                       pname=request.getParameter("product");
                        color=request.getParameter("color");
                         psize=request.getParameter("Size");
                         
                         nstock=request.getParameter("nstock");
                        String q = "update addvarient set stock=? where catid=? and subcatid=? and prodid=? and colorid=? and size=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, nstock);
                        myst.setString(2, cid);
                        myst.setString(3, scid);
                        myst.setString(4, pname);
                        myst.setString(5, color);
                        myst.setString(6, psize);
                       
                        int res = myst.executeUpdate();
                        if(res==1)
                        {
                             out.print("ProductA");
                        }
                        else
                        {
                             out.print("ProductN");
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
