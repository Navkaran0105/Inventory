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
        <script>
$(document).ready(function ()
{
    $('#form1').submit(function (e)
    {
        e.preventDefault();
        
        $.ajax(
                {
                   type: 'post',
                   url: 'updatediscountajax.jsp',
                   data: $("#form1").serialize(),
		  
                    beforeSend: function () 
                    { 
                       $("#msg").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function (reslt)
                    {
                        if ($.trim(reslt) == "Sorry")
                        {
                          $('#msg').html("Sorry only pictures are allowed to upload");
                        } 
                        else if ($.trim(reslt) == "success")
                        {
                          $('#msg').html("coupon updated successfully");   
                          window.location.replace("managediscount.jsp");
                          
                        } 
                        else if($.trim(reslt) == "error")
                        {
                             $('#msg').html("coupon not updated successfully");
                        }
                        else
                        {
                             $('#msg').html(reslt);
                        }
                    },
                    error: function (e)
                    {
                        $('#msg').html("error in ajax");
                    }
                });
    });
});
</script>    
        <title>Update Category</title>
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Update Category</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Update Category</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<%    
        String coupnm="", mintotl="", per="", maxdis="" ;
        String srno = request.getParameter("srno");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            try {
                String q = "select * from discount where srno=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, srno);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    coupnm=res.getString("coupname");
                    mintotl=res.getString("mintotal");
                    per=res.getString("percentage");
                    maxdis=res.getString("maxdiscount");
                    
                } 
            } 
            catch (Exception e) 
            {
                out.print("Error in query " + e.getMessage());
            } 
            finally 
            {
                myconn.close();
            }
        } 
        catch (Exception e) 
        {
            out.print("Error in connection " + e.getMessage());
        }
%>   
	<div class="mail">
		<div class="container">
			<h3>Update Category</h3>
			<div class="register">
                            <form name="form2"></form>
                <form action="#" method="post" id="form1">			
                    <input placeholder="Category Name" name="coupname" type="text" required="" value="<%out.print(coupnm);%>"><br/><br/>	
                   <input placeholder="Category Name" name="mintotal" type="text" required="" value="<%out.print(mintotl);%>"><br/><br/>	
                    <input placeholder="Category Name" name="percentage" type="text" required="" value="<%out.print(per);%>"><br/><br/>	
                     <input placeholder="Category Name" name="maxdiscount" type="text" required="" value="<%out.print(maxdis);%>"><br/><br/>	
                    <input type="hidden" name="srno" value="<%out.print(srno);%>"/>
                    
                        
                        <div class="sign-up">
                            <input type="submit" value="Update Category" name="submit"/>
                        </div><div id="msg"></div>
                </form>
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
