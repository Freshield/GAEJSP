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

		String[] movies1 = {"matrix revolutions","kill bill","boondock saints"};
		String[] movies2 = {"amelie","return of the king","mean girls"};
		List movieList = new ArrayList();
		movieList.add(movies1);
		movieList.add(movies2);
		request.setAttribute("userType", "member1");
		RequestDispatcher view = request.getRequestDispatcher("tester2.jsp");
		view.forward(request, response);
		
	}

}
