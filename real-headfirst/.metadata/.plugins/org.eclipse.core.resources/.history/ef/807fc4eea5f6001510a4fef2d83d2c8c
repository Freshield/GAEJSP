package foo;

import javax.servlet.*;
import javax.servlet.http.*;

import foo.*;

import java.io.*;
import java.util.*;


public class TestMovie extends HttpServlet {


	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		doGet(request,response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException{


		String[] movieList = {"amelie","return of the king","mean girls"};
		request.setAttribute("movieList", movieList);
		RequestDispatcher view = request.getRequestDispatcher("tester.jsp");
		view.forward(request, response);
		
	}

}
