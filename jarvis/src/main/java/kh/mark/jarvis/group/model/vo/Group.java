package kh.mark.jarvis.group.model.vo;

public class Group {

	private int g_no;
	private String g_name;
	private String g_master;
	private String g_member;
	private String g_intro;
	private String[] g_category;
	
	public Group() {
		
	}

	public Group(int g_no, String g_name, String g_master, String g_member, String g_intro, String[] g_category) {
		super();
		this.g_no = g_no;
		this.g_name = g_name;
		this.g_master = g_master;
		this.g_member = g_member;
		this.g_intro = g_intro;
		this.g_category = g_category;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_master() {
		return g_master;
	}

	public void setG_master(String g_master) {
		this.g_master = g_master;
	}

	public String getG_member() {
		return g_member;
	}

	public void setG_member(String g_member) {
		this.g_member = g_member;
	}

	public String getG_intro() {
		return g_intro;
	}

	public void setG_intro(String g_intro) {
		this.g_intro = g_intro;
	}

	public String[] getG_category() {
		return g_category;
	}

	public void setG_category(String[] g_category) {
		this.g_category = g_category;
	}
	

	
}
