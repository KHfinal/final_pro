package kh.mark.jarvis.group.model.vo;

import java.util.Arrays;

public class Group {

	private int g_no;
	private String g_name;
	private String g_master;
	private String g_member;
	private String g_intro;
	private String[] g_category;
	private String g_originalFilename;
	private String g_renamedFilename;
	
	public Group() {
		
	}

	public Group(int g_no, String g_name, String g_master, String g_member, String g_intro, String[] g_category,
			String g_originalFilename, String g_renamedFilename) {
		super();
		this.g_no = g_no;
		this.g_name = g_name;
		this.g_master = g_master;
		this.g_member = g_member;
		this.g_intro = g_intro;
		this.g_category = g_category;
		this.g_originalFilename = g_originalFilename;
		this.g_renamedFilename = g_renamedFilename;
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

	public String getG_originalFilename() {
		return g_originalFilename;
	}

	public void setG_originalFilename(String g_originalFilename) {
		this.g_originalFilename = g_originalFilename;
	}

	public String getG_renamedFilename() {
		return g_renamedFilename;
	}

	public void setG_renamedFilename(String g_renamedFilename) {
		this.g_renamedFilename = g_renamedFilename;
	}

	@Override
	public String toString() {
		return "Group [g_no=" + g_no + ", g_name=" + g_name + ", g_master=" + g_master + ", g_member=" + g_member
				+ ", g_intro=" + g_intro + ", g_category=" + Arrays.toString(g_category) + ", g_originalFilename="
				+ g_originalFilename + ", g_renamedFilename=" + g_renamedFilename + "]";
	}
	
	

	

	
}
