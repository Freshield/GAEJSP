package foo;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

public class SimpleTagTest3 extends SimpleTagSupport {
	
	public void doTag() throws JspException, IOException{
		
		//getJspContext().getOut().print("This is the lamest use of a custom tag");
		//getJspContext().getOut().print("This is the lamest use of a custom tag");
				getJspContext().setAttribute("message", "Wear sunscreen.");
				getJspBody().invoke(null);
		
	}

}
