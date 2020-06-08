package second.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.board.service.BoardService;
import second.common.common.CommandMap;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="community/boardList")
	private BoardService boardService;
	
	@RequestMapping(value="/community/boardList")
    public ModelAndView BoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("community/boardList");
    
    	return mv;
    }
	
	@RequestMapping(value="/community/selectBoardList")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	List<Map<String,Object>> list = boardService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
    	return mv;
    }
	
	@RequestMapping(value="/board/BoardWrite")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/board/insertBoard")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/BoardList");
		
		boardService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/board/BoardDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/BoardUpdate")
	public ModelAndView BoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardUpdate");
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/updateBoard")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail");
		
		boardService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/board/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/BoardList");
		
		boardService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
}
