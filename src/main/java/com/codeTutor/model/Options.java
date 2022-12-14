package com.codeTutor.model;

public class Options {
	private String keywordOption;
	private String searchOption;
	private String languageOption;

	public String getKeywordOption() {
		return keywordOption;
	}

	public void setKeywordOption(String keywordOption) {
		this.keywordOption = keywordOption;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getLanguageOption() {
		return languageOption;
	}

	public void setLanguageOption(String languageOption) {
		this.languageOption = languageOption;
	}

	@Override
	public String toString() {
		return "Options [keywordOption=" + keywordOption + ", searchOption=" + searchOption + ", languageOption="
				+ languageOption + "]";
	}
}
