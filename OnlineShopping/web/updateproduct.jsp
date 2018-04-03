<%-- 
    Document   : signup
    Created on : May 10, 2017, 9:31:50 AM
    Author     : Sarai
--%>

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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="myvars.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="extfiles.jsp" %>
        <title>Update Product</title>
        <script>
            
            $(document).ready(function()
            {
               $("#cat").change(function()
               {
                  var cat=$(this).val();
                  $.ajax(
                    {
                        url:'ajaxfiles/showsubcatajax.jsp',
                        type:'post',
                        data:{"cat":cat},
                        beforeSend:function()
                        {
                            $("#showpreloader").html("<img src='pics/preloader.gif'></img>");
                        },
                        success:function(result)
                        {
                             $("#showpreloader").html("");
                             $("#subcat").html("<option value=''>Choose Sub Category</option>"+result);
                        },
                        error:function(e)
                        {
                            $("#showpreloader").html("Error in Ajax");
                        }

                    });
               }); 
               
               $("#form").submit(function(e)
               {
                  e.preventDefault();
               var fd=new FormData($(this)[0]);
               $.ajax(
                {
                    url:"updateproductajax.jsp",
                    type:"post",
                    data:fd,
                    contentType:false,
                    cache:false,
                    processData:false,
                    beforeSend:function()
                    {
                        $("#msg").html("<img src='pics/preloader.gif'/>");
                    },
                    success:function(result)
                    {
                        if($.trim(result)==='Sorry')
                        {
                             $("#msg").html("Sorry only pictures are allowed to upload");
                        }
                        else if($.trim(result)==='success')
                        {
                             $("#msg").html("Product updated successfully");
                              window.location.replace("manageproduct.jsp");
                        }
                         else if($.trim(result)==='fail')
                        {
                             $("#msg").html("Product not updated");
                        }
                    },
                    error:function(e)
                    {
                         $("#msg").html("Error "+e);
                    }
                }); 
               }); 
            });
            
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- banner -->
        <div class="banner10" id="home1">
            <div class="container">
                <h2>Update Product</h2>
            </div>
        </div>
        <!-- //banner -->

        <!-- breadcrumbs -->
        <div class="breadcrumb_dress">
            <div class="container">
                <ul>
                    <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
                    <li>Update Product</li>
                </ul>
            </div>
        </div>
        <!-- //breadcrumbs -->
        
          <%
                      
            String pid="",ppic="",pname="",cid="",scid="",oid="",bid="";
            
                      try
                        {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                        try
                        {
                            
                             pid=request.getParameter("id");

                                String q="select * from addproduct where prodid=?";
                                PreparedStatement a=cn.prepareStatement(q);
                                a.setString(1,pid);
                              
                                ResultSet r=a.executeQuery();
                                if(r.next())
                                {
                                    ppic=r.getString("prodpic");
                                    pname=r.getString("prodname");
                                    cid=r.getString("maincatid");
                                    scid=r.getString("subcatid");
                                    oid=r.getString("ocassion");
                                    bid=r.getString("brand");
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
          %>  
        
        <div class="mail">
            <div class="container">
                <h3>Update Product</h3>    

                <div class="register">
                    <form action="#" method="post" id="form" enctype="multipart/form-data" >
                          <input placeholder="Product Name" name="pname" type="text" required="" value="<%out.print(pname);%>">
                          <div class="m">
                        <select name="category" id="cat" class="form-control">
                            <option value="">Choose Category</option>
                            <%
                               
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                                    try {

                                        String q = "select * from addcat";
                                        PreparedStatement a = cn.prepareStatement(q);

                                        ResultSet r = a.executeQuery();
                                        if (r.next() == true)
                                        {
                                            do
                                            {
                                                String id=r.getString("catid");
                                                if(id.equals(cid))
                                                {
                                                out.print("<option value='"+r.getString("catid")+"' selected>"+r.getString("catname")+"</option>");
                                                }
                                                else
                                                {
                                                    out.print("<option value='"+r.getString("catid")+"'>"+r.getString("catname")+"</option>");
                                                }
                                            }
                                            while(r.next()==true);
                                        } 
                                        else 
                                        {
                                            out.print("No Category");
                                        }

                                    } catch (Exception e) {
                                        out.print("Exception in query :" + e.getMessage());
                                    }
                                } catch (Exception e) {
                                    out.print("Exception in  Connection :" + e.getMessage());
                                }
      
                            %>    
                        </select></div><div id="showpreloader"></div>
                        <div class="m">
                         <select name="subcategory" id="subcat" class="form-control">
                            <option value="">Choose Sub Category</option>
                                <%
                               
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                                    try {

                                        String q = "select * from addsubcat where maincatid=?";
                                        PreparedStatement a = cn.prepareStatement(q);
                                        a.setString(1,cid);

                                        ResultSet r = a.executeQuery();
                                        if (r.next() == true)
                                        {
                                            do
                                            {
                                                String id=r.getString("subcatid");
                                                if(id.equals(scid))
                                                {
                                                out.print("<option value='"+r.getString("subcatid")+"' selected>"+r.getString("subcatname")+"</option>");
                                                }
                                                else
                                                {
                                                    out.print("<option value='"+r.getString("subcatid")+"'>"+r.getString("subcatname")+"</option>");
                                                }
                                            }
                                            while(r.next()==true);
                                        } 
                                        else 
                                        {
                                            out.print("<option>No Sub Category</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print("Exception in query :" + e.getMessage());
                                    }
                                } catch (Exception e) {
                                    out.print("Exception in  Connection :" + e.getMessage());
                                }
      
                            %> 
                         </select></div>
                         <div class="m">
                    <select name="brand" id="brand" class="form-control">
                            <option value="">Choose Brand</option>
                            <%
                               
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                                    try {

                                        String q = "select * from addbrand";
                                        PreparedStatement a = cn.prepareStatement(q);

                                        ResultSet r = a.executeQuery();
                                        if (r.next() == true)
                                        {
                                            do
                                            {
                                                String id=r.getString("brandid");
                                                if(id.equals(bid))
                                                {
                                                out.print("<option value='"+r.getString("brandid")+"' selected>"+r.getString("brandname")+"</option>");
                                                }
                                                else
                                                {
                                                    out.print("<option value='"+r.getString("brandid")+"'>"+r.getString("brandname")+"</option>");
                                                }
                                            }
                                            while(r.next()==true);
                                        } 
                                        else 
                                        {
                                            out.print("No Brands Available");
                                        }

                                    } catch (Exception e) {
                                        out.print("Exception in query :" + e.getMessage());
                                    }
                                } catch (Exception e) {
                                    out.print("Exception in  Connection :" + e.getMessage());
                                }
                          
  
                            %>    
                    </select></div>
                    <div class="m">
                    <select name="occasion" id="occ" class="form-control">
                            <option value="">Choose Occasion</option>
                            <%
                               
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
                                    try {

                                        String q = "select * from addocassion";
                                        PreparedStatement a = cn.prepareStatement(q);

                                        ResultSet r = a.executeQuery();
                                        if (r.next() == true)
                                        {
                                            do
                                            {
                                                String id=r.getString("id");
                                                if(id.equals(oid))
                                                {
                                                    out.print("<option value='"+r.getString("id")+"' selected>"+r.getString("name")+"</option>");
                                                }
                                                else
                                                {
                                                    out.print("<option value='"+r.getString("id")+"'>"+r.getString("name")+"</option>");
                                                }
                                            }
                                            while(r.next()==true);
                                        } 
                                        else 
                                        {
                                            out.print("<option>No Occasions Available</option>");
                                        }

                                    } catch (Exception e) {
                                        out.print("Exception in query :" + e.getMessage());
                                    }
                                } catch (Exception e) {
                                    out.print("Exception in  Connection :" + e.getMessage());
                                }
                          
  
                            %>    
                    </select></div>
                    <img src="uploads/<%out.print(ppic);%>" width='75'/>
                    <input type="hidden" name="pid" value="<%out.print(pid);%>"/>
                    <input type="hidden" name="ppic" value="<%out.print(ppic);%>"/>
                      <div class="m">
                          <input  type="file" name="prodpic" >
                      </div>	
                     

                        <div class="sign-up">
                            <input type="submit" value="Update Product" name="submit"/>
                        </div>    
                    <div id="msg"></div>   
                            

                    </form>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
