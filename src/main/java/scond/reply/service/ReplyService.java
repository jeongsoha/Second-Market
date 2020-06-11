package scond.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import second.reply.dto.ReplyVO;

public interface ReplyService {
	
	//댓글목록
	public List<ReplyVO> list(int bno,
			int start, int end, HttpSession session);
	
	//댓글입력
	public void create(ReplyVO vo);
	
	//댓글수정
	public void update(ReplyVO vo);
	//댓글삭제
	public void delete(Integer rno);
	//댓글갯수
	public int count(int bno);
}
