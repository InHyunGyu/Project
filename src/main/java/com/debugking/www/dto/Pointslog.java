package com.debugking.www.dto;

import lombok.Data;

@Data
public class Pointslog {
	private int logNum;  //logNumSeq
	private String memberId;
	private String theOtherId;
	private String eventdate;
	private int amount;
	private int balance;
	private String pointtype;
}
