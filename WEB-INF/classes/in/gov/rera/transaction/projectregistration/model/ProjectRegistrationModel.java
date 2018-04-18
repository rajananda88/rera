package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "ProjectRegistrationModel")
@Table(name = "TT_PROJECT_REG")
public class ProjectRegistrationModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_REG_ID")
	
	private Long projectRegId;

	@Column(name = "PROJECT_REG_NO", length = 50)
	private String projectRegistrationNo;
	
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="REG_TYPE")
	private String registrationType;
	
	@Column(name = "REASON_FOR_REVOKE")
	private String reasonForRevoke;
	
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
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private Set<PerviousProjectDetailsModel> previousProjectDetailsSet;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_DELS_ID")
	private ProjectDetailsModel projectDetailsModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_USER_ID")
	private UserModel projectUser;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<DevelopmentDetailsModel> developmentDetailSet;

	@OneToMany(cascade =CascadeType.PERSIST,fetch = FetchType.LAZY)
	private Set<ProjectAgentModel> projectAgentDetailSet;
	
	
	@OneToMany( cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<ProjectArchitectDetailsModel> projectArchitectDetailSet;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<StructuralEngineerDetailsModel> structuralEngineerDetailSet;
	
	@OneToMany( cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<ProjectContratorDetailsModel>projectContratorDetailSet;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_REG_EXT_ID")
	private ProjectRegExtensionModel projectExtention;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Document>projectPhotoDetailSet;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROMOTER_DELS_ID")
	private PromoterDetailsModel promoterDetailsModel;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="EXT_DEV_ID")
	private ExternalDevelopmentWorkModel externalDevelopmentWorkModel;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_BANK_DELS_ID")
	private ProjectBankDetailsModel projectBankDetailsModel;
	
	
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJ_DOC_ID")
	private ProjectDocModel projectDocModel;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_PAYMENT_DELS_ID")
	private ProjectPaymentDetailsModel paymentDetailsModel;
	
	@Column(name="CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;
	
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	 private List<EnquiryModel> enquiryList;
	 
	 
	
	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public ProjectRegExtensionModel getProjectExtention() {
		return projectExtention;
	}

	public void setProjectExtention(ProjectRegExtensionModel projectExtention) {
		this.projectExtention = projectExtention;
	}

	public String getReasonForRevoke() {
		return reasonForRevoke;
	}

	public void setReasonForRevoke(String reasonForRevoke) {
		this.reasonForRevoke = reasonForRevoke;
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

	
	public UserModel getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(UserModel assignTo) {
		this.assignTo = assignTo;
	}

	public ProjectDetailsModel getProjectDetailsModel() {
		return projectDetailsModel;
	}

	public void setProjectDetailsModel(ProjectDetailsModel projectDetailsModel) {
		this.projectDetailsModel = projectDetailsModel;
	}


	public ExternalDevelopmentWorkModel getExternalDevelopmentWorkModel() {
		return externalDevelopmentWorkModel;
	}

	public void setExternalDevelopmentWorkModel(
			ExternalDevelopmentWorkModel externalDevelopmentWorkModel) {
		this.externalDevelopmentWorkModel = externalDevelopmentWorkModel;
	}

	public ProjectBankDetailsModel getProjectBankDetailsModel() {
		return projectBankDetailsModel;
	}

	public void setProjectBankDetailsModel(
			ProjectBankDetailsModel projectBankDetailsModel) {
		this.projectBankDetailsModel = projectBankDetailsModel;
	}



	public String getProjectRegistrationNo() {
		return projectRegistrationNo;
	}

	public void setProjectRegistrationNo(String projectRegistrationNo) {
		this.projectRegistrationNo = projectRegistrationNo;
	}


	public UserModel getProjectUser() {
		return projectUser;
	}

	public void setProjectUser(UserModel projectUser) {
		this.projectUser = projectUser;
	}

	public Long getProjectRegId() {
		return projectRegId;
	}

	public void setProjectRegId(Long projectRegId) {
		this.projectRegId = projectRegId;
	}


	public Set<PerviousProjectDetailsModel> getPreviousProjectDetailsSet() {
		return previousProjectDetailsSet;
	}

	public void setPreviousProjectDetailsSet(
			Set<PerviousProjectDetailsModel> previousProjectDetailsSet) {
		this.previousProjectDetailsSet = previousProjectDetailsSet;
	}


	public Set<DevelopmentDetailsModel> getDevelopmentDetailSet() {
		return developmentDetailSet;
	}

	public void setDevelopmentDetailSet(Set<DevelopmentDetailsModel> developmentDetailSet) {
		this.developmentDetailSet = developmentDetailSet;
	}

	public Set<ProjectArchitectDetailsModel> getProjectArchitectDetailSet() {
		return projectArchitectDetailSet;
	}

	public void setProjectArchitectDetailSet(
			Set<ProjectArchitectDetailsModel> projectArchitectDetailSet) {
		this.projectArchitectDetailSet = projectArchitectDetailSet;
	}

	public Set<StructuralEngineerDetailsModel> getStructuralEngineerDetailSet() {
		return structuralEngineerDetailSet;
	}

	public void setStructuralEngineerDetailSet(
			Set<StructuralEngineerDetailsModel> structuralEngineerDetailSet) {
		this.structuralEngineerDetailSet = structuralEngineerDetailSet;
	}

	public Set<ProjectContratorDetailsModel> getProjectContratorDetailSet() {
		return projectContratorDetailSet;
	}

	public void setProjectContratorDetailSet(
			Set<ProjectContratorDetailsModel> projectContratorDetailSet) {
		this.projectContratorDetailSet = projectContratorDetailSet;
	}


	public Set<Document> getProjectPhotoDetailSet() {
		return projectPhotoDetailSet;
	}

	public void setProjectPhotoDetailSet(Set<Document> projectPhotoDetailSet) {
		this.projectPhotoDetailSet = projectPhotoDetailSet;
	}



	public Set<ProjectAgentModel> getProjectAgentDetailSet() {
		return projectAgentDetailSet;
	}

	public void setProjectAgentDetailSet(
			Set<ProjectAgentModel> projectAgentDetailSet) {
		this.projectAgentDetailSet = projectAgentDetailSet;
	}

	public PromoterDetailsModel getPromoterDetailsModel() {
		return promoterDetailsModel;
	}

	public void setPromoterDetailsModel(PromoterDetailsModel promoterDetailsModel) {
		this.promoterDetailsModel = promoterDetailsModel;
	}

	public ProjectDocModel getProjectDocModel() {
		return projectDocModel;
	}

	public void setProjectDocModel(ProjectDocModel projectDocModel) {
		this.projectDocModel = projectDocModel;
	}

	public ProjectPaymentDetailsModel getPaymentDetailsModel() {
		return paymentDetailsModel;
	}

	public void setPaymentDetailsModel(ProjectPaymentDetailsModel paymentDetailsModel) {
		this.paymentDetailsModel = paymentDetailsModel;
	}

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}



	
	
}
