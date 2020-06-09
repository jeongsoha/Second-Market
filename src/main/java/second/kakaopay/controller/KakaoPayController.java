package second.kakaopay.controller;

import second.common.common.CommandMap;
import second.kakaopay.service.KakaoPay;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class KakaoPayController {
    
    @Autowired
    private KakaoPay kakaopay;
    
    
    @RequestMapping(value="/kakaoPay", method=RequestMethod.GET)
    public String kakaoPayGet(@RequestParam("orderNum") String orderNum, @RequestParam("goodsTcost") String goodsTcost, @RequestParam("itemName") String itemName, @RequestParam("memID") String memID) {
    	//ModelAndView mv = new ModelAndView("/kakaopay/kakaopay");
    	System.out.println(orderNum);
    	System.out.println(goodsTcost);
    	System.out.println(itemName);
    	System.out.println(memID);

        return "redirect:" + kakaopay.kakaoPayReady(orderNum, goodsTcost, itemName, memID);
    	
    	//return mv;
    }
    
    @RequestMapping(value="/kakaoPay", method=RequestMethod.POST)
    public String kakaoPay() {
    	System.out.println("pay-----------------");
        //return "redirect:" + kakaopay.kakaoPayReady();
    	return "";
    }
    
    @RequestMapping(value="/kakaoPaySuccess", method=RequestMethod.GET)
    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	ModelAndView mv = new ModelAndView("/kakaopay/kakaopaySuccess");
    	System.out.println("1. Success");
    	//model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    	mv.addObject("info", kakaopay.kakaoPayInfo(pg_token));
    	return mv;   
    }
    
    @RequestMapping(value="/kakaoPayCancel", method=RequestMethod.GET)
    public ModelAndView kakaoPayCancel() {
    	ModelAndView mv = new ModelAndView("/kakaopay/kakaoPayCancel");
    	return mv;   
    }
    
    @RequestMapping(value="/kakaoPaySuccessFail", method=RequestMethod.GET)
    public ModelAndView kakaoPaySuccessFail() {
    	ModelAndView mv = new ModelAndView("/kakaopay/kakaoPaySuccessFail");
    	return mv;   
    }
    
}