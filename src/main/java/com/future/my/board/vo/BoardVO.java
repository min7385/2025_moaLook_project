package com.future.my.board.vo;

import com.future.my.board.enums.StyleType;

public class BoardVO {
	
	private Integer boardNo;
	private String boardTitle;
	private String boardContent;
	private String memId;
	private String memName;
	private String createDate;
	private String updateDate;
	private Integer styleType;
	private String boardImgPath;
	
	public String getBoardImgPath() {
		return boardImgPath;
	}
	public void setBoardImgPath(String boardImgPath) {
		this.boardImgPath = boardImgPath;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getStyleType() {
		return styleType;
	}
	public void setStyleType(Integer styleType) {
		this.styleType = styleType;
	}
	
	// 메서드 추가: input 태그의 value를 텍스트로 변환 
    public String getStyleTypeName() {
        if (this.styleType == null) {
            return StyleType.UNKNOWN.getDescription();
        }
        return StyleType.getDescriptionByCode(this.styleType);
    }
    
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memId=" + memId + ", memName=" + memName + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", styleType=" + styleType + ", boardImgPath=" + boardImgPath + "]";
	}

}
