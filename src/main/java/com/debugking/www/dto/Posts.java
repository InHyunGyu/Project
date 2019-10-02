package com.debugking.www.dto;

<<<<<<< HEAD
import lombok.AllArgsConstructor;
=======
import java.util.ArrayList;

>>>>>>> 299b179986c6822550c95eb6b6baf3797f16d5e4
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Posts {
	private int postNo;  //postNoSeq
	private String memberId;//
	private String postTitle;//
	private String postContent;//
	private int postView;//
	private int postLike;//
	private String postDate;//
	private String isAnnouncement;	//DEFAULT 'N',
	private String postType;
	private String originalFile;//
	private String savedFile;//
	private int reported;//
	private ArrayList<String> like_array;
	private ArrayList<String> reported_array;
}
