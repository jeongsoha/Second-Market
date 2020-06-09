package second.kakaopay.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import second.kakaopay.dao.AmountVO;
import second.kakaopay.dao.KakaoPayApprovalVO;
import second.kakaopay.dao.KakaoPayReadyVO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Service("KakaoPayService")
public class KakaoPay implements KakaoPayService{
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    KakaoPayReadyVO krvo = KakaoPayReadyVO.getInstance();
    KakaoPayApprovalVO kavo = KakaoPayApprovalVO.getInstance();
    
    public String kakaoPayReady(String orderNum, String goodsTcost, String itemName, String memID){
    	System.out.println("1. 진입");
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "02e2cf4301095e36d33c0628f66b2217");
        //headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        System.out.println(headers);
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderNum);
        params.add("partner_user_id", memID);
        params.add("item_name", itemName);
        params.add("quantity", "1");
        params.add("total_amount", goodsTcost);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8000/second/kakaopay/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8000/second/kakaopay/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8000/second/kakaopay/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         	
         //System.out.println(params);
         //System.out.println(body);
        try {
        	String str = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, String.class);
        	//System.out.println(str);
        	
        	JSONParser parser = new JSONParser();
        	Object obj = parser.parse(str);
        	JSONObject jsonObj = (JSONObject) obj;
        	String url = String.valueOf(jsonObj.get("next_redirect_pc_url"));
        	//System.out.println(url);
        	
        	krvo.setTid(String.valueOf(jsonObj.get("tid")));
        	System.out.println(krvo.getTid());
        	
        	//kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            krvo.setOrderNum(orderNum);
            krvo.setMemID(memID);
            krvo.setItemName(itemName);
            krvo.setGoodsTcost(goodsTcost);
            
            return url; //kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return "/kakaoPay";
        
    }
    
    public Object kakaoPayInfo(String pg_token) {
    	 System.out.println("2. 진입");
    	 System.out.println(krvo.getTid());
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "02e2cf4301095e36d33c0628f66b2217");
        //headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", krvo.getTid());
        params.add("partner_order_id", krvo.getOrderNum());
        params.add("partner_user_id", krvo.getMemID());
        params.add("pg_token", pg_token);
        params.add("total_amount", krvo.getGoodsTcost());
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //System.out.println(body);
        try {
        	//System.out.println(restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class));
            String resultStr = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class);
            
            JSONParser parser = new JSONParser();
        	Object obj = parser.parse(resultStr);
        	JSONObject jsonObj = (JSONObject) obj;
            
            return jsonObj;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return null;
    }
    
}