package foo;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.SkipPageException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

public class SimpleTagTest6 extends SimpleTagSupport {
	
	public void doTag() throws JspException, IOException{
		
		//getJspContext().getOut().print("This is the lamest use of a custom tag");
		//getJspContext().getOut().print("This is the lamest use of a custom tag");
				//getJspContext().setAttribute("message", "Wear sunscreen.");
				//getJspBody().invoke(null);
		
		getJspContext().getOut().print("Message from within doTag()<br>");
		getJspContext().getOut().print("About to throw a skippageexception");
		boolean thingsDontWork = true;
		if(thingsDontWork){
			throw new SkipPageException();
		}
		
	}

}
