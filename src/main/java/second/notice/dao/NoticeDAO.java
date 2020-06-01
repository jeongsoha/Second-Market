package second.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	// 공지사항 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("notice.selectNoticeList", map);
	}
	
	// 공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("notice.selectNoticeDetail", map);
	}
	
	//공지사항 조회수 증가
	public void updateCount(Map<String, Object> map) throws Exception{
		update("notice.updateCount", map);
	}

	// 공지사항 상세보기 -파일
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.selectNoticeFileList", map);
	}
	
	// 공지사항 작성
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("notice.insertNotice", map);
	}
	
	// 파일 추가
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("notice.insertFile", map);
	}
	
	// 공지사항 수정
	public void updateNoticeModify(Map<String, Object> map) throws Exception{
		update("notice.updateNoticeModify", map);
	}
	
	// 파일 수정
	public void updateFile(Map<String, Object> map) {
		update("notice.updateFile", map);
	}
	
	// 공지사항 삭제
	public void deleteNotice(Map<String, Object> map) throws Exception{
		update("notice.deleteNotice", map);
	}
	
	// 파일 삭제
	public void deleteFileList(Map<String, Object> map) {
		update("notice.deleteFileList", map);
	}

}
