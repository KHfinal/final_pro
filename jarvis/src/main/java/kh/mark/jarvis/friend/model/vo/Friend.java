package kh.mark.jarvis.friend.model.vo;

public class Friend {
	private String f_memberEmail;
	private String f_friendEmail;
	public String getMemberEmail() {
		return f_memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.f_memberEmail = memberEmail;
	}
	public String getFriendEmail() {
		return f_friendEmail;
	}
	public void setFriendEmail(String friendEmail) {
		this.f_friendEmail = friendEmail;
	}
	public Friend() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Friend [memberEmail=" + f_memberEmail + ", friendEmail=" + f_friendEmail + "]";
	}
	public Friend(String memberEmail, String friendEmail) {
		super();
		this.f_memberEmail = memberEmail;
		this.f_friendEmail = friendEmail;
	}
	
	
	
}
