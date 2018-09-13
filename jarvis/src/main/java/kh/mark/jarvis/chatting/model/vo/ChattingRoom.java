package kh.mark.jarvis.chatting.model.vo;

public class ChattingRoom {

	private int room_no;
	private String room_title;
	private String my_email;
	private String f_friendEmail;
	
	public ChattingRoom() {}

	public ChattingRoom(int room_no, String room_title, String my_email, String f_friendEmail) {
		super();
		this.room_no = room_no;
		this.room_title = room_title;
		this.my_email = my_email;
		this.f_friendEmail = f_friendEmail;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getRoom_title() {
		return room_title;
	}

	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}

	public String getMy_email() {
		return my_email;
	}

	public void setMy_email(String my_email) {
		this.my_email = my_email;
	}

	public String getF_friendEmail() {
		return f_friendEmail;
	}

	public void setF_friendEmail(String f_friendEmail) {
		this.f_friendEmail = f_friendEmail;
	}

	@Override
	public String toString() {
		return "ChattingRoom [room_no=" + room_no + ", room_title=" + room_title + ", my_email=" + my_email
				+ ", f_friendEmail=" + f_friendEmail + "]";
	}

	
	
	
}
