<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
       <script src="js/jquery.min.js"></script>
	<script src="js/fancybox/jquery.fancybox.min.js"></script>

    </head>
    <body>
   <a href="images/2.jpg" data-fancybox="group" data-caption="My caption"> <img src="images/2.jpg" height="100"></a>
 <a href="images/3.jpg" data-fancybox="group" data-caption="My caption"> <img src="images/3.jpg" height="100"></a>
 <a href="images/4.jpg" data-fancybox="group" data-caption="My caption"> <img src="images/4.jpg" height="100"></a>
 
 
  <a data-fancybox data-type="iframe" data-src="orderitems.jsp?oid=2" href="javascript:;">
    Order Details
  </a>
 
 
    </body>
</html>
