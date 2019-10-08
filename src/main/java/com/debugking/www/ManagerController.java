package com.debugking.www;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.ManagerService;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.FileService;
import com.debugking.www.util.PageNavigator;

@Controller
public class ManagerController {
	@Autowired
	ManagerRepository repo;
	@Autowired
	ManagerService service;
	@Autowired
	PostsService servicePost;
	
	@Autowired
	ManagerRepository Managerrepo;
	
	final String uploadPath="/uploadfile";
	//게시글
	@RequestMapping(value="/managerPage", method=RequestMethod.GET)
	public String manager(
			@RequestParam(value="searchItem" , defaultValue="voice") String searchItem,
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		
		int countPerPage=10;
		int totalRecordCount = repo.getPostCount(searchItem);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		List<Posts> list = repo.selectPostAll(searchItem, navi.getStartRecord(), countPerPage);
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "manager/managerPage";
	}
	//등급
	@RequestMapping(value="/memberRating", method=RequestMethod.GET)
	@ResponseBody
	public List<MemberInfo> memberRating(
			@RequestParam(value="memberLevel" , defaultValue="beginner") String memberLevel,
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		int countPerPage=10;
		int totalRecordCount = repo.getMemberInfoCount(memberLevel);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		List<MemberInfo> ratingList = repo.selectMemberInfoAll(memberLevel, navi.getStartRecord(), countPerPage);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
		return ratingList;
	}
	
	
	//게시글 이동
	@RequestMapping(value="/move", method=RequestMethod.POST)
	@ResponseBody
	public int move(
			@RequestParam(value="listchecked") List<String> listchecked,
			@RequestParam(value="postType") String postType){
		System.out.println("1"+listchecked);
		int result = service.move(listchecked,postType);
		return result;
	}
	
	
	//게시글 삭제
	@RequestMapping(value="/deleted", method=RequestMethod.POST)
	@ResponseBody
	public int deleted(
			@RequestParam(value="listchecked") List<String> listchecked,Model model){
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
		int result = service.deleted(listchecked);
		return result;
	}
	//신고 글 삭제
	@RequestMapping(value="/rep_delete", method=RequestMethod.POST)
	@ResponseBody
	public int rep_delete(
			@RequestParam(value="listchecked") List<String> listchecked,Model model
			){
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
        
		int result = service.deleted(listchecked);
		return result;
	}
	
	//등업하기 등급 변경하기
	@RequestMapping(value="/change", method=RequestMethod.POST)
	@ResponseBody
	public int change(@RequestParam(value="listchecked") List<String> listchecked,String memberLevel,Model model){
		System.out.println("postNo"+listchecked+"//////"+"postType"+memberLevel);
		int result = service.change(listchecked,memberLevel);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
	
		return result;
	}
	
	
	
	//공지글 취소하기 (내리기>N)
	@RequestMapping(value="/cancel", method=RequestMethod.POST)
	@ResponseBody
	public int cancel(@RequestParam(value="listchecked") List<String> listchecked,Model model){
		int result = service.cancel(listchecked);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
	
		return result;
	}
	//공지글 재등록하기 (올리기>Y)
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	@ResponseBody
	public int registration(@RequestParam(value="listchecked") List<String> listchecked,Model model){
		int result = service.registration(listchecked);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
	
		return result;
	}
	
	
	//등업 글쓰기 페이지 이동
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public String notice_writeMove(Model model){
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
		return "manager/notice_write";
	}
	//공지 글쓰기
	@RequestMapping(value="/notice_write", method=RequestMethod.POST)
	public String notice_write(Posts post , HttpSession session, MultipartFile upload, Model model){
		post.setMemberId((String)session.getAttribute("memberId"));
		String originalfile = upload.getOriginalFilename();
		String savedfile = FileService.saveFile(upload,uploadPath);
		
		post.setOriginalFile(originalfile);
		post.setSavedFile(savedfile);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		
		int result = servicePost.writing(post);
		if(result==0){
			return "manager/notice_write"; 
		}
		return "redirect:managerPage";
	}
	
	//공지 출력
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	@ResponseBody
	public List<Posts> noticeList(
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage, Model model
			){
		
		int countPerPage=10;
		int totalRecordCount = repo.getNoticeCount();
		System.out.println(totalRecordCount);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		List<Posts> noticeList = repo.selectNoticeAll( navi.getStartRecord(), countPerPage);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeLists = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeLists);
        System.out.println("공지 목록: " + noticeLists);
		
		
		return noticeList;
	}
	
	//신고 글 출력
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	@ResponseBody
	public List<Posts> reportList(
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage, Model model
			){
		
		int countPerPage=10;
		int totalRecordCount = repo.getreportCount();
		System.out.println("리포트갯수  "+totalRecordCount);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		List<Posts> reportList = repo.selectreportAll( navi.getStartRecord(), countPerPage);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
		
		return reportList;
	}

	
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice (@RequestParam(value="currentPage", defaultValue="1")     int currentPage
			, Model model){
		
		int countPerPage=10;
		int totalRecordCount = repo.getNoticeCount();
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		List<Posts> noticeList = repo.selectNoticeAll( navi.getStartRecord(), countPerPage);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("navi", navi);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeLists = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeLists",noticeLists);
        System.out.println("공지 목록: " + noticeLists);
		
		return"userBoard/notice";
	}
	
}
