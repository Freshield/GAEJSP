package com.example.web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.zip.*;


public class CompressionFilter implements Filter{
	
	private ServletContext ctx;
	private FilterConfig cfg;
	
	public void init(FilterConfig cfg)
	throws ServletException{
		
		this.cfg = cfg;
		ctx = cfg.getServletContext();
		ctx.log(cfg.getFilterName()+" initialized");
		System.out.println(cfg.getFilterName()+" initialized");
		
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
	throws IOException, ServletException{
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		String valid_encodings = request.getHeader("Accept-Encoding");
		System.out.println(valid_encodings);
		if(valid_encodings.indexOf("gzip") > -1){
			
			CompressionResponseWrapper wrappedResp = new CompressionResponseWrapper(response);
			
			wrappedResp.setHeader("Content-Encoding", "gzip");
			
			fc.doFilter(request, wrappedResp);
			
			GZIPOutputStream gzos = wrappedResp.getGZIPOutputStream();
			gzos.finish();
			
			ctx.log(cfg.getFilterName()+": finished the request.");
			System.out.println(cfg.getFilterName()+": finished the request.");
			
		}else{
			ctx.log(cfg.getFilterName()+": no encoding performed.");
			System.out.println(cfg.getFilterName()+": no encoding performed.");
		}
	}
	
	public void destroy(){
		cfg = null;
		ctx = null;
	}

}