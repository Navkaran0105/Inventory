<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <script src="js/jquery-ui/jquery-ui.js"></script>
       <link rel="stylesheet" href="js/jquery-ui/jquery-ui.css">

<script>
  $( function() 
  {
    $( "#dob" ).datepicker({
      changeMonth: true,
      changeYear: true
    })
    $( "#dob" ).datepicker( "option", "dateFormat", "yy-mm-dd");
 });
  </script>
        <title>Categories</title>
        
<script>
$(document).ready(function()
{
	$("#name").blur(function()
	{
		var nm = $(this).val();
		$.ajax(
		{
		  url: 'showname.jsp',
		  type: 'post',
		  data: {"name":nm},
                 beforeSend: function () 
		 { 
		 	$("#showname").html("<img src='pics/preloader.gif'>"); 
		 },
		 success: function(result) 
                    {
                          $('#showname').html(result);
                    },
		  error: function(e) 
			  {
				$('#showname').html("Error in Ajax");
			  }
		});
	});
        
        $("#email").blur(function()
	{
		var em = $(this).val();
		$.ajax(
		{
                    url: 'checkavailajax.jsp',
                    type: 'post',
                    data: {"emid":em},
                    beforeSend: function () 
                    { 
                            $("#availdiv").html("<img src='pics/preloader.gif'>"); 
                    },
                    success: function(result)
                    {
                        if($.trim(result)=="exists")
                        {
                          $('#email').css("border-color","red");
                          $('#availdiv').html("You have already signed up.<br/><a href='forgotpass.jsp'>Recover Password</a>");
                          //$("#b1").hide()
                          $( "#b1" ).prop( "disabled", true);
                        }
                        else
                        {
                            $('#email').css("background-color","green");
                            $('#availdiv').html("");
                            $( "#b1" ).prop("disabled",false);
                        }
                    },
                      error: function(e) 
                    {
                          $('#availdiv').html("Error in Ajax");
                    }
		});
	});
});
</script>
        
        
    </head>
    <body>
     <%@include file="header.jsp" %>
     
     
     
<!-- //header -->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>Product Categories</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul><li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Product Categories</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Product Categories</h3>
			<div class="register">
                         <%
  
            try
            {
                   Class.forName("com.mysql.jdbc.Driver");
                   
                   Connection myconn = DriverManager.getConnection(dbpath, dbuser, dbpass);
                   try
                   {
     
                        String c = "select * from addcat";
                        PreparedStatement myset =  myconn.prepareStatement(c);
                        ResultSet rs = myset.executeQuery();
                        if(rs.next()==true)
                        {
                            int count=0;
                            out.print("<table width='100%' class='table' align='center'>");
                            out.print("<tr align='center'>");
                            do
                            {   
                                if(count==4)
                                {
                                    out.print("</tr><tr align='center'>");
                                    count=0;
                                }
                                out.print("<td><a href='showsubcat.jsp?cid=" + rs.getString("catid") + "'><img src='uploads/"  + rs.getString("catpic") + "' width='75'><br/>" + rs.getString("catname") + "</a></td>");
                                count++;
                            }
                            while(rs.next());
                            out.print("</tr></table>");
                        }
                        else
                        {
                            out.print("No Categories");
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
        </div>
		</div>
	</div>
     
       


     
     <%@include file="footer.jsp" %>
    </body>
</html>
