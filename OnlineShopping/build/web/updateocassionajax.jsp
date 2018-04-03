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
        String oname="" ,oldpic="",imagename="", oid="",path="";
        boolean successful=true;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(isMultipart==true)
        {
           FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = null;
           try
           {
                items = upload.parseRequest(request);
           }
           catch (FileUploadException e)
           {
               e.printStackTrace();
           }

           for(FileItem myitem:items)
           {
                if (myitem.isFormField())
                {
                    String itemName1 = myitem.getFieldName();
                    String value=myitem.getString();//it will value of field
                    if(itemName1.equals("oname")) //control's name - textbox name
                    {
                        oname=value;
                    }
                    else if(itemName1.equals("oldpic")) //control's name - textbox name
                    {
                        oldpic=value;
                    }
                    else if(itemName1.equals("oid")) //control's name - textbox name
                    {
                        oid=value;
                    }
                }
                else
                {
                        String type=myitem.getContentType();
                       
                        long size=myitem.getSize()/1024; //kbytes

                        if(size==0)
                        {
                            imagename=oldpic;
                        }
                        else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                                || type.equals("image/png") || type.equals("image/x-png")
                                || type.equals("image/gif")))
                            {
                        imagename=new java.util.Date().getTime()+myitem.getName();
                        path=config.getServletContext().getRealPath("/") + "uploads\\" + imagename;
                        File savefile=new File(path);
                        
                        myitem.write(savefile);    
                        }
                        else
                        {
                            successful=false;
                            out.println("Sorry");
                        }
                }
            }
           if(successful==true)
           {
               try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
                        String q = "update addocassion set Name=?,OcassionPic=? where Id=?";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, oname);
                        myst.setString(2, imagename);
                        myst.setString(3, oid);
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
           }
        }
%>