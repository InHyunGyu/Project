package com.debugking.www.dto;

import lombok.Data;

@Data
public class Pointslog {
	private int lognum;
	private String memberid;
	private String theOtherId;
	private String eventdate;
	private int amount;
	private int balance;
	private String pointtype;
}
