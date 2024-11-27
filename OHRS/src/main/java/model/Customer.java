package model;

public class Customer {
	
	
	private int bookID;
	private String userId;
	private String cusName;
	private String cusEmail;
	private String checkDate;
	private String checkOut;
	private String roomtype;
	private String guests;
	private String board;
	private String note;
	private String contact;
	private String payment;
	private String hName;
	private String hLocation;
	
	
	
	public Customer(int bookId, String cusName, String cusEmail, String checkDate, String checkOut, String roomtype, String guests, String board, String note, String contact, String payment, String hName, String hLocation, String userId) {
		
		this.bookID = bookId;
		this.cusName = cusName;
		this.cusEmail = cusEmail;
		this.checkDate = checkDate;
		this.checkOut = checkOut;
		this.roomtype = roomtype;
		this.guests = guests;
		this.board = board;
		this.note = note;
		this.contact = contact;
		this.payment = payment;
		this.hName = hName;
		this.hLocation = hLocation;
		this.userId = userId;
	}
	
	public String getuserId() {
		
		return userId;
	}

	public int getBookID() {
		return bookID;
	}

	public String getCusName() {
		return cusName;
	}

	public String getCusEmail() {
		return cusEmail;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public String getGuests() {
		return guests;
	}

	public String getBoard() {
		return board;
	}

	public String getNote() {
		return note;
	}

	public String getContact() {
		return contact;
	}

	public String getPayment() {
		return payment;
	}

	public String gethName() {
		return hName;
	}

	public String gethLocation() {
		return hLocation;
	}
	
	

}
