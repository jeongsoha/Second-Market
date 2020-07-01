package second.order.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.order.service.OrderService;

@Controller
public class OrderController {
	Logger log = Logger.getLogger(this.getClass());
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public String exceptionHandler() {
        log.debug("QnaController_예외사항_발생!");
        return "/error/exception";
    }
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/shop/order/orderWriteForm")
	public ModelAndView orderWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("orderWriteForm");
		
		Map<String,Object> map = orderService.orderWriteForm(commandMap.getMap());

		mv.addObject("orderG", map.get("orderG"));
		mv.addObject("orderM", map.get("orderM"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderWrite", method = RequestMethod.POST)
	public ModelAndView orderWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderWriteResult");
		orderService.insertOrder(commandMap.getMap(), request);
		Map<String,Object> map = orderService.orderDetail(commandMap.getMap());
		mv.addObject("order", map.get("order"));
		mv.addObject("orderG", map.get("orderG"));
		mv.addObject("orderM", map.get("orderM"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderDetail")
	public ModelAndView orderDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderDetail");

		Map<String,Object> map = orderService.orderDetail(commandMap.getMap());
		mv.addObject("order", map.get("order"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderModifyForm")
	public ModelAndView orderModifyForm() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteForm");

		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderModify")
	public ModelAndView orderModify() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteResult");

		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderDelete")
	public ModelAndView orderDelete() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/allgoodsList");

		return mv;
	}

}
