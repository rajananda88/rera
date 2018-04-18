package in.gov.rera.transaction.agentregistration.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.bank.model.BankModel;

@Entity(name = "PaymentDetailsModel")
@Table(name = "TL_AGENT_REG_PAYMENT_DETAILS")
public class RegPaymentDetailsModel implements Serializable {

	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RES_PAY_DELS_ID")
	private Long regPaymentDelId;
	
		
	@ManyToOne
	@JoinColumn(name="BANK_ID")
	private BankModel bankModel;

	@Column(name = "PAYMENT_MODE")
	private String paymentMode;
	
	@Column(name = "BANK_NAME", length = 50)
	private String bankName;
	
	@Column(name = "AMOUNT", length = 100)
	private Double amount;
	
	@Column(name = "BRANCH", length = 150)
	private String branch;
	
	@Column(name = "DD_CHEQUE_NO", length = 50)
	private String ddOrChequeNo;
	
	@ManyToOne
	@JoinColumn(name = "ATTACH_SCAN_COPY_ID")
	private Document attachScanCopy;

	public Long getRegPaymentDelId() {
		return regPaymentDelId;
	}

	public void setRegPaymentDelId(Long regPaymentDelId) {
		this.regPaymentDelId = regPaymentDelId;
	}

	
	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getDdOrChequeNo() {
		return ddOrChequeNo;
	}

	public void setDdOrChequeNo(String ddOrChequeNo) {
		this.ddOrChequeNo = ddOrChequeNo;
	}

	public Document getAttachScanCopy() {
		return attachScanCopy;
	}

	public void setAttachScanCopy(Document attachScanCopy) {
		this.attachScanCopy = attachScanCopy;
	}

	public BankModel getBankModel() {
		return bankModel;
	}

	public void setBankModel(BankModel bankModel) {
		this.bankModel = bankModel;
	}



	
}

