package foo;

import java.io.IOException;
import java.util.*;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagTest5 extends SimpleTagSupport {
	
		private List movieList;
		
		
		
	public void setMovieList(List movieList){
		this.movieList = movieList;
	}
		
	public void doTag() throws JspException, IOException{
		System.out.println("here");
		
		System.out.println(movieList);
		Iterator i = movieList.iterator();
		
		while(i.hasNext()){
			String movie = (String) i.next();
			getJspContext().setAttribute("movie", movie);
			getJspBody().invoke(null);
		}
		
	}

}
