package wpk.carIO.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import wpk.carIO.service.CarIOService;
import wpk.carIO.service.CarIOVO;

@RestController
public class CarIOController {
	public final String MESSAGE_SUCCESS = "SUCCESS";
	public final String MESSAGE_FAIL = "FAIL";
	@Autowired
	CarIOService carIOService;

	@RequestMapping({"/in"})
	public ModelAndView carIn(@ModelAttribute CarIOVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		try {
			this.carIOService.insertCarIn(vo);
			String perm = this.carIOService.selectPerm(vo);
			mv.addObject("perm", perm);
			mv.addObject("message", "SUCCESS");
		} catch (Exception arg3) {
			arg3.printStackTrace();
			mv.addObject("message", "FAIL");
		}

		return mv;
	}

	@RequestMapping({"/out"})
	public ModelAndView carOut(@ModelAttribute CarIOVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		try {
			this.carIOService.updateCarOut(vo);
			mv.addObject("message", "SUCCESS");
		} catch (Exception arg3) {
			arg3.printStackTrace();
			mv.addObject("message", "FAIL");
		}

		return mv;
	}

	@RequestMapping({"/car"})
	public ModelAndView getCars(@ModelAttribute CarIOVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, String>> ret = this.carIOService.selectCarInfo(vo);
		mv.addObject("carList", ret);
		return mv;
	}

	@RequestMapping({"/"})
	public ModelAndView init() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("carIo");
		return mv;
	}
}