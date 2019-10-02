package kr.gudi.web.bean;

public class SignUpBean {
	private String sNo;
	private String sId;
	private String sPw;
	private String sName;
	private String sGender;
	private String sPhon;
	
	public String getsNo() {
		return sNo;
	}
	public void setsNo(String sNo) {
		this.sNo = sNo;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsPw() {
		return sPw;
	}
	public void setsPw(String sPw) {
		this.sPw = sPw;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsGender() {
		return sGender;
	}
	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	public String getsPhon() {
		return sPhon;
	}
	public void setsPhon(String sPhon) {
		this.sPhon = sPhon;
	}
	
	@Override
	public String toString() {
		return "SignUpBean [sNo=" + sNo + ", sId=" + sId + ", sPw=" + sPw + ", sName=" + sName + ", sGender=" + sGender
				+ ", sPhon=" + sPhon + "]";
	}
}
