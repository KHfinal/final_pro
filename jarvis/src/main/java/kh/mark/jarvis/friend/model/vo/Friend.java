package kh.mark.jarvis.friend.model.vo;

public class Friend {
	private String f_member_email;
	private String f_friend_email;
	public String getF_member_email() {
		return f_member_email;
	}
	public void setF_member_email(String f_member_email) {
		this.f_member_email = f_member_email;
	}
	public String getF_friend_email() {
		return f_friend_email;
	}
	public void setF_friend_email(String f_friend_email) {
		this.f_friend_email = f_friend_email;
	}
	@Override
	public String toString() {
		return "Friend [f_member_email=" + f_member_email + ", f_friend_email=" + f_friend_email + "]";
	}
	public Friend() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Friend(String f_member_email, String f_friend_email) {
		super();
		this.f_member_email = f_member_email;
		this.f_friend_email = f_friend_email;
	}
	
	
	
	
}
