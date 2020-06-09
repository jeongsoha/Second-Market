package second.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import second.common.service.InformService;
import second.common.common.CommandMap;


@Controller
public class MainController {
   
   @Resource(name="informService")
   InformService informService;

   @RequestMapping(value="/main")
   public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception{
   	ModelAndView mv = new ModelAndView("main");
   	
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
      return mv;
    }
   
   @RequestMapping(value="/inform", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView inform(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("jsonView");
      request.getRequestURI();
      HttpSession session = request.getSession();
   
      if(session.getAttribute("session_MEM_ID")!= null) {
         commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
         List<Map<String,Object>> list = informService.informList(commandMap.getMap());
         
         mv.addObject("list",list);
         
      }
         
      return mv;
   }
   
   @RequestMapping(value = "/inform/confirm", method =RequestMethod.GET)
   @ResponseBody
   public ModelAndView reportDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("jsonView");
      informService.informCofirm(commandMap.getMap());
      return mv;
      
   }
}
      
      