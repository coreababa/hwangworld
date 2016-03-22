package wood.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Strudy {

	@RequestMapping("/jm1.do")
	public ModelAndView jm1(ModelAndView mView){
		mView.setViewName("/m/jm1");
		return mView;
	}
}
