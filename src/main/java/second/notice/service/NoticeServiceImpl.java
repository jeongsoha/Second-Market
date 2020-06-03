package second.notice.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import second.common.dao.InformDAO;
import second.common.util.FileUtils;
import second.notice.dao.NoticeDAO;;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectNoticeList(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		noticeDAO.updateCount(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = noticeDAO.selectNoticeDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = noticeDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void insertNoticeWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.insertNotice(map);
		informDAO.informInsert(map, "새로운 공지사항이 게시되었습니다.");
		
		map.put("IDX", map.get("NOTICE_NUM"));
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			noticeDAO.insertFile(list.get(i));
		}
	}

	@Override
	public void updateNoticeModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("77775");
		System.out.println(map);
		noticeDAO.updateNoticeModify(map);
		System.out.println("77776");
		map.put("IDX", map.get("NOTICE_NUM"));
		System.out.println(map);
		System.out.println("77777");
		noticeDAO.deleteFileList(map);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		System.out.println("====================list===============");
		System.out.println(list);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			System.out.println("=============tempMap=========="+i);
			System.out.print(tempMap);
			System.out.println(size);
			if(tempMap.get("IS_NEW").equals("Y")) {
				noticeDAO.insertFile(tempMap);
			} else {
				noticeDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		noticeDAO.deleteNotice(map);
	}
}














