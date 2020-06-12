package secodn.reply.dao;

import java.util.List;

import second.reply.dto.ReplyVO;

public interface ReplyDAO {

	// 댓글 목록
	public List<ReplyVO> list(Integer bno, int start, int End);

	// 입력
	public void create(ReplyVO vo);

	// 수정
	public void update(ReplyVO vo);

	// 삭제
	public void delete(Integer rno);

	// 갯수
	public int count(int bno);

}
