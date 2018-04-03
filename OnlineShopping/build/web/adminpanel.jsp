<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="myvars.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="extfiles.jsp" %>
        <title>Admin Panel</title>
    </head>
    <body>
     <%@include file="adminheader.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Admin Panel</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Admin Panel</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Admin Panel</h3>
			<div class="register">
                            <table class="table table-responsive" width="100%" align="center">
                                <tr align="center">
                                    <td><a href="addcat.jsp"><i class="fa fa-plus fa-3x" aria-hidden="true"></i><br/>Add Category</a></td>
                                    <td><a href="addsubcat.jsp"><i class="fa fa-plus fa-3x" aria-hidden="true"></i><br/>Add Sub Category</a></td>
                                    <td><a href="addprod.jsp"><i class="fa fa-plus fa-3x" aria-hidden="true"></i><br/>Add Product</a></td>
                                </tr>
                                  <tr align="center">
                                    <td><a href="addadmin.jsp"><i class="fa fa-user-plus fa-3x" aria-hidden="true"></i><br/>Add Admin</a></td>
                                    <td><a href="addsubcat.jsp"><i class="fa fa-plus fa-3x" aria-hidden="true"></i><br/>Add Sub Category</a></td>
                                    <td><a href="addprod.jsp"><i class="fa fa-plus fa-3x" aria-hidden="true"></i><br/>Add Product</a></td>
                                </tr>
                            </table>
                        </div>
		</div>
	</div>
        

     
     <%@include file="footer.jsp" %>
    </body>
</html>
