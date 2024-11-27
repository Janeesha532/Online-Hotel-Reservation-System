
package model;

public class Room {
	private int roomId;
	private String RoomType;
	private String FullBoardRate;
	private String HalfBoardRate;
	private String facilities;
	private String RoomImage;
	
	
	
	public Room(int roomId2, String roomType, String fullBoardRate, String halfBoardRate, String facilities, String roomImage) {
		
		this.roomId = roomId2;
		RoomType = roomType;
		FullBoardRate = fullBoardRate;
		HalfBoardRate = halfBoardRate;
		this.facilities = facilities;
		RoomImage = roomImage;
	}


	public int getRoomId() {
		return roomId;
	}


	public String getRoomType() {
		return RoomType;
	}

	
	public String getFullBoardRate() {
		return FullBoardRate;
	}



	public String getHalfBoardRate() {
		return HalfBoardRate;
	}



	public String getFacilities() {
		return facilities;
	}



	public String getRoomImage() {
		return RoomImage;
	}

	
}

