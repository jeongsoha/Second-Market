package second.kakaopay.service;


public interface KakaoPayService {

	Object kakaoPayReady(String orderNum, String goodsTcost, String itemName, String memID) throws Exception;
	Object kakaoPayInfo(String pg_token) throws Exception;
	
}
