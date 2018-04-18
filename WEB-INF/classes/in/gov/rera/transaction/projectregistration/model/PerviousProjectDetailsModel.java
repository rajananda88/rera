package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "PreviousProjectDetailsModel")
@Table(name = "TL_PERIVIOUS_PROJECT_DETAILS")
public class PerviousProjectDetailsModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PERV_PROJ_ID")
	private Long pervProjectRegId;
	
	
	

	@Column(name = "PROJECT_NAME", length = 150)
	private String projectName;

	@Column(name = "PROJECT_DESC", length = 400)
	private String projectDescription;

	@Column(name = "PROJECT_CURENT_STATUS", length = 20)
	private String projectCurrentStatus;

	@Column(name = "TYPE_OF_LAND")
	private String typeOfLand;
	
	@Column(name = "OTHER_OCCUPANCY")
	private String othersOccupancy;

	@Column(name = "IF_DELAYED")
	private Boolean ifDelayed;

	@Column(name = "NO_OF_MONTH_DELAYED")
	private String noOfMonthDelayed;

	@Column(name = "IF_ONGOING")
	private Boolean ifOngoing;

	@Column(name = "EXPECTEDCOMPLETIONDATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date expectedCompletionDate;

	@Column(name = "DT_OF_COMPLETION")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date completionDate;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;
	

	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public Document getOccupancyDocId() {
		return occupancyDocId;
	}

	public void setOccupancyDocId(Document occupancyDocId) {
		this.occupancyDocId = occupancyDocId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_COML_DOC_ID")
	private Document completionDocId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_OCCUP_DOC_ID")
	private Document occupancyDocId;
	
	
	@Column(name = "PROJECT_ADDRESS", length = 400)
	private String projectAddress;

	@Column(name = "IS_CASES_PENDING")
	private String isCasesPending;
	
	@Column(name = "CASE_NO", length = 25)
	 private String caseNo;
	public String getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}

	@Column(name = "PRJ_CASES_DETAILS",length=400)
	private String caseDetails;

	@Column(name = "CASES_STATUS",length=400)
	private String caseStatus;
	public String getCaseStatus() {
		return caseStatus;
	}

	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}

	// Below changes done on 6/7/17
	@Column(name = "PREVCOMPLETIONDATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date prevCompletionDate;
	
	@Column(name = "PRJ_DELAY_REASON",length=400)
	private String prjDelayReason;
// 
	@Column(name = "IS_PAYMENT_PENDING")
	private String isPaymentPending;
	
	@Column(name="PENDING_AMOUNT")
	private Double pendingAmount;
	

	public void setIsCasesPending(String isCasesPending) {
		this.isCasesPending = isCasesPending;
	}
	
	public String getIsCasesPending() {
		return isCasesPending;
	}

	
	

	public String getCaseDetails() {
		return caseDetails;
	}

	public void setCaseDetails(String caseDetails) {
		this.caseDetails = caseDetails;
	}

	public Date getPrevCompletionDate() {
		return prevCompletionDate;
	}

	public void setPrevCompletionDate(Date prevCompletionDate) {
		this.prevCompletionDate = prevCompletionDate;
	}

	public String getPrjDelayReason() {
		return prjDelayReason;
	}

	public void setPrjDelayReason(String prjDelayReason) {
		this.prjDelayReason = prjDelayReason;
	}
	
	public String getIsPaymentPending() {
		return isPaymentPending;
	}

	public void setIsPaymentPending(String isPaymentPending) {
		this.isPaymentPending = isPaymentPending;
	}

	@Column(name = "PIN_CODE", length = 20)
	private String projectAddrPinCode;

	



	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public String getProjectCurrentStatus() {
		return projectCurrentStatus;
	}

	public void setProjectCurrentStatus(String projectCurrentStatus) {
		this.projectCurrentStatus = projectCurrentStatus;
	}

	public String getTypeOfLand() {
		return typeOfLand;
	}

	public void setTypeOfLand(String typeOfLand) {
		this.typeOfLand = typeOfLand;
	}

// aDDED FOR rera bIHAR
	public String getOthersOccupancy() {
		return othersOccupancy;
	}

	public void setOthersOccupancy(String othersOccupancy) {
		this.othersOccupancy = othersOccupancy;
	}	
//	
	public Boolean getIfDelayed() {
		return ifDelayed;
	}

	public void setIfDelayed(Boolean ifDelayed) {
		this.ifDelayed = ifDelayed;
	}

	public String getNoOfMonthDelayed() {
		return noOfMonthDelayed;
	}

	public void setNoOfMonthDelayed(String noOfMonthDelayed) {
		this.noOfMonthDelayed = noOfMonthDelayed;
	}

	public Boolean getIfOngoing() {
		return ifOngoing;
	}

	public void setIfOngoing(Boolean ifOngoing) {
		this.ifOngoing = ifOngoing;
	}

	public Date getExpectedCompletionDate() {
		return expectedCompletionDate;
	}

	public void setExpectedCompletionDate(Date expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}




	


	public Long getPervProjectRegId() {
		return pervProjectRegId;
	}

	public void setPervProjectRegId(Long pervProjectRegId) {
		this.pervProjectRegId = pervProjectRegId;
	}

	public String getProjectAddress() {
		return projectAddress;
	}

	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}

	

	public String getProjectAddrPinCode() {
		return projectAddrPinCode;
	}

	public void setProjectAddrPinCode(String projectAddrPinCode) {
		this.projectAddrPinCode = projectAddrPinCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Double getPendingAmount() {
		return pendingAmount;
	}

	public void setPendingAmount(Double pendingAmount) {
		this.pendingAmount = pendingAmount;
	}

	/**
	 * @return the completionDocId
	 */
	public Document getCompletionDocId() {
		return completionDocId;
	}

	/**
	 * @param completionDocId the completionDocId to set
	 */
	public void setCompletionDocId(Document completionDocId) {
		this.completionDocId = completionDocId;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}
}
