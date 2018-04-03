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
        String cid="",scid="" ,imagename="", path="",pname="",color="",psize="",stock="",mrp="",dis="";
        
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
                           psize=request.getParameter("size");
                            stock=request.getParameter("stock");
                            mrp=request.getParameter("mrp");
                            dis=request.getParameter("dis");
                        String q = "insert into addvarient(Catid,subcatid,prodid,colorid,size,stock,mrp,dis) values(?,?,?,?,?,?,?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, cid);
                        myst.setString(2, scid);
                        myst.setString(3, pname);
                        myst.setString(4, color);
                        myst.setString(5, psize);
                        myst.setString(6, stock);
                        myst.setString(7, mrp);
                        myst.setString(8, dis);
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
