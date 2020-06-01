package nnS.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.admin.service.AdminGoodsServiceImpl;

@Controller
public class AdminGoodsController {
	
	@Resource(name="adminGoodsService")
	private AdminGoodsServiceImpl adminGoodsService;
	
	//상품 목록
	@RequestMapping(value="/admin/goodsList")
	public ModelAndView goodsList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("adgoodsList");
		List<Map<String,Object>> list = adminGoodsService.goodsList(commandMap.getMap());
		mv.addObject("goodsList",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		
		return mv;
	}
	
	//상품삭제하기
	@RequestMapping(value="/admin/adGoodsDelete")
	public ModelAndView goodsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/goodsList");
		adminGoodsService.deleteGoods(commandMap.getMap());
			 
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
				
		return mv;	
	}
	

}
