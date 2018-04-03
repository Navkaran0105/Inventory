<%
  
session.invalidate();

Cookie mycookie=new Cookie("uinfo", "");
mycookie.setMaxAge(0);
response.addCookie(mycookie);

response.sendRedirect("index.jsp");

%>
