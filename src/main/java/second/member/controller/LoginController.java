package second.member.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.MailHandler;

import second.common.common.CommandMap;
import second.member.service.LoginService;
import second.member.service.MailService;

import second.member.service.LoginService;
import second.member.service.MailService;
import second.common.common.CommandMap;


@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mailService")
	private MailService mailService;

	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Inject
	private JavaMailSender mailSender;

	// @Resource(name = "mailSender")
	// private JavaMailSender mailSender;

	@RequestMapping(value = "/loginForm") // 로그인 폼
	public ModelAndView loginForm() throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST) // 로그인
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/login");
		String message = "";
		String url = "";

		HttpSession session = request.getSession();

		
		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		//Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk==null) { // 아이디가 있는지 없는지를 확인
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
				session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID"));
				session.setAttribute("session_MEM_INFO", chk);
			} else { // 비밀번호가 일치하지 않을 때
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		System.out.println(chk);
		mv.addObject("message",message);
		mv.addObject("url",url);
		 
		return mv;
	}

	@RequestMapping(value = "/logout") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/shop/allGoodsList");
		return mv;
	}

	@RequestMapping(value = "/findId") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findAccount");
		int ran = new Random().nextInt(900000) + 100000;
		
		mv.addObject("random",ran);
		
		return mv;
	}

	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST, produces = "application/text; charset=utf8")

	public @ResponseBody String findIdResult(CommandMap commandMap) throws Exception {
		String id = String.valueOf(loginService.findId(commandMap.getMap()));
		
		if(id.equals("1")) {
			String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
			System.out.println(findId);
			return findId;
			
		}else {
			return id;
		}
	}
	
	

	@RequestMapping(value = "/findPw") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findAccount");
		int ran = new Random().nextInt(900000) + 100000;
		
		mv.addObject("random",ran);
		
		return mv;
	}
	
	@RequestMapping(value = "/findPwResult", method=RequestMethod.GET) //비밀번호 찾기
	@ResponseBody
	public boolean findPwEmail(CommandMap commandMap,@RequestParam String MEM_ID, @RequestParam String MEM_EMAIL, @RequestParam int random, HttpServletRequest req) throws Exception {
		
		
		String emailCheck = String.valueOf(loginService.findPwWithEmail(commandMap.getMap()));
		System.out.println(emailCheck);
		if(emailCheck.equals("1")) {
			int ran = new Random().nextInt(900000) + 100000;
			   HttpSession session = req.getSession(true);
			   String authCode = String.valueOf(ran);
			   session.setAttribute("authCode", authCode);
			   session.setAttribute("random", random);
			   String subject = "second 비밀번호 변경 코드 안내 입니다.";
			   StringBuilder sb = new StringBuilder();
			   sb.append("귀하의 임시 비밀번호는 " + authCode + "입니다.");
			   
			   commandMap.put("MEM_ID", MEM_ID);
			   commandMap.put("MEM_EMAIL", MEM_EMAIL);
			   commandMap.put("authCode", authCode);
			   loginService.updateTempPw(commandMap.getMap());
			   return mailService.send(subject, sb.toString(),"cwjjgl183@gmail.com", MEM_EMAIL, null);
		}else {
			  return false;
		}
	}
	

}
