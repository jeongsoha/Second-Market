package nnS.admin.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import nnS.admin.dao.AdminMemberDAO;

import nnS.common.common.CommandMap;
import nnS.notice.service.NoticeService;
import nnS.admin.service.AdminMemberService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memberList(CommandMap commandMap) throws Exception {
		List<Map<String,Object>> list = adminMemberService.memberList(commandMap.getMap());
		ModelAndView mv = new ModelAndView("admemberList");
		mv.addObject("list",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;	
	}
	
	@RequestMapping("/admin/memberModify")
  	public ModelAndView memberModify(CommandMap commandMap) throws Exception{		  		 		
		ModelAndView mv = new ModelAndView("admemberModify");	
		Map<String, Object> map = adminMemberService.selectMember(commandMap.getMap());
		System.out.println(map);
		mv.addObject("map", map);
		return mv;
  	}
	
	@RequestMapping("/admin/memberModifyPro")
  	public ModelAndView memberModifyPro(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/memberList");
		adminMemberService.updateMemberInfo(commandMap.getMap());
		return mv;
  	}
	
	@RequestMapping("/admin/memberDelete")
  	public ModelAndView memberDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/memberList");
		adminMemberService.memberDelete(commandMap.getMap());
		return mv;
  	}
	
	
	@RequestMapping(value = "/admin/reportProList")
	public ModelAndView reportList(@RequestParam(value = "search", defaultValue="") String search, HttpServletRequest request,CommandMap commandMap) throws Exception {
		List<Map<String,Object>> list = adminMemberService.reportList(commandMap.getMap());
		ModelAndView mv = new ModelAndView("reportPro");
		request.setAttribute("search", search);
		mv.addObject("list",list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		request.setAttribute("search", search);
		return mv;	
	}
	
	@RequestMapping(value = "/admin/reportModify")
	public ModelAndView reportModify(@RequestParam(value = "search", defaultValue="") String search, HttpServletRequest request,CommandMap commandMap) throws Exception {
		List<Map<String,Object>> list = adminMemberService.reportModifyList(commandMap.getMap());
		ModelAndView mv = new ModelAndView("adreportModify");
		request.setAttribute("search", search);
		mv.addObject("list",list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;	
	}
	
	@RequestMapping(value = "/admin/reportModifyPro")
	public ModelAndView reportModifyPro(@RequestParam(value = "search", defaultValue="") String search, HttpServletRequest request,CommandMap commandMap) throws Exception {
		System.out.println(commandMap.getMap().get("REPORT_NUM"));
		System.out.println(commandMap.getMap().get("REPORT_STATUS"));
		System.out.println(commandMap.getMap().get("title2"));
		ModelAndView mv = new ModelAndView("redirect:/admin/reportProList");
		adminMemberService.updateReport(commandMap.getMap());
		return mv;
	}

	@RequestMapping("/admin/adReportDelete")
  	public ModelAndView reportDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/reportProList");
		adminMemberService.deleteReport(commandMap.getMap());
		mv.addObject("REPORT_NUM", commandMap.get("REPORT_NUM"));
		return mv;
  	}
}
