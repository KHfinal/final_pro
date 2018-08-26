package kh.mark.jarvis.member.model.vo;

public class Member {
	private String member_email;
	private String member_pw;
	private String member_name;
	private String nickname;
	private String phone;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Member [member_email=" + member_email + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", nickname=" + nickname + ", phone=" + phone + "]";
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Member(String member_email, String member_pw, String member_name, String nickname, String phone) {
		super();
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.nickname = nickname;
		this.phone = phone;
	}
	
	
}
