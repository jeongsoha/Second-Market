package second.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.notice.service.NoticeService;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("NoticeController_예외사항_발생!");
        return "/error/exception";
    }
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	//공지사항	
	// 공지사항 리스트
	@RequestMapping(value = "/community/noticeList")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("noticeList");
		
		return mv;		
	}
	
	//목록
	@RequestMapping(value="/community/noticeListPaging")
	public ModelAndView noticeListPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		
		List<Map<String,Object>> list=noticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}   

	// 공지사항 상세보기
	@RequestMapping(value = "/community/noticeDetail")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("noticeDetail");
		
		Map<String, Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;		
	}
	
	// 공지사항 작성폼
	@RequestMapping(value = "/community/noticeWriteForm")
	public ModelAndView noticeWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("noticeWriteForm");
		 
		return mv;		
	}
	
	// 공지사항 작성
	@RequestMapping(value = "/community/noticeWrite")
	public ModelAndView noticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		 
		ModelAndView mv = new ModelAndView("redirect:/community/noticeList");
		noticeService.insertNoticeWrite(commandMap.getMap(), request);
		return mv;		
	}
	
	// 공지사항 수정폼
	@RequestMapping(value = "/community/noticeModifyForm")
	public ModelAndView noticeModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("noticeModifyForm");
		Map<String, Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		 
		return mv;		
	}
	
	// 공지사항 수정
	@RequestMapping(value = "/community/noticeModify")
	public ModelAndView noticeModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/noticeDetail");
		 
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));
		 
		noticeService.updateNoticeModify(commandMap.getMap(), request);
		
		return mv;		
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "/community/noticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/noticeList");
		noticeService.deleteNotice(commandMap.getMap());
		
		return mv;		
	}

}
