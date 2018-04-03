<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@include file="myvars.jsp" %>

  
   <%
                                String cid="",imagename="", imgpath="",ppic="",scid="",pname="",bid="",oid="",pid="";
                                boolean successful=true;
                                boolean multi= ServletFileUpload.isMultipartContent(request);
                                
                                if(multi==true)
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
                                               String itemName1 = myitem.getFieldName();//it will return name of field
                                               String value=myitem.getString();//it will value of field

                                               if(itemName1.equals("pname")) //control's name - textbox name
                                               {
                                                   pname=value;
                                               }
                                               else if(itemName1.equals("category")) //control's name - textbox name
                                               {
                                                   cid=value;
                                               }
                                               else if(itemName1.equals("subcategory")) //control's name - textbox name
                                               {
                                                   scid=value;
                                               }
                                               else  if(itemName1.equals("brand")) //control's name - textbox name
                                               {
                                                   bid=value;
                                               }
                                               else  if(itemName1.equals("occasion")) //control's name - textbox name
                                               {
                                                   oid=value;
                                               }
                                               else  if(itemName1.equals("pid")) //control's name - textbox name
                                               {
                                                   pid=value;
                                               }
                                               else if(itemName1.equals("ppic")) //control's name - textbox name
                                               {
                                                   ppic=value;
                                               }

                                            }
                                           else
                                           {
                                                   String type=myitem.getContentType();
                                                   long size=myitem.getSize()/1024; //kbytes

                                                   if(size==0)
                                                   {
                                                       imagename=ppic;
                                                   }
                                                   else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                                                           || type.equals("image/png") || type.equals("image/x-png")
                                                           || type.equals("image/gif")))
                                                       {
                                                   imagename=new java.util.Date().getTime()+myitem.getName();
                                                   imgpath=config.getServletContext().getRealPath("/") + "uploads\\" + imagename;
                                                   File savefile=new File(imgpath);
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

                                        Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                                        try
                                        {


                                                String q="update addproduct set prodname=?,maincatid=?,subcatid=?,brand=?,ocassion=?,prodpic=? where prodid=?";
                                                PreparedStatement a=cn.prepareStatement(q);

                                               
                                                a.setString(1,pname);
                                                a.setString(2,cid);
                                                a.setString(3,scid);
                                                a.setString(4,bid);
                                                a.setString(5,oid);
                                                a.setString(6,imagename);
                                                a.setString(7,pid);


                                                int r=a.executeUpdate();
                                                if(r==1)
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
                                            out.print("Exception in query :"+e.getMessage());
                                        }
                                        finally
                                        {
                                            cn.close();
                                        }
                                    }
                                    catch(Exception e)
                                    {
                                        out.print("Exception in  Connection :"+e.getMessage());
                                    }
                                      }
                                    }

                            %>   