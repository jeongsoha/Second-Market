package second.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.common.dao.InformDAO;
import second.common.util.FileUtils;
import second.qna.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {//게시글 전체보기
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaList(map);
	}
	@Override
	public void insertQnaBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {//글쓰기
		// TODO Auto-generated method stub
		qnaDAO.insertQnaBoard(map);
		
		map.put("IDX", map.get("QNA_NUM"));
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request); 
		for(int i=0, size=list.size(); i<size; i++){ qnaDAO.insertFile(list.get(i));

		}
		
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {//상세보기
		// TODO Auto-generated method stub
	    qnaDAO.updateQnaCount(map); 
	    Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = qnaDAO.selectQnaDetail(map);
        resultMap.put("map",tempMap);
		
		List<Map<String,Object>> list = qnaDAO.selectFileList(map); 
		resultMap.put("list", list);
		
		return resultMap;

	}

	@Override
	public void updateQna(Map<String, Object> map, HttpServletRequest request) throws Exception {//수정하기
		// TODO Auto-generated method stub
		qnaDAO.updateQnaModify(map);
		map.put("IDX", map.get("QNA_NUM"));
		
		qnaDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null; 
		for(int i=0, size=list.size(); i<size; i++){ 
			tempMap = list.get(i); if(tempMap.get("IS_NEW").equals("Y")){
				qnaDAO.insertFile(tempMap); 
				} else{
					qnaDAO.updateFile(tempMap);
					} 
			}		
	}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {//삭제하기
		// TODO Auto-generated method stub
		qnaDAO.deleteQna(map);
	}
	
	@Override
	public void insertQnaAnswer(Map<String, Object> map) throws Exception{//답변달기
		// TODO Auto-generated method stub
		 
		qnaDAO.insertQnaAnswer(map);
		informDAO.informInsert(map, "내 QNA에 답변이 달렸습니다.");
	}
	
	@Override
	public List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)throws Exception {
	
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaAnswer(map);
	}

	

}
