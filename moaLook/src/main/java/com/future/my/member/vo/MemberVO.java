package com.future.my.member.vo;

public class MemberVO {
	
	private String memId;
	private String memPw;
	private String memName;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String memId, String memPw, String memName) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + "]";
	}

}
