package scond.reply.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import scond.reply.service.ReplyPager;
import scond.reply.service.ReplyService;
import second.reply.dto.ReplyVO;

@RestController
@RequestMapping("/community/replyList")
public class ReplyController {
	
	@Inject
	ReplyService replyService;

	// 댓글 입력
	@RequestMapping("/community/replyboardWriteForm")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		vo.setReplyer(userId);
		replyService.create(vo);
	}

	// 댓글목록
	@RequestMapping("/community/replyList")
	public ModelAndView list(@RequestParam int bno, @RequestParam(defaultValue = "1") int curPage, ModelAndView mav,
			HttpSession session) {

		// 페이징 처리
		int count = replyService.count(bno); // 댓글 수
		ReplyPager replyPager = new ReplyPager(count, curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		List<ReplyVO> list = replyService.list(bno, start, end, session);
		// 뷰 이름 지정
		mav.setViewName("replyboardList");
		// 뷰에 전달한 데이터 지정
		mav.addObject("list", list);
		mav.addObject("replyPager", replyPager);
//replyList.jsp로 포워딩
		return mav;
	}

}
