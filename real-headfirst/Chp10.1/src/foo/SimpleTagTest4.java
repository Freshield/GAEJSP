package foo;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagTest4 extends SimpleTagSupport {
	
	public void doTag() throws JspException, IOException{
		

		String[] movies = {"monsoon wedding","saved","fahrenheit 9/11"};
		
		for(int i = 0;i<movies.length;i++){
			getJspContext().setAttribute("movie", movies[i]);
			getJspBody().invoke(null);
		}
		
	}

}
