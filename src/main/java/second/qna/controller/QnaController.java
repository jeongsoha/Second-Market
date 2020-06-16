package second.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.qna.service.QnaService;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("QnaController_예외사항_발생!");
        return "/error/exception";
    }
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@RequestMapping(value = {"/community/qnaListPaging","/myPage/qnaListPaging"})
	public ModelAndView qnaListPaging(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		if(request.getServletPath().equals("/myPage/qnaListPaging")){
			HttpSession session = request.getSession();
			commandMap.put("session_MEM_ID", session.getAttribute("session_MEM_ID"));
			}
		List<Map<String,Object>> list = qnaService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		
		return mv;
	}

	
	@RequestMapping(value =  "/myPage/qnaList")
	public ModelAndView qnaList() throws Exception {
		ModelAndView mv = new ModelAndView("myqnaList");
		return mv;
		}
	@RequestMapping(value =  "/community/qnaList")
	public ModelAndView qnaMyList() throws Exception {
		ModelAndView mv = new ModelAndView("qnaList");
		return mv;
		}
		
	
	  @RequestMapping(value = "/community/qnaDetail") 
	  public ModelAndView qnaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView("qnaDetail");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("session_MEM_ID", session.getAttribute("session_MEM_ID"));
		  
		  Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		  List<Map<String,Object>>list=qnaService.selectQnaAnswer(commandMap.getMap());
		  
		  mv.addObject("asList",list);//qnaAnswer
		  mv.addObject("map", map.get("map"));//qna글
		  mv.addObject("list",map.get("list"));//파일
		  
		  return mv; 
	  }
	  
	  @RequestMapping(value = "/myPage/qnaDetail") 
	  public ModelAndView qnaMyDetail(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView("myqnaDetail");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("session_MEM_ID", session.getAttribute("session_MEM_ID"));
		  
		  Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		  List<Map<String,Object>>list=qnaService.selectQnaAnswer(commandMap.getMap());
		  
		  mv.addObject("asList",list);//qnaAnswer
		  mv.addObject("map", map.get("map"));//qna글
		  mv.addObject("list",map.get("list"));//파일
		  
		  return mv; 
	  }
	 
	
	@RequestMapping(value = "/community/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("qnaWriteForm");
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		qnaService.insertQnaBoard(commandMap.getMap(),request);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaModifyForm")
	public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("qnaModifyForm");
		Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaModify")
	public ModelAndView qnaModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		qnaService.updateQna(commandMap.getMap(),request);
		
		mv.addObject("QNA_NUM",commandMap.get("QNA_NUM"));
		
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaList");
		qnaService.deleteQna(commandMap.getMap());
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDetail/answerWrite")
	public ModelAndView qnaAnswerWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {//관리자만 가능하게 어떻게?
		
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("idq", commandMap.get("idq")); //(유진추가) qna.jsp 에서 받아온 id 값을 서비스에 전달
		qnaService.insertQnaAnswer(commandMap.getMap());
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDetail/answerDelete")
	public ModelAndView qnaAnswerDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		mv.addObject("QNA_NUM", commandMap.getMap().get("Q_QNA_NUM"));
		
		qnaService.deleteQna(commandMap.getMap());
		
		return mv;		
	}
	
}
