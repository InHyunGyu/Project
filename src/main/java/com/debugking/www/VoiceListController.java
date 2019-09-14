package com.debugking.www;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.VoiceListRepository;
import com.debugking.www.dto.MemberInfo;

@Controller
public class VoiceListController {
	@Autowired
	VoiceListRepository repo;
	
	@RequestMapping(value="/voice_new", method=RequestMethod.GET)
	@ResponseBody
	public List<MemberInfo> voice_new(){
		List<MemberInfo> result = repo.GetVoiceList();
		return result;
	}
	
 	@RequestMapping(value="/voice_weekly", method=RequestMethod.GET)
	public String voice_weekly(){
		return "userBoard/voice_weekly";
	}
	
	@RequestMapping(value="/voice_monthly", method=RequestMethod.GET)
	public String voice_monthly(){
		return "userBoard/voice_monthly";
	}
	
	@RequestMapping(value="/voice_all", method=RequestMethod.GET)
	public String voice_all(){
		return "userBoard/voice_all";
	}
}
