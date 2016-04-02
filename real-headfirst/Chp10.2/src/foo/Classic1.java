package foo;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import java.io.*;

public class Classic1 extends TagSupport{
	
	public int doStartTag() throws JspException{
		
		JspWriter out = pageContext.getOut();
		
		try{
			out.println("classic tag output");
		}catch(IOException ex){
			throw new JspException("IOException-"+ex.toString());
		}
		return SKIP_BODY;
	}

}
