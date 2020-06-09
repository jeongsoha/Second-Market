package second.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	// 자유게시판 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("board.selectBoardList", map);
	}

	// 자유게시판 조회수 증가
	public void updateCount(Map<String, Object> map) throws Exception {
		update("board.updateCount", map);
	}

	// 자유게시판 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("board.selectBoardDetail", map);
	}

	// 자유게시판 상세보기 -파일
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("board.selectBoardFileList", map);
	}

	// 자유게시판 글작성
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}

	public void updateBoardModify(Map<String, Object> map) throws Exception {
		update("board.updateBoardModify", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception {
		update("board.updateFile", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("board.deleteBoard", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception {
		update("board.deleteFileList", map);
	}
}
