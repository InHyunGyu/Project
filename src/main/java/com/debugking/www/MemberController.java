package com.debugking.www;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.debugking.www.dao.FollowRepository;
import com.debugking.www.dao.ListRepository;
import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.MemberService;
import com.debugking.www.util.Gmail;
import com.debugking.www.util.PageNavigator;
import com.debugking.www.util.SHA256;




@Controller
public class MemberController {
	@Autowired
	MemberService serivce;
	@Autowired
	MemberRepository repo;
	@Autowired
	ListRepository listRepo;
	@Autowired
	FollowRepository followRepo;
	

	final String uploadPath = "/resources/assets/userFiles"; 
	String realpath;
	String savedFilename; //UUID 및 date 문자열을 포함한 확장자를 포함한 파일명
	String originalFilename;
	
	public void createContentId(MemberInfo member, HttpServletRequest request){
		System.out.println("----------createContentId메서드 호출-----");
		originalFilename = member.getPhotoname(); 
		String realpathTemp = request.getServletContext().getRealPath("/resources/assets/");
		System.out.println("실제주소==============> "+realpath);
		File theDir = new File("userFiles"); 
		if(!theDir.exists()){
			//new File(realpathTemp + "\\userFiles").mkdir();
			new File(realpathTemp + "\\userFiles").mkdir();
		}
		
		realpath = request.getServletContext().getRealPath("/resources/assets/userFiles");
		
		String randomString = UUID.randomUUID().toString();
		originalFilename    = randomString + originalFilename; //파일명 앞에 ranme 문자열 추가
		
		//아래 루프는 중복 파일이 있는지 검사하고 없을 경우에는 그냥 시간 날짜값을 붙여주는 작업이다. 
		while(true){
			File serverFile = new File(realpath + "\\" + originalFilename);
			//같은 파일이름이 있으면 덮어씌워질 위험이 있으므로, 별도의 작업을 하지 않고 루프를 나간다. 
			if(serverFile.isFile()) break;
			savedFilename = new Date().getTime() + originalFilename;
			break;
		}
		
		System.out.println("----------createContentId메서드 호출 종료-----");
	}
	@RequestMapping(value="/imageFetch", method=RequestMethod.GET)
	@ResponseBody
	public String imageFetch(HttpSession session, HttpServletRequest request,String memberId){
	
		System.out.println(memberId);
		MemberInfo member = repo.selectOne(memberId);
		String photoname = member.getPhotoname();
		System.out.println(photoname);
		
		String realpath = request.getServletContext().getRealPath("/resources/assets/userFiles");
		String filepath = realpath + "\\" + photoname;
		
		
		return "download?memberId=" + memberId;
	}
	
	
	@RequestMapping(value="/ajaxFileUpload", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxFileUpload(MemberInfo member, HttpServletRequest request,
								MultipartFile[] uploadFile, HttpServletResponse response,
								HttpSession session)
	{
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		String memberId = (String) session.getAttribute("memberId");
		//이 메서드는 사진 파일을 insert하기 위해 쓰일 예정
		createContentId(member, request); //이 메서드에서 'savedFilename'과 '실 저장 경로'가 결정됨.
		
		String fullpath = realpath + "\\" + savedFilename; 
		
		member.setMemberId(memberId);
		member.setPhotoname(savedFilename);
		member.setSavefile(fullpath);
		
		
		repo.setPhotoname(member);
		repo.setSavefile(member);
		
		
		//multipart로 받아온 파일을 지정한 realpath경로에  savedFilename의 이름으로 저장한다.  
		
		for (MultipartFile multipartFile : uploadFile) 
		{
			File saveFile = new File(realpath, savedFilename);
			try{
				multipartFile.transferTo(saveFile); 
			}catch(Exception e){
				e.printStackTrace(); 
			}
		}
		
	/*
		"file:\\\\" + realpath + "\\" + savedFilename 
		이것을 ajax통신으로 클라이언트에게 return 하게 되면 파일의 로컬 파일 경로를 toss한다. 
	*/
		
		return "download?memberId=" + memberId;
	}
	
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String memberUpdate(MemberInfo member, HttpServletRequest request,
			MultipartFile[] uploadFile, HttpServletResponse response,
			HttpSession session)
	{
		System.out.println("정보 수정 메서드 호출 ");
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String memberId = (String) session.getAttribute("memberId");
		
		//이 아래 메서드를 통해 savedFileName 이름 생성. 
		createContentId(member, request);
		
		String fullpath = realpath + "\\" + savedFilename; 
		
		member.setPhotoname(savedFilename);
		member.setSavefile(fullpath);
		
		int result = repo.memberUpdate(member);
		
		if(result > 0) System.out.println("삽입성공!");
		
		//multipart로 받아온 파일을 지정한 realpath경로에  savedFilename의 이름으로 저장한다.  
		
		for (MultipartFile multipartFile : uploadFile) 
		{
			File saveFile = new File(realpath, savedFilename);
			try{
				multipartFile.transferTo(saveFile); 
			}catch(Exception e){
				e.printStackTrace(); 
			}
		}
		
		if(result > 0) return "ok";
		
		return null;
	}
	
	
	//파일 다운로드 및 이미지 
		@RequestMapping(value="/download", method=RequestMethod.GET) 
		@ResponseBody
		public String download(MemberInfo member, HttpServletResponse response, HttpSession session,String memberId) 
		/*참고: 만일 리턴 타입이 void이면 download.jsp를 찾는다. */
		{
		
			MemberInfo fetchedMember 		= repo.selectOne(memberId);
			System.out.println(fetchedMember);
			
			String savedfile 	= fetchedMember.getSavefile();
			String filename = fetchedMember.getPhotoname();
			
			//응답 Body를 브라우저가 어떻게 표시해야할지 알려준다. 다운로드되길 원하는 파일은 attachment로 값을 설정하고, 
			//filename 옵션으로 파일명까지 지정해줄 수 있다.
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			
			String fullPath = savedfile; 
			
			FileInputStream filein 		= null;
			ServletOutputStream fileout = null;
			
			try {
				filein  = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				FileCopyUtils.copy(filein, fileout);
				
				filein.close();
				fileout.close();
				
				
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
			return null; /*볼 view단이 없기 때문에 현재에만 머물러 있는 거. 그냥 자기 자리에만 있는거*/
		}
		
/*	
	//이미지 프리뷰
	@RequestMapping(value="/imagePreview", method=RequestMethod.POST)
	@ResponseBody
	public String imagePreview(MultipartFile mypic){
		System.out.println("ok");
		System.out.println(mypic);

		String uploadPath = "C:/uploadTemp"; 

		String fileName = mypic.getOriginalFilename();
		System.out.println(fileName);
		File saveFile = new File(uploadPath, fileName);
		try {
			mypic.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "ok"; 
	}
	
*/	

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage (){
		
		return "member/login";
	}
	

	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public MemberInfo login(HttpSession session, MemberInfo member) {
		MemberInfo result = repo.login(member);
		
		if(result != null){
			session.setAttribute("memberId", result.getMemberId());
			session.setAttribute("memberName", result.getMemberName());
			return result;
		}
		else{
			return null;
		}
	}
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String signup(HttpSession session){
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		return "redirect:/";

	}
	//회원탈퇴
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(HttpSession session, MemberInfo member){
		member.setMemberId((String)session.getAttribute("memberId"));
		MemberInfo temp = repo.selectOne(member.getMemberId());
		int result = repo.memberDelete(temp);
		if(result == 1){
			session.removeAttribute("memberId");
			session.removeAttribute("memberName");
			return "redirect:/"; 
		}else{
			return "redirect:/";
		}
	}
	
	//화면이동
	@RequestMapping(value="/emailSendAction", method=RequestMethod.GET)
	public String emailSendAction(){

		return "member/emailSendAction";
	}
		
	//화면이동
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){

		return "member/signup";

	}
	//회원등록하기
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	@ResponseBody
	public String signupPro(MemberInfo member, HttpSession session){
		HttpServletResponse response = null;
		int temp = serivce.signup(member);
		
		//session 영역에 유저 아이디와 패스워드 저장
		session.setAttribute("userid", member.getMemberId());
		session.setAttribute("userpwd", member.getMemberPwd());
		
		//회원가입을 위해 본인 확인 이메일 보내기 위한 코드 설정
		String host = "http://localhost:8998/www/";
		String from = "dlgkrals6000@gmail.com"; 
		String to   = repo.getUserEmail(member.getMemberId()); 
		System.out.println(to);
		String subject = "이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + 
		"<a href='" +  host + "emailCheckAction?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
		
		Properties p = new Properties(); 
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth = new Gmail(); 
			Session ses = Session.getInstance(p, auth); 
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses); 
			msg.setSubject(subject);
			
			Address fromAddr = new InternetAddress(from); 
			msg.setFrom(fromAddr);
			
			Address toAddr   = new InternetAddress(to); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류 발생');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return null;
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("본인 확인 이메일  코드 완료");
		
		 
		return "ok"; 
/*
		String result = "";
		switch(temp){
		case 1:
			result = "success";
			break;
		case 0:
			result = "fail";
			break;
		}
*/
		
	}
	
	@RequestMapping(value="/emailCheckAction", method=RequestMethod.GET)
	public String emailCheckAction(String code, Model model, HttpServletRequest request,
									HttpSession session) 
	{
		System.out.println("emailCheckAction 호출");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		System.out.println("코드 출력해보기:" + code);
		
		//경우를 나눈다. 1. 인증 성공 / 2. 아이디가 없는 경우 / 3. 코드가 정확하지 않을 경우
		String sucess = "인증에 성공했습니다."; 
		String noid   = "로그인을 해주세요.";
		String error  = "유효하지 않은 코드입니다."; 
		
		String userid = (String)session.getAttribute("userid");
		
		String userEmail = repo.getUserEmail(userid); 
		boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false; 
		
		if(userid == null){
			model.addAttribute("noid", noid); 
			return "member/id_pwd"; 
		}
		
		if(isRight == true){
			repo.setUserEmailChecked(userid);
			
			
			System.out.println("로그인된 유저아이디:" + userid);
			
			//repo.setUserEmailCode(code);
			model.addAttribute("success", sucess);
			
			return "redirect:/"; 
		}else if(isRight == false){
			model.addAttribute("error", error);
			return "redirect:/"; 
		}
		
		return null;
	}
	
	
	@RequestMapping(value="/myblog", method=RequestMethod.GET)
	public String myblog(){
		return "member/myblog";
	}

	//ID체크 한명불러오기
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String memberId){
		MemberInfo result = repo.idCheck(memberId);
		if(result!=null){
			return "true";
		}
		else{
			return "false";
		}
	}
	
	
	
	
	
	@RequestMapping(value="/id_pwd", method=RequestMethod.GET)
	public String id_pwd(){
		return "member/id_pwd";
	}
	
	@ResponseBody
	@RequestMapping(value="/findid", method=RequestMethod.POST)
	public MemberInfo findid(MemberInfo member){
		System.out.println(member);
		
		MemberInfo fetchedMember = repo.getMemberId(member);
		
		return fetchedMember;
	}
	
	@ResponseBody
	@RequestMapping(value="/findpwd", method=RequestMethod.POST)
	public MemberInfo findpwd(MemberInfo member){
		System.out.println(member);
		
		MemberInfo fetchedMember = repo.getMemberPwd(member);
		System.out.println("fetchedMember="+fetchedMember );
		
		return fetchedMember;
	}
	
	//이메일을 이용한 패스워드 찾기
	@RequestMapping(value="/pwfindMailSend", method=RequestMethod.POST)
	@ResponseBody
	public String findpwd(MemberInfo member, HttpSession session){
		
		HttpServletResponse response = null;
		// 이메일 보내기 위한 코드 설정
		String host = "http://localhost:8088/www/";
		String from = "dlgkrals6000@gmail.com"; 
		String to   = repo.getUserEmail(member.getMemberId()); 
		System.out.println(to);
		String subject = "[우타짱] 임시 비밀번호입니다."; 
		String content = "다음 임시비밀번호로 로그인하여 비밀번호를 재설정 해 주시기 바랍니다. 임시비밀번호:" + 
		new SHA256().getSHA256(to) + "<br><a href='" + host + "tempPwdSet?memberPwd=" 
		+ new SHA256().getSHA256(to) + "&memberEmail=" + to + "'>홈페이지로 돌아가기</a>";
		
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		try{
			Authenticator auth = new Gmail(); 
			Session ses = Session.getInstance(p, auth); 
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses); 
			msg.setSubject(subject);
			
			Address fromAddr = new InternetAddress(from); 
			msg.setFrom(fromAddr);
			
			Address toAddr   = new InternetAddress(to); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류 발생');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return null;
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		return "ok";
	}
	
	@RequestMapping(value="/follow_page", method=RequestMethod.GET)
	public String follow(String memberId, Model model){
		MemberInfo info =  repo.selectOne(memberId);
		
		int postCount = listRepo.postCount(memberId);
		
		ArrayList<Posts> list = new ArrayList<>();
		list = listRepo.selectList(memberId);
		
		int followCount = followRepo.followCount(memberId);
		
		model.addAttribute("memberInfo", info);
		model.addAttribute("postCount", postCount);
		model.addAttribute("list", list);
		model.addAttribute("followCount", followCount);
		
		return"member/follow_page";
}

	
	

	@RequestMapping(value="/tempPwdSet", method=RequestMethod.GET)
	public String tempPwdSet(MemberInfo member, HttpSession session){
		
		String memberEmail = member.getMemberEmail(); 
		String memberPwd = member.getMemberPwd(); 
		System.out.println("멤버 이메일:" + memberEmail + "/ 멤버 패스워드:" + memberPwd);
		int result = repo.tempPwdSet(member); 
		
		return "main"; 
	}
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(HttpSession session, Model model){
		String memberId = (String)session.getAttribute("memberId");
		MemberInfo member = repo.selectOne(memberId);
		String memberName = member.getMemberName();
		String myintro    = member.getMyintro(); 
		String memberPhone = member.getMemberPhone();
		String memberEmail = member.getMemberEmail(); 
		
		model.addAttribute("memberEmail", memberEmail);
		model.addAttribute("memberId", memberId);
		model.addAttribute("memberName", memberName);
		model.addAttribute("myintro", myintro);
		model.addAttribute("memberPhone", memberPhone);
		
		return"member/modify";
	}
	
	

	
	@ResponseBody
	@RequestMapping(value="/memberPost", method=RequestMethod.GET)
	public ArrayList<Posts> memberPost(String memberId, Model model){
		
		int postCount = listRepo.postCount(memberId);
		int currentPage = 1;
		PageNavigator navi = new PageNavigator(currentPage, postCount);
		
		ArrayList<Posts> list = new ArrayList<>();
		
		list = listRepo.memberPost(memberId, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("navi", navi);
		
		return list;
	}
	
}
