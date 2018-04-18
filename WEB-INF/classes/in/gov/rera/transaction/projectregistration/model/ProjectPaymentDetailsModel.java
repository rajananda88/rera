package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.bank.model.BankModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity(name = "ProjectPaymentDetailsModel")
@Table(name = "Tl_PROJECT_PAYMENT_DETAILS")
public class ProjectPaymentDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_PAYMENT_DELS_ID")
	private Long paymentId;
	
	@Column(name = "PROJECT_PAYMENT_MODE")
	private String paymentMode;
	
	@Column(name = "PROJECT_PAYMENT_AMOUNT")
	private Double amount;
	
	@Column(name = "PROJECT_PAYMENT_CHEQUE_DD_NO")
	private String ddChequeNo;
	
	@Column(name = "BRANCH_NAME")
	private String branchName;
		
	@ManyToOne
	@JoinColumn(name="BANK_ID")
	private BankModel bankModel;
		
	@ManyToOne
	@JoinColumn(name="ATTACH_SCAN_COPY_DOC_ID")
	private Document scanCopyDoc;


	
	
	public BankModel getBankModel() {
		return bankModel;
	}


	public void setBankModel(BankModel bankModel) {
		this.bankModel = bankModel;
	}


	public String getPaymentMode() {
		return paymentMode;
	}


	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	


	/**
	 * @return the amount
	 */
	public Double getAmount() {
		return amount;
	}


	/**
	 * @param amount the amount to set
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
	}


	public String getBranchName() {
		return branchName;
	}


	public Long getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}


	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}


	public String getDdChequeNo() {
		return ddChequeNo;
	}


	public void setDdChequeNo(String ddChequeNo) {
		this.ddChequeNo = ddChequeNo;
	}


	public Document getScanCopyDoc() {
		return scanCopyDoc;
	}


	public void setScanCopyDoc(Document scanCopyDoc) {
		this.scanCopyDoc = scanCopyDoc;
	}
}
