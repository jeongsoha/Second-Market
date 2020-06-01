package second.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;


@Controller
public class AdminMainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/admin")
    public ModelAndView main(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("admin");
    	return mv; 
    }
}

