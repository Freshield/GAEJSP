package com.example.web;

import java.util.*;


import org.apache.struts.action.*;

import com.example.model.*;

import javax.servlet.http.*;

public class BeerSelectAction extends Action{
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		BeerSelectForm myForm = (BeerSelectForm) form;
		
		
		BeerExpert be = new BeerExpert();
		List result = be.getBrands(myForm.getColor());
		
		request.setAttribute("style", result);
		return mapping.findForward("show_results");
	}

}
