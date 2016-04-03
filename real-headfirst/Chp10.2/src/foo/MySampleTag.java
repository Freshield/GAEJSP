package foo;

import java.awt.Menu;
import java.io.IOException;





import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

public class MySampleTag extends TagSupport{
	
	private String itemvalue;
	
	public int doStartTag() throws JspException{
		
		return EVAL_BODY_INCLUDE;
		
	}
	
	public void setItemvalue(String itemvalue){
		this.itemvalue = itemvalue;
	}
	
	public String getItemvalue(){
		return itemvalue;
	}
	
	public int doEndTag() throws JspException{
		MyClassicParent parent = (MyClassicParent) getParent();
		parent.addMenuItem(itemvalue);
		return EVAL_PAGE;
	}
	

}
