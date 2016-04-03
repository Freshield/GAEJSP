package foo;

import javax.servlet.jsp.*;


import javax.servlet.jsp.tagext.*;

import java.io.*;

public class MyClassicParent extends TagSupport{
	private String name;
	
	public int doStartTag() throws JspException{
		
		return EVAL_BODY_INCLUDE;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
}
