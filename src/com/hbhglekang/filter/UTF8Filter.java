package com.hbhglekang.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
 
public class UTF8Filter implements Filter {
 
    public void destroy() {
        // TODO Auto-generated method stub
         
    }
 
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain fc) throws IOException, ServletException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");   
         response.setCharacterEncoding("utf-8");   
         fc.doFilter(request,response);   
         
    }
 
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
         
    }
 
}