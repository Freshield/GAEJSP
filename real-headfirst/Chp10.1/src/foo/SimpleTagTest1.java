package foo;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagTest1 extends SimpleTagSupport {
	
	public void doTag() throws JspException, IOException{
		
		//getJspContext().getOut().print("This is the lamest use of a custom tag");
		getJspBody().invoke(null);
		
	}

}
