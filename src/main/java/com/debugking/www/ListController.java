package com.debugking.www;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.debugking.www.dto.Posts;




@Controller
public class ListController {
	
	@Autowired
	
	@RequestMapping(value="/video_new", method=RequestMethod.GET)
	public String video_new(){
		return "userBoard/video_new";
	}
	
	@RequestMapping(value="/video_weekly", method=RequestMethod.GET)
	public String video_weekly(){
		return "userBoard/video_weekly";
	}
	
	@RequestMapping(value="/video_monthly", method=RequestMethod.GET)
	public String video_monthly(){
		return "userBoard/video_monthly";
	}
	
	@RequestMapping(value="/video_all", method=RequestMethod.GET)
	public String video_all(){
		return "userBoard/video_all";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(){
		
		return "userBoard/notice";
	}
	
	@RequestMapping(value="/streaming", method=RequestMethod.GET)
	public String streaming(){
		return"userBoard/streaming";
	}
	
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(){
		return "userBoard/write";
	}

	@RequestMapping(value="/streaming_write", method=RequestMethod.GET)
	public String streamingPage(){
		return "userBoard/streaming_write";
	}
	
	@RequestMapping(value="/streaming_detail", method=RequestMethod.GET)
	public String streaming_detail(){
		return "userBoard/streaming_detail";
	}

}
