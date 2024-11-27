package model;

public class Payment {

	private int id;
	private String fullName;
	private String email;
	private String cardType;
	private String cardNumber;
	private String expiryDate;
	private String CVC;
	private String totalAmount;

	public Payment(int id, String fullName, String email, String cardType, String cardNumber, String expiryDate,
			String cVC, String totalAmount) {
		
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.cardType = cardType;
		this.cardNumber = cardNumber;
		this.expiryDate = expiryDate;
		this.CVC = cVC;
		this.totalAmount = totalAmount;
	}


	public int getPaymentId() {
		return id;
	}

	public String getFullName() {
		return fullName;
	}

	public String getEmail() {
		return email;
	}

	public String getCardType() {
		return cardType;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public String getCVC() {
		return CVC;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

}
