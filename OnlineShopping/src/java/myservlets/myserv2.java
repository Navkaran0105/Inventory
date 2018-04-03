package myservlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class myserv2 extends HttpServlet
{
    PrintWriter obj;
    @Override
    public void service(HttpServletRequest myreq, HttpServletResponse myres) throws IOException
    {
        obj = myres.getWriter();
        obj.print("Welcome to Servlets");
    }
}
