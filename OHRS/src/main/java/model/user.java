package model;

public class user {
 private int user_id;
 private String name;
 private String email;
 private String address;
 private String contactNum;
 private String dob;
 private String password;
 
 
public user(int user_id, String name, String email, String address, String contactNum, String dob, String password) {
	this.user_id = user_id;
	this.name = name;
	this.email = email;
	this.address = address;
	this.contactNum = contactNum;
	this.dob = dob;
	this.password = password;
}


public int getUser_id() {
	return user_id;
}


public String getName() {
	return name;
}


public String getEmail() {
	return email;
}


public String getAddress() {
	return address;
}


public String getContactNum() {
	return contactNum;
}


public String getDob() {
	return dob;
}


public String getPassword() {
	return password;
}



 
}
