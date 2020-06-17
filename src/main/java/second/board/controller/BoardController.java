package second.board.controller;

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

import second.board.service.BoardService;
import second.common.common.CommandMap;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("BoardController_예외사항_발생!");
        return "/error/exception";
    }
	
	@Resource(name = "boardService")
	private BoardService boardService;

	// 자유게시판 리스트
	@RequestMapping(value = "/community/boardList")
	public ModelAndView boardList() throws Exception {
		ModelAndView mv = new ModelAndView("boardList");

		return mv;
	}

	// 자유게시판 목록
	@RequestMapping(value = "/community/boardListPaging")
	public ModelAndView boardListPaging(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = boardService.selectBoardList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}

	// 자유게시판 상세보기
	@RequestMapping(value = "/community/boardDetail")
	public ModelAndView boardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetail");

		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	// 자유게시판 작성폼
	@RequestMapping(value = "/community/boardWriteForm")
	public ModelAndView boardWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardWriteForm");

		return mv;
	}

	// 자유게시판 작성

	@RequestMapping(value = "/community/boardWrite")
	public ModelAndView boardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/boardDetail");
		boardService.insertBoardWrite(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));

		return mv;
	}

//	@RequestMapping(value="/community/boardWrite")
//	public ModelAndView boardWrite(CommandMap commandMap) throws Exception{
//		ModelAndView mv = new ModelAndView("redirect:/community/boardDetail");
//		
//		return mv;
//	}

	// 자유게시판 수정폼

	@RequestMapping(value = "/community/boardModifyForm")
	public ModelAndView boardModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardModifyForm");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	// 자유게시판 수정
	@RequestMapping(value = "/community/boardModify")
	public ModelAndView boardModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/boardDetail");
		boardService.updateBoardModify(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));

		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/community/boardDelete")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/boardList");
		boardService.deleteBoard(commandMap.getMap());

		return mv;
	}

}
