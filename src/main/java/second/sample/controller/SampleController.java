package second.sample.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.sample.service.SampleService;

@Controller
public class SampleController {
	
	Logger log = Logger.getLogger(this.getClass());
		
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("SampleController_예외사항_발생!");
        return "/error/exception";
    }
	
	 
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	@RequestMapping(value="/sample/openBoardList")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
		 
    	ModelAndView mv = new ModelAndView("sample1");
    
    	return mv;
    }
	
	@RequestMapping(value="/sample/selectBoardList")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
     
    	List<Map<String,Object>> list = sampleService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
       
    	return mv;
    }
	
	@RequestMapping(value="/sample/openBoardWrite")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/sample/insertBoard")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList");
		
		sampleService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/sample/openBoardDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/boardDetail");
		
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/sample/openBoardUpdate")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/boardUpdate");
		
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/sample/updateBoard")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail");
		
		sampleService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/sample/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList");
		
		sampleService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
}
