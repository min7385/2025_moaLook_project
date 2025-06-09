package com.future.my.board.vo;

public class BoardSearchVO extends PagingVO {
	
	private String searchWord;
	private String searchType;
	private String searchCategory;
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	
	@Override
	public String toString() {
		return "BoardSearchVO [" + "super=" + super.toString() + ","
				+ " + searchWord=" + searchWord + ", searchType=" + searchType
				+ ", searchCategory=" + searchCategory + "]";
	}
	
}
