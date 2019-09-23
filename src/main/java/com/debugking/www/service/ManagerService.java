package com.debugking.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.debugking.www.dao.ManagerRepository;

@Service
public class ManagerService {
	@Autowired
	ManagerRepository repo;

	public int move(List<String> listchecked, String postType) {
		Map hm = new HashMap();
		
		hm.put("postNo", listchecked);
		hm.put("postType", postType);

		int result = repo.move(hm);
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int deleted(List<String> listchecked) {
		Map hm = new HashMap();
		System.out.println("서비스 디릴트");
		hm.put("postNo", listchecked);

		int result = repo.deleted(hm);
		if(result==0){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int change(List<String> listchecked, String changeLevel) {
		
		return 0;
	}
}
