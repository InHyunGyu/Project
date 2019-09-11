package com.debugking.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	
	@RequestMapping(value="/voice_new", method=RequestMethod.GET)
	public String voice_new(){
		return "list/voice_new";
	}
	
 	@RequestMapping(value="/voice_weekly", method=RequestMethod.GET)
	public String voice_weekly(){
		return "list/voice_weekly";
	}
	
	@RequestMapping(value="/voice_monthly", method=RequestMethod.GET)
	public String voice_monthly(){
		return "list/voice_monthly";
	}
	
	@RequestMapping(value="/voice_all", method=RequestMethod.GET)
	public String voice_all(){
		return "list/voice_all";
	}
	
	@RequestMapping(value="/video_new", method=RequestMethod.GET)
	public String video_new(){
		return "list/video_new";
	}
	
	@RequestMapping(value="/video_weekly", method=RequestMethod.GET)
	public String video_weekly(){
		return "list/video_weekly";
	}
	
	@RequestMapping(value="/video_monthly", method=RequestMethod.GET)
	public String video_monthly(){
		return "list/video_monthly";
	}
	
	@RequestMapping(value="/video_all", method=RequestMethod.GET)
	public String video_all(){
		return "list/video_all";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(){
		
		return "notice";
	}
	
	@RequestMapping(value="/streaming", method=RequestMethod.GET)
	public String streaming(){
		return"streaming";
	}
	
	@RequestMapping(value="/community", method=RequestMethod.GET)
	public String community(){
		return "community";
	}
	
	@RequestMapping(value="file_detail", method=RequestMethod.GET)
	public String file_detail(){
		return"file_detail";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(){
		return"write";
	}
	
	@RequestMapping(value="/post_modify", method=RequestMethod.GET)
	public String post_modify(){
		return "post_modify";
	}
}
