/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlets;

import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class sumserv extends HttpServlet implements Myvars
{
    PrintWriter obj;
    HttpSession ses;
    protected void sum(HttpServletRequest myreq, HttpServletResponse myresp) throws ServletException,IOException
    {
      String dbpth1 = getServletConfig().getInitParameter("dbpath");//using local servlet variable declared in the servlet
      String dbpth = getServletContext().getInitParameter("dbpath");//using the global variables declared in the web.xml file
      String dbusr = getServletContext().getInitParameter("dbuser");//using the global variables declared in the web.xml file
      String dbps = getServletContext().getInitParameter("dbpass");//using the global variables declared in the web.xml file
      obj = myresp.getWriter();//getting the writer to use .print function
       try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dbpth1, dbusr, dbps); 
            try
            {
                String un = myreq.getParameter("email");
                String pass = myreq.getParameter("password");
                String q = "select name,username,usertype,activated from signup where username=? and password=md5(?) union all select name,username,usertype,null from admintable where username=? and password=md5(?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, un);
                myst.setString(2, pass+salt);
                myst.setString(3, un);
                myst.setString(4, pass+salt);
                ResultSet res = myst.executeQuery();
                if (res.next() == true) 
                {
                    if(res.getString("Activated").equalsIgnoreCase("No"))
                    {
                        
                        obj.print("Your account is not activated");
                    }
                    else
                    {
                        String n = res.getString("name");
                        ses=myreq.getSession();
                        ses.setAttribute("nm", n);
                        ses.setAttribute("un", un);
                        
                        if(myreq.getParameter("cb1")!=null)
                        {
                            Cookie mycookie = new Cookie("uinfo",un);
                            mycookie.setMaxAge(7*24*60*60);
                            myresp.addCookie(mycookie);
                        }
                        
                        if (res.getString("usertype").equalsIgnoreCase("admin")) 
                        {
                            ses.setAttribute("utype", "admin");
                            //obj.print("admin");
                           // myresp.sendRedirect("adminpanel.jsp");
                           
                       RequestDispatcher mydisp = myreq.getRequestDispatcher("adminpanel.jsp");
                       mydisp.forward(myreq, myresp);//moves the control to the page mentioned in the dispatcher
                           
                        } 
                        else if (res.getString("usertype").equalsIgnoreCase("normal"))
                        {
                           ses.setAttribute("utype", "normal");
                           myresp.sendRedirect("index.jsp");
                        }
                    }
                } 
                else 
                {
                     myreq.setAttribute("msg", "Incorrect Username/Password");//to allow the usaubility of this variable anywhere in the jsp file without the help of session 
                    RequestDispatcher mydisp = myreq.getRequestDispatcher("login1.jsp");//can be used in the place of response.sendRedirect
                    mydisp.include(myreq, myresp);//brings the data of the other page on the page we are on 
                   
                    //obj.print("Incorrect Username/Password");
                    
                   
                }
            } 
            catch (Exception e) 
            {
                obj.print("Error in query " + e.getMessage());
            }
        } 
        catch (Exception e) 
        {
            obj.print("Error in connection " + e.getMessage());
        }
    }
    @Override
    protected void doPost(HttpServletRequest myreq, HttpServletResponse myresp)throws ServletException, IOException
    {
       sum(myreq,myresp);     
    }
    @Override
    protected void doGet(HttpServletRequest myreq, HttpServletResponse myresp)throws ServletException, IOException
    {
       sum(myreq,myresp);
    }
}
   