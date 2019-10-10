package kr.gudi.web.bean;

public class HomeBean {
	private String mNo;
	private String mTitle;
	private String mContents;
	private String mImgUrl;
	private String mId;
	private String mDate;
	
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmContents() {
		return mContents;
	}
	public void setmContents(String mContents) {
		this.mContents = mContents;
	}
	public String getmImgUrl() {
		return mImgUrl;
	}
	public void setmImgUrl(String mImgUrl) {
		this.mImgUrl = mImgUrl;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	
	@Override
	public String toString() {
		return "HomeBean [mNo=" + mNo + ", mTitle=" + mTitle + ", mContents=" + mContents + ", mImgUrl=" + mImgUrl
				+ ", mId=" + mId + ", mDate=" + mDate + "]";
	}
}
