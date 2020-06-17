package second.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.shop.service.ShopService;

@Controller
public class ShopController{

	Logger log = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("ShopController_예외사항_발생!");
        return "/error/exception";
    }
	
	@Resource(name="shopService")
	private ShopService shopService;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "all");
		mv.addObject("sortType", "all");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/selectGoodsList")
	public ModelAndView selectGoodsList(CommandMap commandMap, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("검색어: " + keyword);
		System.out.println("검색타입: " + searchType);
    	List<Map<String,Object>> list = shopService.selectGoodsList(commandMap.getMap(), keyword, searchType, sortType);
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
    	System.out.println("@@@@@"+sortType);
    	return mv;
	}
	
	@RequestMapping(value="/shop/allGoodsList")
	public ModelAndView shopAllGoodsList(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "all");
		mv.addObject("sortType", "all");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/likeGoodsList")
	public ModelAndView shopLikeGoodsList(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "like");
		mv.addObject("sortType", "like");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/priceGoodsList")
	public ModelAndView shoppriceGoodsList(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "price");
		mv.addObject("sortType", "price");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	
	@RequestMapping(value="/shop/viewGoodsList")
	public ModelAndView shopNewGoodsList(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "view");
		mv.addObject("sortType", "view");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsWriteForm")
	public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteForm");
		mv.addObject("request_type", "write");
		return mv;
	}

	@RequestMapping(value="/shop/goodsWrite", method = RequestMethod.POST)
	public ModelAndView goodsWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteResult");

		shopService.insertGoods(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModifyForm")
	public ModelAndView goodsModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteForm");

		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("request_type", "modify");
		/* mv.addObject("list",map.get("list")); */
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModify")
	public ModelAndView goodsModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteResult");

		shopService.updateGoods(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDelete")
	public ModelAndView goodsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop");
		
		shopService.deleteGoods(commandMap.getMap());
		
		return mv;
	}
	
	// 상품 상세보기
	@RequestMapping(value="/shop/goodsDetail")
	public ModelAndView goodsDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsDetail");
		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		
		mv.addObject("map", map.get("map"));
		mv.addObject("goodsLikeMap", map.get("goodsLikeMap"));
		mv.addObject("memberMap", map.get("memberMap"));
		mv.addObject("list", map.get("list"));
		
		mv.addObject("reportMap", map.get("reportMap"));//(유진추가) 신고당한 게시글을 구분한 데이터를 리턴 
		/* mv.addObject("list",map.get("list")); */
		System.out.println(mv+"======================");
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsLike", method = RequestMethod.POST)
	public ModelAndView goodsLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		mv.addObject("GOODS_NUM", commandMap.getMap().get("LIKE_GOODS_NUM"));
		mv.addObject("LIKE_MEM_ID", commandMap.getMap().get("LIKE_MEM_ID"));
		shopService.insertGoodsLike(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsUnlike")
	public ModelAndView goodsUnlike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		mv.addObject("GOODS_NUM", commandMap.getMap().get("LIKE_GOODS_NUM"));
		mv.addObject("LIKE_MEM_ID", commandMap.getMap().get("LIKE_MEM_ID"));
		shopService.deleteGoodsLike(commandMap.getMap());

		return mv;
	}
}
