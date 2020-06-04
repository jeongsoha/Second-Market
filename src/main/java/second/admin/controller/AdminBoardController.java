package second.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.admin.service.AdminBoardService;

@Controller
public class AdminBoardController {
	
	@Resource(name="adminBoardService")
	private AdminBoardService adminBoardService;
	
	//자유게시판
	@RequestMapping(value="/admin/boardList")
	public ModelAndView boardList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("adboardList");
		List<Map<String,Object>> list = adminBoardService.boardList(commandMap.getMap());
		mv.addObject("boardList",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}
	
	//자유게시글 삭제하기
	@RequestMapping(value="/admin/adBoardDelete")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/boardList");
		adminBoardService.deleteBoard(commandMap.getMap());
				 
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
					
		return mv;	
	}
	
	//공지사항
	@RequestMapping(value="/admin/noticeList")
	public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("adnoticeList");
		List<Map<String,Object>> list = adminBoardService.noticeList(commandMap.getMap());
		mv.addObject("noticeList",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}	
		return mv;
	}
	
	//공지사항 삭제하기
	@RequestMapping(value="/admin/adNoticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		adminBoardService.deleteNotice(commandMap.getMap());
				 
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));
					
		return mv;	
	}	
	
	//qna
	@RequestMapping(value="/admin/qnaList")
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("adqnaList");
		List<Map<String,Object>> list = adminBoardService.qnaList(commandMap.getMap());
		mv.addObject("qnaList",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}	
		return mv;
	}
	
	//qna 삭제하기
	@RequestMapping(value="/admin/adQnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList");
		adminBoardService.deleteQna(commandMap.getMap());
				 
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
					
		return mv;	
	}
	
	@RequestMapping(value="/admin/qnaPro")
	public ModelAndView qnaPro(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/qnaPro");
		Map<String, Object> map = adminBoardService.selectReport(commandMap.getMap());
		System.out.println(map);
		mv.addObject("map", map);
		return mv;	
	}
	
	@RequestMapping(value="/admin/qnaRePro")
	public void qnaRePro(CommandMap commandMap) throws Exception{
		
		adminBoardService.qnaRePro(commandMap.getMap());
		
	}
}
