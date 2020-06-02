package second.myPage.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import second.common.common.CommandMap;
import second.member.service.MailService;
import second.member.service.MyPageService;

@Controller
public class MyPageController {
	
		@Resource(name="myPageService") 
	   private MyPageService myPageService;

	
	  @RequestMapping(value = "/myPage") // 비밀번호 인증 폼을 보여주는 메소드
	  public ModelAndView pwCheck(CommandMap commandMap) throws Exception { ModelAndView mv = new
	  	ModelAndView("pwCheckForm"); 
	  	return mv; 
	  }
	  
	  @RequestMapping(value = "/myPage/pwCheck") // 비밀번호 인증
	  public @ResponseBody String pwCheck2(CommandMap commandMap, HttpServletRequest request) throws Exception {	  
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		System.out.println(commandMap.getMap());
		String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
		System.out.println(pwCheck);
	  	return pwCheck; 
	  }
	 
	  @RequestMapping(value = "/myPage/accountDetail")
		public ModelAndView accountDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("accountDetail");
			HttpSession session = request.getSession();
			commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
			Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());	
			mv.addObject("map",map);
			return mv;
		}

	@RequestMapping(value = "/myPage/accountModifyForm")
	public ModelAndView accountModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("accountModifyForm");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());	
		mv.addObject("map",map);
		return mv;
	}
	
	@RequestMapping(value = "/myPage/accountModify")
	public ModelAndView accountModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		myPageService.updateAccountModify(commandMap.getMap());
		ModelAndView mv = new ModelAndView("accountDetail");
		Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());	
		mv.addObject("map",map);
		return mv;
	}

	@RequestMapping(value = "/myPage/pwModifyForm") //비밀번호 변경
	public ModelAndView pwModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("pwModifyForm");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());	
		mv.addObject("map",map);
		return mv; 
	}
	
	 @RequestMapping(value = "/myPage/pwchangeCheck") // 비밀번호 변경 시 현재 비밀번호 입력
	 public @ResponseBody String pwchangeCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
		System.out.println(pwCheck);
		return pwCheck;
	 }

	@RequestMapping(value = "/myPage/modifySuccess")
	public ModelAndView pwchange(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		myPageService.updatePwModify(commandMap.getMap());	
		ModelAndView mv = new ModelAndView("modifySuccess");
		return mv;
	}

	@RequestMapping(value = "/myPage/deleteAccount")
	public ModelAndView deleteAccountForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("deleteAccount");
		return mv;
	}
	
	@RequestMapping(value = "/myPage/deletePw")
	public @ResponseBody String deletePw(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		System.out.println(commandMap.getMap());
		String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
		System.out.println(pwCheck);
	  	return pwCheck; 
	}
	
	@RequestMapping(value = "/myPage/deleteAccountCheck")
	public ModelAndView deleteAccount(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		myPageService.deleteAccount(commandMap.getMap());
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/main");
		return mv;
	}

}
