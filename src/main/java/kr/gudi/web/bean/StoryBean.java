package kr.gudi.web.bean;

public class StoryBean {
	private String sNo;
	private String sTitle;
	private String sContents;
	private String sImgUrl;
	private String sId;
	private String sDate;
	
	public String getsNo() {
		return sNo;
	}
	public void setsNo(String sNo) {
		this.sNo = sNo;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContents() {
		return sContents;
	}
	public void setsContents(String sContents) {
		this.sContents = sContents;
	}
	public String getsImgUrl() {
		return sImgUrl;
	}
	public void setsImgUrl(String sImgUrl) {
		this.sImgUrl = sImgUrl;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	
	@Override
	public String toString() {
		return "StoryBean [sNo=" + sNo + ", sTitle=" + sTitle + ", sContents=" + sContents + ", sImgUrl=" + sImgUrl
				+ ", sId=" + sId + ", sDate=" + sDate + "]";
	}
	
}
