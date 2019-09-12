package com.debugking.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	
	@RequestMapping(value="/voice_new", method=RequestMethod.GET)
	public String voice_new(){
		return "board/voice_new";
	}
	
 	@RequestMapping(value="/voice_weekly", method=RequestMethod.GET)
	public String voice_weekly(){
		return "board/voice_weekly";
	}
	
	@RequestMapping(value="/voice_monthly", method=RequestMethod.GET)
	public String voice_monthly(){
		return "board/voice_monthly";
	}
	
	@RequestMapping(value="/voice_all", method=RequestMethod.GET)
	public String voice_all(){
		return "board/voice_all";
	}
	
	@RequestMapping(value="/video_new", method=RequestMethod.GET)
	public String video_new(){
		return "board/video_new";
	}
	
	@RequestMapping(value="/video_weekly", method=RequestMethod.GET)
	public String video_weekly(){
		return "board/video_weekly";
	}
	
	@RequestMapping(value="/video_monthly", method=RequestMethod.GET)
	public String video_monthly(){
		return "board/video_monthly";
	}
	
	@RequestMapping(value="/video_all", method=RequestMethod.GET)
	public String video_all(){
		return "board/video_all";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(){
		
		return "board/notice";
	}
	
	@RequestMapping(value="/streaming", method=RequestMethod.GET)
	public String streaming(){
		return"board/streaming";
	}
	
	@RequestMapping(value="/community", method=RequestMethod.GET)
	public String community(){
		return "board/community";
	}
	
	@RequestMapping(value="file_detail", method=RequestMethod.GET)
	public String file_detail(){
		return"board/file_detail";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(){
		return"board/write";
	}
	
	@RequestMapping(value="/post_modify", method=RequestMethod.GET)
	public String post_modify(){
		return "board/post_modify";
	}
}
