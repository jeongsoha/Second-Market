package sscond.reply.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import second.reply.dto.ReplyVO;
import sscond.reply.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	
	//댓글입력
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam int bno,
							@RequestParam(defaultValue="1")
	int curPage, ModelAndView mav, HttpSession session) {
		
		//페이징 처리
		int count = replyService.count(bno); //댓글 수
		ReplyPager = replyPager = new ReplyPager(count, couPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		List<ReplyVO> list = replyService.list(bno, start, end, session);
		//뷰 이름 지정
		mav.setView("board/replyList");
		//뷰에 전달한 데이터 지정
mav.addObject("list", list)
mav.addObject("replyPager",replyPager);
//replyList.jsp로 포워딩
return mav;
	}
	
	

}
