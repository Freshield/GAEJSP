package foo;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import java.io.*;

public class MyIteratorTag extends TagSupport{
	JspWriter out;
	
	String[] movies = {"Spiderman","Saved","Amelie"};
	
	int count;
	
	
	public int doStartTag() throws JspException{
		
		out = pageContext.getOut();
		
		try{
			count = 0;
			out.println(" Before the body");
			//pageContext.setAttribute("movie", movies[count]);
			//count++;
		}catch(IOException ex){
			throw new JspException("IOException-"+ex.toString());
		}
		return EVAL_BODY_INCLUDE;
	}
	
	public int doAfterBody() throws JspException{
		
		
		
		if(count<movies.length){
			

			pageContext.setAttribute("movie", movies[count]);
			
			count ++;
			return EVAL_BODY_AGAIN;
		}else{
			return SKIP_BODY;
		}
		
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
