package second.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import second.common.dao.InformDAO;
import second.common.util.FileUtils;
import second.shop.dao.ShopDAO;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map, String keyword, String searchType, String sortType) throws Exception {
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		return shopDAO.selectGoodsList(map);
	}
	
	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// 내용에서 이미지 긁어오기 시작
		String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
		String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
		String img_thumb=""; // img_list의 첫번째 경로를 저장함
		String comp_text=" src=\"/second/file/"; // 반복문 안에 temp와 비교될 텍스트. equals(" src=\"")는 안되길래 따로 빼둠
		String content = (String)map.get("GOODS_CONTENT"); // 저장된 본문을 불러옴
		int imgCount = 0;
		for(int i = 0; i+19 < content.length(); i++) { // 텍스트 비교
			String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
			temp = content.substring(i,i+19); // content에서 잘라낸 텍스트를 temp에 저장
			if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
				img_templist += content.substring(i+19, i+55)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
				imgCount++;
			}
		}
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_templist = img_templist.substring(0, img_templist.length()-1); // 경로 뒤에 남는 쉼표 제거
			img_thumb = img_templist.substring(0, 36); // 이미지가 있을 경우 첫번째 경로를 썸네일로 저장해줌
			map.put("GOODS_THUMBNAIL", img_thumb); // 썸네일 값 전달
		} else { // img_list가 비어 있을 경우
			map.put("GOODS_THUMBNAIL",""); // 이미지 없음
		}
		// 내용에서 이미지 긁어오기 끝
		
		// 상품정보 등록 쿼리 실행
		shopDAO.insertGoods(map);
		 
		
		// 상품 등록 시 IDX 값을 받아 이미지 테이블에 값들을 담아줌
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_list = img_templist.split(",");
			for(int i = 0 ; i<imgCount; i++) {
				map.put("FILES_STD", img_list[i]);
				System.out.println((i+1)+"번째업로드 ==========================================");
				shopDAO.insertFile(map); 
				System.out.println((i+1)+"번째업로드끝=========================================");
			}
		}
	}
	
	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception {
		shopDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = shopDAO.selectGoodsDetail(map);
		Map<String, Object> memberMap = shopDAO.selectMemberInfo(tempMap);
		Map<String, Object> reportMap = shopDAO.selectGoodsReport(map); //(유진추가) 신고당한 글을 알아보기 위한 맵
		
		resultMap.put("map", tempMap);
		resultMap.put("memberMap", memberMap);
		resultMap.put("reportMap", reportMap);
		 
		
		if(map.containsKey("LIKE_MEM_ID")) {
			Map<String, Object> goodsLikeMap = shopDAO.selectGoodsLike(map);
			resultMap.put("goodsLikeMap", goodsLikeMap);
		}
		
		List<Map<String, Object>> list = shopDAO.selectFileList(map);
		resultMap.put("list", list);
		 
		
		return resultMap;
	}
	
	@Override
	public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception{
		shopDAO.updateGoods(map);
		
		map.put("IDX", map.get("GOODS_NUM"));

		shopDAO.deleteFileList(map);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				shopDAO.insertFile(tempMap);
			}else {
				shopDAO.updateFile(tempMap);
			}
		}
		
		shopDAO.insertGoodsThumbnail(map);
	}
	
	@Override
	public void deleteGoods(Map<String, Object> map) throws Exception {
		shopDAO.deleteGoods(map);
	}
	
	@Override
	public void insertGoodsLike(Map<String, Object> map) throws Exception{
		shopDAO.insertGoodsLike(map);
		informDAO.informInsert(map, "상대방이 내 상품을 좋아합니다.");
	}
	
	@Override
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{
		shopDAO.deleteGoodsLike(map);
	}

}
