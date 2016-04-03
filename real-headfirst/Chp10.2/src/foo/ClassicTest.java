package foo;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import java.io.*;

public class ClassicTest extends TagSupport{
	JspWriter out;
	
	
	public int doStartTag() throws JspException{
		
		out = pageContext.getOut();
		
		try{
			out.println(" Before the body");
		}catch(IOException ex){
			throw new JspException("IOException-"+ex.toString());
		}
		return EVAL_BODY_INCLUDE;
	}
	
	public int doEndTag() throws JspException{
		
		try{
			out.println(" After body.");
		}catch(IOException ex){
			throw new JspException("IOException-"+ex.toString());
		}
		return EVAL_PAGE;
		
		
	}

}