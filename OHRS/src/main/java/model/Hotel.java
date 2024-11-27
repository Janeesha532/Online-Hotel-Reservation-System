package model;

public class Hotel {

	private int hotelId;
	private String hotelName;
	private String hotelLocation;
	private String contactNumber;
	private String hotelImage;
	private String managerUsername;
	private String managerPassword;
	
	
	public Hotel(int hotelId, String hotelName, String hotelLocation, String contactNumber, String hotelImage, String managerUsername, String managerPassword) {
		this.hotelId = hotelId;
		this.hotelName = hotelName;
		this.hotelLocation = hotelLocation;
		this.contactNumber = contactNumber;
		this.hotelImage = hotelImage;
		this.managerUsername = managerUsername;
		this.managerPassword = managerPassword;
	}


	public int getHotelId() {
		return hotelId;
	}



	public String getHotelName() {
		return hotelName;
	}




	public String getHotelLocation() {
		return hotelLocation;
	}



	public String getContactNumber() {
		return contactNumber;
	}



	public String getHotelImage() {
		return hotelImage;
	}



	public String getManagerUsername() {
		return managerUsername;
	}



	public String getManagerPassword() {
		return managerPassword;
	}

	
	
}
