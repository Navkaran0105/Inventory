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
        String cid="",scid="" ,imagename="", path="",pname="",bname="",oname="",gen="",descp="";
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
                    
                    if(itemName1.equals("category")) //control's name - textbox name
                    {
                        cid=value;
                    }
                    else if(itemName1.equals("subcategory")) //control's name - textbox name
                    {
                        scid=value;
                    }
                    else if(itemName1.equals("brand")) //control's name - textbox name
                    {
                        bname=value;
                    }
                    else if(itemName1.equals("productname")) //control's name - textbox name
                    {
                        pname=value;
                    }
                    else if(itemName1.equals("Ocassion")) //control's name - textbox name
                    {
                        oname=value;
                    }
                    else if(itemName1.equals("gen")) //control's name - textbox name
                    {
                        gen=value;
                    }
                    else if(itemName1.equals("descrip")) //control's name - textbox name
                    {
                        descp=value;
                    }
                }
                else
                {
                        String type=myitem.getContentType();
                       
                        long size=myitem.getSize()/1024; //kbytes

                        if(size==0)
                        {
                            imagename="noimagefound.jpg";
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
                        String q = "insert into addproduct(prodname,maincatid,subcatid,brand,ocassion,prodpic,featured,description) values(?,?,?,?,?,?,?,?)";
                        PreparedStatement myst =  myconn.prepareStatement(q);
                        myst.setString(1, pname);
                        myst.setString(2, cid);
                        myst.setString(3, scid);
                        myst.setString(4, bname);
                        myst.setString(5, oname);
                        myst.setString(6, imagename);
                         myst.setString(7, gen);
                          myst.setString(8, descp);
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
                   
            }
            catch(Exception e)
            {
                out.print("Error in connection " + e.getMessage());
            }
           }
        }
        %>
