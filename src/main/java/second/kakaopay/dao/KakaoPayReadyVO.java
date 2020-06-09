package second.kakaopay.dao;

import java.util.Date;

public class KakaoPayReadyVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    private String orderNum, goodsTcost, itemName, memID;
    
    
    
    public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getGoodsTcost() {
		return goodsTcost;
	}
	public void setGoodsTcost(String goodsTcost) {
		this.goodsTcost = goodsTcost;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public static KakaoPayReadyVO getKakaoPayReadyVO() {
		return kakaoPayReadyVO;
	}
	public static void setKakaoPayReadyVO(KakaoPayReadyVO kakaoPayReadyVO) {
		KakaoPayReadyVO.kakaoPayReadyVO = kakaoPayReadyVO;
	}
	private static KakaoPayReadyVO kakaoPayReadyVO = new KakaoPayReadyVO();
    private KakaoPayReadyVO() {
        System.out.println("Singleton Instance Created..");
    }
    public static KakaoPayReadyVO getInstance() {
        return kakaoPayReadyVO;
    }

	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
    
    
}
 