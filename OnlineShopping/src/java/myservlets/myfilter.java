/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlets;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author GTB Student
 */
public class myfilter implements Filter
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException 
    {
    
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    {
        response.getWriter().print(request.getRemoteAddr());// .getRemoteAddr gives us the IP address of the user.
        chain.doFilter(request, response);
    }
    @Override
    public void destroy() 
    {
        
    }
    
}
//in order to use the filter we have to implement filter class. Filter can be attached to full domain by 
//writing /* in <url-pattern>/*</url-pattern> and if we want to attach it to one or more pages we can write
//name in this tag. /* will apply the filter to all files in the project whether it is a picture file or .jsp or .html
//file so if we want to apply it to some specific files we can wrote their domain in the tag.