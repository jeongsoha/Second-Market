package second.reply.dto;

import java.sql.Date;

public class ReplyVO {

	private int rno;		//댓글 번호
	private int bno;		//게시글 번호
	private String replytext;	//댓글 내용  
	private String replyer;		//댓글 작성자 
	private String username;	// 댓글 작성자의 이름  
	private Date regdate;		//작성일 
	private Date updatedate;	//수정일 
	private String secretReply; //댈슬 굼김 유무 
	private String writer;		//게시글의 작성자
	public int getRno() {
		return rno;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getSecretReply() {
		return secretReply;
	}
	public void setSecretReply(String secretReply) {
		this.secretReply = secretReply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}

	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno+ ", bno=" +bno+ ", replytext=" +replytext+", replyer="+replyer
				+ ", username="+username+ ", regdate=" +regdate+ ", updatedate="+updatedate+ ", secretReply="
				+secretReply+ ", writer=" +writer+ "]";
				
				
	}
	
}
