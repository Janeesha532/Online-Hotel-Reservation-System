package model;

public class RoomList {
	
	
	private int roomId;
	private int hotelId;
	private int bookinId;
	private String hotelName;
	private String hotelLocation;
	private String RoomType;
	private String RoomImage;
	private String contactNumber;
	private String facilities;
	private String FullBoardRate;
	private String HalfBoardRate;
	private String checkIn;
	private String checkOut;
	
	public RoomList(int roomId, int hotelId, int bookinId, String hotelName, String hotelLocation, String roomType,String roomImage, String contactNumber, String facilities, String fullBoardRate, String halfBoardRate, String checkIn, String checkOut) {
		this.roomId = roomId;
		this.hotelId = hotelId;
		this.bookinId = bookinId;
		this.hotelName = hotelName;
		this.hotelLocation = hotelLocation;
		RoomType = roomType;
		RoomImage = roomImage;
		this.contactNumber = contactNumber;
		this.facilities = facilities;
		FullBoardRate = fullBoardRate;
		HalfBoardRate = halfBoardRate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}

	public int getRoomId() {
		return roomId;
	}



	public int getHotelId() {
		return hotelId;
	}



	public int getBookinId() {
		return bookinId;
	}



	public String getHotelName() {
		return hotelName;
	}



	public String getHotelLocation() {
		return hotelLocation;
	}



	public String getRoomType() {
		return RoomType;
	}



	public String getRoomImage() {
		return RoomImage;
	}



	public String getContactNumber() {
		return contactNumber;
	}



	public String getFacilities() {
		return facilities;
	}



	public String getFullBoardRate() {
		return FullBoardRate;
	}



	public String getHalfBoardRate() {
		return HalfBoardRate;
	}

	public String getCheckIn() {
		return checkIn;
	}


	public String getCheckOut() {
		return checkOut;
	}



	
	
	

}
