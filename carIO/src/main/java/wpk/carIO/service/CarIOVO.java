package wpk.carIO.service;

public class CarIOVO {
	private int seq;
	private String carNo;
	private String inDtm;
	private String outDtm;
	private String duration;
	private String amount;
	private String sttlTm;
	private String isPerm;
	
	public int getSeq() {
		return seq;
	}
	
	public String getCarNo() {
		return carNo;
	}
	
	public String getInDtm() {
		return inDtm;
	}
	
	public String getOutDtm() {
		return outDtm;
	}
	
	public String getDuration() {
		return duration;
	}
	
	public String getAmount() {
		return amount;
	}
	
	public String getSttlTm() {
		return sttlTm;
	}
	
	public String getIsPerm() {
		return isPerm;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	public void setInDtm(String inDtm) {
		this.inDtm = inDtm;
	}
	
	public void setOutDtm(String outDtm) {
		this.outDtm = outDtm;
	}
	
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public void setSttlTm(String sttlTm) {
		this.sttlTm = sttlTm;
	}
	
	public void setIsPerm(String isPerm) {
		this.isPerm = isPerm;
	}
}