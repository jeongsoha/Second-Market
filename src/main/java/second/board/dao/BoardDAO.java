package second.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("board.selectBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectFileList(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectFileList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}
	
	public void insertFile(Map<String, Object> map)throws Exception{
		insert("board.insertFile",map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("board.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("board.deleteBoard", map);
	}
	
	public void deleteFileList(Map<String,Object>map)throws Exception{
		update("board.deleteFileList",map);
	}
	public void updateFile(Map<String, Object> map)throws Exception{
		update("board.updateFile",map);
	}


}
