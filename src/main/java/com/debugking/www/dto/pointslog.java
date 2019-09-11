package com.debugking.www.dto;

import lombok.Data;

@Data
public class pointslog {
	private int logid;
	private String memberid;
	private String theOtherId;
	private String eventdate;
	private int amount;
	private int balance;
}
