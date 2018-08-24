package kh.mark.jarvis.friend.model.vo;

public class Friend {
	private String friendName;

	public Friend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Friend(String friendName) {
		super();
		this.friendName = friendName;
	}

	@Override
	public String toString() {
		return "Friend [friendName=" + friendName + "]";
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	
	
	
	
}
