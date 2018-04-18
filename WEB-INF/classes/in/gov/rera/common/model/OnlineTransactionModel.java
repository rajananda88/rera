package in.gov.rera.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity(name = "OnlineTransactionModel")
@Table(name = "TT_ONLINE_TRX")
public class OnlineTransactionModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1879824324344L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TRX_ID")
	private long transactionId;
	
	@Column(name = "TRX_NO")
	private String transactionNo;
	
	@Column(name = "PAYMENT_ID")
	private String paymentId;
	
	@Column(name = "SERVICE_ID")
	private String serviceId;
	
	@Column(name = "STATUS_ID")
	private String status;
	
	@Column(name = "AMOUNT")
	private int amount;
	
	@Column(name = "MODE")
	private String mode;
	
	@Column(name = "BANKCODE")
	private String bankCode;
	
	@Column(name = "ERROR_MSG")
	private String errorMsg;

	public long getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}



	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	

}
