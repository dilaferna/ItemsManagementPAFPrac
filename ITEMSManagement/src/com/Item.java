package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Item {

public Connection connect()
{ 
 Connection con = null; 
 
 try 
 { 
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", 
 "root", ""); 
 //For testing
 System.out.print("Successfully connected"); 
 } 
 catch(Exception e) 
 { 
 e.printStackTrace(); 
 } 
 
 return con; 
}



public String insertItem(String code, String name, String price, String desc) {
	
	 String output = "";
	 
	 try {
	
	Connection con = connect();
	if (con == null) 
	{ 
	return "Error while connecting to the database"; 
	}
	
	// create a prepared statement
	String query = "insert into items (itemID, itemCode, itemName, itemPrice, itemDesc)"
			 + " values (?, ?, ?, ?, ?)"; 
	PreparedStatement preparedStmt = con.prepareStatement(query); 
	// binding values
	preparedStmt.setInt(1, 0); 
	preparedStmt.setString(2, code); 
	preparedStmt.setString(3, name); 
	preparedStmt.setDouble(4, Double.parseDouble(price)); 
	preparedStmt.setString(5, desc);
	
	 
	 preparedStmt.execute(); 
	 con.close(); 
	 output = "Inserted successfully"; 
	 } 

	catch (Exception e) 
	 { 
	 output = "Error while inserting"; 
	 System.err.println(e.getMessage()); 
	 } 
	return output; 
	}


public String readItems()
{ 
		 String output = ""; 
		try
		 { 
		 Connection con = connect(); 
		 if (con == null) 
		 { 
		 return "Error while connecting to the database for reading."; 
		 } 
		 // Prepare the html table to be displayed
		 output = "<table border='1'><tr><th>Item Code</th>" 
		 +"<th>Item Name</th><th>Item Price</th>"
		 + "<th>Item Description</th>" 
		 + "<th>Update</th><th>Remove</th></tr>"; 
		 String query = "select * from items"; 
		 java.sql.Statement stmt = con.createStatement(); 
		 ResultSet rs = stmt.executeQuery(query); 
		 // iterate through the rows in the result set
		 while (rs.next()) 
		 { 
		 String itemID = Integer.toString(rs.getInt("itemID")); 
		 String itemCode = rs.getString("itemCode"); 
		 String itemName = rs.getString("itemName"); 
		 String itemPrice = Double.toString(rs.getDouble("itemPrice")); 
		 String itemDesc = rs.getString("itemDesc"); 
		 // Add a row into the html table
		 output += "<tr><td><input id='hidItemIDUpdate' name='hidItemIDUpdate' type='hidden' value='" + itemID + "'>"
				 + itemCode + "</td>";
		 output += "<td>" + itemName + "</td>"; 
		 output += "<td>" + itemPrice + "</td>"; 
		 
		 output += "<td>" + itemDesc + "</td>";
		 // buttons
		 output += "<td><input name='btnUpdate' " 
		 + " type='button' value='Update' class =' btnUpdate btn btn-secondary button2'></td>"
		 + "<td><form method='post' action='Item.jsp'>"
		 + "<input name='btnRemove' " 
		 + " type='submit' value='Delete' class='btn btn-danger button3'>"
		 + "<input name='hidItemIDDelete' type='hidden' " 
		 + " value='" + itemID + "'>" + "</form></td></tr>"; 
		 } 
		 con.close(); 
		 // Complete the html table
		 output += "</table>"; 
		 } 
		catch (Exception e) 
		 { 
		 output = "Error while reading the items."; 
		 System.err.println(e.getMessage()); 
		 } 
		return output; 
	}

public String deleteItem(String itemID)
{ 
 String output = ""; 
try
 { 
	 Connection con = connect(); 
	 if (con == null) 
	 { 
		 return "Error while connecting to the database for deleting."; 
	 } 
		 // create a prepared statement
		 String query = "delete from items where itemID=?"; 
		 PreparedStatement preparedStmt = con.prepareStatement(query); 
		 // binding values
		 preparedStmt.setInt(1, Integer.parseInt(itemID)); 
		 
		 // execute the statement
		 preparedStmt.execute(); 
		 con.close(); 
		 output = "Deleted successfully"; 
	 } 
		catch (Exception e) 
	 { 
		 output = "Error while deleting the item."; 
		 System.err.println(e.getMessage()); 
	 } 
		return output; 
}

public String updateItem(String ID, String code, String name, String price, String desc)
//4
{
	String output = "";
	try {
		Connection conn = connect();
			if (conn == null) {
			return "Error while connecting to the database for updating.";
		}
		
		// create a prepared statement
		String query = "UPDATE items SET itemCode=?,itemName=?,itemPrice=?,itemDesc=? WHERE itemID=?";
		PreparedStatement preparedStmt = conn.prepareStatement(query);
		//binding values
		preparedStmt.setString(1, code);
		preparedStmt.setString(2, name);
		preparedStmt.setDouble(3, Double.parseDouble(price));
		preparedStmt.setString(4, desc);
		preparedStmt.setInt(5, Integer.parseInt(ID));
		//execute the statement
		preparedStmt.execute();
		conn.close();
		output = "Updated successfully";
	} catch (Exception e) {
	output = "Error while updating the item.";
	System.err.println(e.getMessage());
	}
	return output;
}
}
