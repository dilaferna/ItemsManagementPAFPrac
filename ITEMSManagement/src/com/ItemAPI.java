package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.net.ssl.SSLKeyException;

import com.sun.org.apache.xerces.internal.xs.XSException;



@SuppressWarnings("restriction")
@WebServlet("/ItemAPI")
public class ItemAPI extends HttpServlet {
	
	
	Item itemObj =new Item();
       
    
    public ItemAPI() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws XSException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
			{ 
			 String output = itemObj.insertItem(request.getParameter("itemCode"), 
			 request.getParameter("itemName"), 
			request.getParameter("itemPrice"), 
			request.getParameter("itemDesc")); 
			response.getWriter().write(output); 
			}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
			{ 
			 Map paras = getParasMap(request); 
			 String output = itemObj.updateItem(paras.get("hidItemIDSave").toString(), 
			 paras.get("itemCode").toString(), 
			 paras.get("itemName").toString(), 
			paras.get("itemPrice").toString(), 
			paras.get("itemDesc").toString()); 
			response.getWriter().write(output); 
			} 
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
			{ 
			 Map paras = getParasMap(request); 
			 String output = itemObj.deleteItem(paras.get("itemID").toString()); 
			response.getWriter().write(output); 
			}

	
	private static Map getParasMap(HttpServletRequest request) 
	{ 
	 Map<String, String> map = new HashMap<String, String>(); 
	try
	 { 
	 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
	 String queryString = scanner.hasNext() ? 
	 scanner.useDelimiter("\\A").next() : ""; 
	 scanner.close(); 
	 String[] params = queryString.split("&"); 
	 for (String param : params) 
	 { 
		 String[] p = param.split("=");
		 map.put(p[0], p[1]); 
		 } 
		 } 
		catch (Exception e) 
		 { 
		 } 
		return map; 
		}

	
	

}
