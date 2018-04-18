package in.gov.rera.transaction.agentregistration.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Entity(name = "AgentRegistrationModel")
@Table(name = "TT_AGENT_REGISTRATION")
public class AgentRegistrationModel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AGENT_REG_ID")
	private Long agentRegistrationID;
	
	@Column(name = "AGENT_REG_NO")
	private String agentRegistrationNo;
	
	@Column(name = "REASON_FOR_REVOKE")
	private String reasonForRevoke;
	
	
	@OneToMany(cascade =CascadeType.ALL,fetch = FetchType.LAZY)
	private Set<ProjectAgentModel> projectRegistrationModelSet;
	

	@Column(name="REG_TYPE")
	private String registrationType;
	
	@Column(name="STATUS")
	private String status;
	
	
	
	@Column(name="CREATED_ON")
	private Calendar createdOn;
	
	
	@Column(name="APPROVED_ON")
	private Calendar approvedOn;
	
	@Column(name="EXPRIRED_DATE")
	private Calendar expireDate;
	
	@Column(name="LAST_UPDATED_ON")
	private Calendar lastUpdatedOn;
	
	@ManyToOne
	@JoinColumn(name="APPROVED_BY")
	private UserModel approvedBy;
	
	
	@ManyToOne
	@JoinColumn(name="ASSIGN_TO")
	private UserModel assignTo;
	
	@OneToOne(  cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name="AGENT_REG_DETAILS_ID")
	private AgentDetailsModel agentDetailsModel;
	
	@OneToOne(  cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name="AGENT_USER_ID")
	private UserModel agentUser;

	@Column(name="AGENT_CREATED_ON")
	private String agentRegApprovedDate=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new Date());
	

	@Column(name="REG_STAGE")
   private String registrationStage;
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<AgentRegistrationLog> registrationHistory;
	
	 
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	 private List<EnquiryModel> enquiryList;

	 
	 
	 
	 
	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public String getAgentRegistrationNo() {
		return agentRegistrationNo;
	}

	public void setAgentRegistrationNo(String agentRegistrationNo) {
		this.agentRegistrationNo = agentRegistrationNo;
	}

	
	

	public String getReasonForRevoke() {
		return reasonForRevoke;
	}

	public void setReasonForRevoke(String reasonForRevoke) {
		this.reasonForRevoke = reasonForRevoke;
	}



	
	
	public Set<ProjectAgentModel> getProjectRegistrationModelSet() {
		return projectRegistrationModelSet;
	}

	public void setProjectRegistrationModelSet(
			Set<ProjectAgentModel> projectRegistrationModelSet) {
		this.projectRegistrationModelSet = projectRegistrationModelSet;
	}

	public UserModel getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(UserModel assignTo) {
		this.assignTo = assignTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}

	public Calendar getApprovedOn() {
		return approvedOn;
	}

	public void setApprovedOn(Calendar approvedOn) {
		this.approvedOn = approvedOn;
	}

	public Calendar getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Calendar expireDate) {
		this.expireDate = expireDate;
	}

	public Calendar getLastUpdatedOn() {
		return lastUpdatedOn;
	}

	public void setLastUpdatedOn(Calendar lastUpdatedOn) {
		this.lastUpdatedOn = lastUpdatedOn;
	}

	public UserModel getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(UserModel approvedBy) {
		this.approvedBy = approvedBy;
	}


	
	public String getAgentRegApprovedDate() {
		return agentRegApprovedDate;
	}

	public void setAgentRegApprovedDate(String agentRegApprovedDate) {
		this.agentRegApprovedDate = agentRegApprovedDate;
	}


	public UserModel getAgentUser() {
		return agentUser;
	}

	public void setAgentUser(UserModel agentUser) {
		this.agentUser = agentUser;
	}

	public Long getAgentRegistrationID() {
		return agentRegistrationID;
	}

	public void setAgentRegistrationID(Long agentRegistrationID) {
		this.agentRegistrationID = agentRegistrationID;
	}

	public AgentDetailsModel getAgentDetailsModel() {
		return agentDetailsModel;
	}

	public void setAgentDetailsModel(AgentDetailsModel agentDetailsModel) {
		this.agentDetailsModel = agentDetailsModel;
	}
	
	
	

	public String getRegistrationStage() {
		return registrationStage;
	}

	public void setRegistrationStage(String registrationStage) {
		this.registrationStage = registrationStage;
	}

	public List<AgentRegistrationLog> getRegistrationHistory() {
		return registrationHistory;
	}

	public void setRegistrationHistory(
			List<AgentRegistrationLog> registrationHistory) {
		this.registrationHistory = registrationHistory;
	}

	

}
