package com.example.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BeerRequestFilter implements Filter{
	
	private FilterConfig fc;
	
	public void init(FilterConfig config) throws ServletException{
		this.fc = config;
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
	throws ServletException, IOException{
		HttpServletRequest httpReq = (HttpServletRequest) req;
		
		String name = httpReq.getRemoteUser();
		
		if(name != null){
			fc.getServletContext().log("User "+name+" is updating");
		}
		
		chain.doFilter(req, resp);
	}
	
	public void destroy(){
		
	}

}
