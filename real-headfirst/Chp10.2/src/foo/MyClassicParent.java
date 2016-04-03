package foo;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import java.io.*;
import java.util.ArrayList;

public class MyClassicParent extends TagSupport{
	private ArrayList items;
	
	public int doStartTag() throws JspException{
		
		items = new ArrayList();
		
		
		
		return EVAL_BODY_INCLUDE;
	}
	
	public void addMenuItem(String item){
		items.add(item);
	}
	
	public int doEndTag() throws JspException{
		try{
			
			pageContext.getOut().println("Menu items are: "+items);
			
		}catch(Exception ex){
			throw new JspException("Exception: "+ex.toString());
		}
		
		return EVAL_PAGE;
	}
	
	
}