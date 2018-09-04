package kh.mark.jarvis.chatting.model.vo;

import java.util.Date;

public class ChattingContents {

	private int chat_no;
	private int room_no;
	private String writer;
	private String comment;
	private Date writer_date;
	
	public ChattingContents() {}
	
	public ChattingContents(int chat_no, int room_no, String writer, String comment, Date writer_date) {
		super();
		this.chat_no = chat_no;
		this.room_no = room_no;
		this.writer = writer;
		this.comment = comment;
		this.writer_date = writer_date;
	}
	
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getWriter_date() {
		return writer_date;
	}
	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}
	
	@Override
	public String toString() {
		return "ChattingContents [chat_no=" + chat_no + ", room_no=" + room_no + ", writer=" + writer + ", comment="
				+ comment + ", writer_date=" + writer_date + "]";
	}
	
	
}
