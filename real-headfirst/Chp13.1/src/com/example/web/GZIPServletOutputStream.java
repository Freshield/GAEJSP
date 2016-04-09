package com.example.web;

import java.io.IOException;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;

public class GZIPServletOutputStream extends ServletOutputStream{
	
	GZIPOutputStream internalGzipOS;
	
	GZIPServletOutputStream(ServletOutputStream sos) throws IOException{
		this.internalGzipOS = new GZIPOutputStream(sos);

		System.out.println("gzip init");
	}
	
	public void write(int param) throws java.io.IOException{
		System.out.println("gzip write");
		internalGzipOS.write(param);
	}

}
