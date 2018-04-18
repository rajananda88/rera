package in.gov.rera.transaction.projectregistration.model;

import java.util.Set;

import in.gov.rera.dms.beans.Document;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "ProjectDocModel")
@Table(name = "TL_PROJECT_DOC")
public class ProjectDocModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJ_DOC_ID")
	private Long docId;
	
	
	@ManyToOne
	@JoinColumn(name = "AUD_BAL_SHEET_DOC_ID_1")
	private Document auditedBalSheetDoc1;
	
	
	@ManyToOne
	@JoinColumn(name = "AUD_BAL_SHEET_DOC_ID_2")
	private Document auditedBalSheetDoc2;
	
	@ManyToOne
	@JoinColumn(name = "PERFORMA_OF_SALE_AGREEMENT")
	private Document performaForSaleOfAgreement;

	
	
	@ManyToOne
	@JoinColumn(name = "AUD_BAL_SHEET_DOC_ID_3")
	private Document auditedBalSheetDoc3;
	
	
	@Column(name="AUDITED_BAL_SHEET_YEAR_1")
	private String auditedBalSheetYear1;
	
	
	public String getDirectorReportYear1() {
		return directorReportYear1;
	}

	public void setDirectorReportYear1(String directorReportYear1) {
		this.directorReportYear1 = directorReportYear1;
	}

	@Column(name="AUDITED_BAL_SHEET_YEAR_2")
	private String auditedBalSheetYear2;
	
	@Column(name="AUDITED_BAL_SHEET_YEAR_3")
	private String auditedBalSheetYear3;
	
	
	public Document getAuditedBalSheetDoc1() {
		return auditedBalSheetDoc1;
	}

	public void setAuditedBalSheetDoc1(Document auditedBalSheetDoc1) {
		this.auditedBalSheetDoc1 = auditedBalSheetDoc1;
	}

	public Document getAuditedBalSheetDoc2() {
		return auditedBalSheetDoc2;
	}

	public void setAuditedBalSheetDoc2(Document auditedBalSheetDoc2) {
		this.auditedBalSheetDoc2 = auditedBalSheetDoc2;
	}

	public Document getAuditedBalSheetDoc3() {
		return auditedBalSheetDoc3;
	}

	public void setAuditedBalSheetDoc3(Document auditedBalSheetDoc3) {
		this.auditedBalSheetDoc3 = auditedBalSheetDoc3;
	}

	public String getAuditedBalSheetYear1() {
		return auditedBalSheetYear1;
	}

	public void setAuditedBalSheetYear1(String auditedBalSheetYear1) {
		this.auditedBalSheetYear1 = auditedBalSheetYear1;
	}

	public String getAuditedBalSheetYear2() {
		return auditedBalSheetYear2;
	}

	public void setAuditedBalSheetYear2(String auditedBalSheetYear2) {
		this.auditedBalSheetYear2 = auditedBalSheetYear2;
	}

	public String getAuditedBalSheetYear3() {
		return auditedBalSheetYear3;
	}

	public void setAuditedBalSheetYear3(String auditedBalSheetYear3) {
		this.auditedBalSheetYear3 = auditedBalSheetYear3;
	}

	public Document getAuditedProfitLossSheetDoc1() {
		return auditedProfitLossSheetDoc1;
	}

	public void setAuditedProfitLossSheetDoc1(Document auditedProfitLossSheetDoc1) {
		this.auditedProfitLossSheetDoc1 = auditedProfitLossSheetDoc1;
	}

	public Document getAuditedProfitLossSheetDoc2() {
		return auditedProfitLossSheetDoc2;
	}

	public void setAuditedProfitLossSheetDoc2(Document auditedProfitLossSheetDoc2) {
		this.auditedProfitLossSheetDoc2 = auditedProfitLossSheetDoc2;
	}

	public Document getAuditedProfitLossSheetDoc3() {
		return auditedProfitLossSheetDoc3;
	}

	public void setAuditedProfitLossSheetDoc3(Document auditedProfitLossSheetDoc3) {
		this.auditedProfitLossSheetDoc3 = auditedProfitLossSheetDoc3;
	}

	public String getAuditedProfitLossSheetYear1() {
		return auditedProfitLossSheetYear1;
	}

	public void setAuditedProfitLossSheetYear1(String auditedProfitLossSheetYear1) {
		this.auditedProfitLossSheetYear1 = auditedProfitLossSheetYear1;
	}

	public String getAuditedProfitLossSheetYear2() {
		return auditedProfitLossSheetYear2;
	}

	public void setAuditedProfitLossSheetYear2(String auditedProfitLossSheetYear2) {
		this.auditedProfitLossSheetYear2 = auditedProfitLossSheetYear2;
	}

	public String getAuditedProfitLossSheetYear3() {
		return auditedProfitLossSheetYear3;
	}

	public void setAuditedProfitLossSheetYear3(String auditedProfitLossSheetYear3) {
		this.auditedProfitLossSheetYear3 = auditedProfitLossSheetYear3;
	}

	public Document getCashFlowStmtFileDoc1() {
		return cashFlowStmtFileDoc1;
	}

	public void setCashFlowStmtFileDoc1(Document cashFlowStmtFileDoc1) {
		this.cashFlowStmtFileDoc1 = cashFlowStmtFileDoc1;
	}

	public Document getCashFlowStmtFileDoc2() {
		return cashFlowStmtFileDoc2;
	}

	public void setCashFlowStmtFileDoc2(Document cashFlowStmtFileDoc2) {
		this.cashFlowStmtFileDoc2 = cashFlowStmtFileDoc2;
	}

	public Document getCashFlowStmtFileDoc3() {
		return cashFlowStmtFileDoc3;
	}

	public void setCashFlowStmtFileDoc3(Document cashFlowStmtFileDoc3) {
		this.cashFlowStmtFileDoc3 = cashFlowStmtFileDoc3;
	}

	public String getCashFlowStmtYear1() {
		return cashFlowStmtYear1;
	}

	public void setCashFlowStmtYear1(String cashFlowStmtYear1) {
		this.cashFlowStmtYear1 = cashFlowStmtYear1;
	}

	public String getCashFlowStmtYear2() {
		return cashFlowStmtYear2;
	}

	public void setCashFlowStmtYear2(String cashFlowStmtYear2) {
		this.cashFlowStmtYear2 = cashFlowStmtYear2;
	}

	public String getCashFlowStmtYear3() {
		return cashFlowStmtYear3;
	}

	public void setCashFlowStmtYear3(String cashFlowStmtYear3) {
		this.cashFlowStmtYear3 = cashFlowStmtYear3;
	}

	public Document getDirectorReportDoc1() {
		return directorReportDoc1;
	}

	public void setDirectorReportDoc1(Document directorReportDoc1) {
		this.directorReportDoc1 = directorReportDoc1;
	}

	public Document getDirectorReportDoc2() {
		return directorReportDoc2;
	}

	public void setDirectorReportDoc2(Document directorReportDoc2) {
		this.directorReportDoc2 = directorReportDoc2;
	}

	public Document getDirectorReportDoc3() {
		return directorReportDoc3;
	}

	public void setDirectorReportDoc3(Document directorReportDoc3) {
		this.directorReportDoc3 = directorReportDoc3;
	}


	public String getDirectorReportYear2() {
		return directorReportYear2;
	}

	public void setDirectorReportYear2(String directorReportYear2) {
		this.directorReportYear2 = directorReportYear2;
	}

	public String getDirectorReportYear3() {
		return directorReportYear3;
	}

	public void setDirectorReportYear3(String directorReportYear3) {
		this.directorReportYear3 = directorReportYear3;
	}
	
	

	public Document getPerformaForSaleOfAgreement() {
		return performaForSaleOfAgreement;
	}

	public void setPerformaForSaleOfAgreement(Document performaForSaleOfAgreement) {
		this.performaForSaleOfAgreement = performaForSaleOfAgreement;
	}

	public Document getAuditedReportDocId1() {
		return auditedReportDocId1;
	}

	public void setAuditedReportDocId1(Document auditedReportDocId1) {
		this.auditedReportDocId1 = auditedReportDocId1;
	}

	public Document getAuditedReportDocId2() {
		return auditedReportDocId2;
	}

	public void setAuditedReportDocId2(Document auditedReportDocId2) {
		this.auditedReportDocId2 = auditedReportDocId2;
	}

	public Document getAuditedReportDocId3() {
		return auditedReportDocId3;
	}

	public void setAuditedReportDocId3(Document auditedReportDocId3) {
		this.auditedReportDocId3 = auditedReportDocId3;
	}

	public String getAuditedReportYear1() {
		return auditedReportYear1;
	}

	public void setAuditedReportYear1(String auditedReportYear1) {
		this.auditedReportYear1 = auditedReportYear1;
	}

	public String getAuditedReportYear2() {
		return auditedReportYear2;
	}

	public void setAuditedReportYear2(String auditedReportYear2) {
		this.auditedReportYear2 = auditedReportYear2;
	}

	public String getAuditedReportYear3() {
		return auditedReportYear3;
	}

	public void setAuditedReportYear3(String auditedReportYear3) {
		this.auditedReportYear3 = auditedReportYear3;
	}

	@ManyToOne
	@JoinColumn(name = "AUD_PROFIT_LOSS_DOC_ID_1")
	private Document auditedProfitLossSheetDoc1;
	
	
	@ManyToOne
	@JoinColumn(name = "AUD_PROFIT_LOSS_DOC_ID_2")
	private Document auditedProfitLossSheetDoc2;
	
	@ManyToOne
	@JoinColumn(name = "AUD_PROFIT_LOSS_DOC_ID_3")
	private Document auditedProfitLossSheetDoc3;
	
	
	@Column(name = "AUD_PROFIT_LOSS_DOC_YEAR_1")
	private String auditedProfitLossSheetYear1;
	
	@Column(name = "AUD_PROFIT_LOSS_DOC_YEAR_2")
	private String auditedProfitLossSheetYear2;
	
	@Column(name = "AUD_PROFIT_LOSS_DOC_YEAR_3")
	private String auditedProfitLossSheetYear3;
	
	@ManyToOne
	@JoinColumn(name = "CASH_FLOW_STMT_DOC_ID_1")
	private Document cashFlowStmtFileDoc1;
	
	@ManyToOne
	@JoinColumn(name = "CASH_FLOW_STMT_DOC_ID_2")
	private Document cashFlowStmtFileDoc2;
	
	
	@ManyToOne
	@JoinColumn(name = "CASH_FLOW_STMT_DOC_ID_3")
	private Document cashFlowStmtFileDoc3;
	
	@Column(name="CASH_FLOW_STM_YEAR_1")
	private String cashFlowStmtYear1;
	
	
	@Column(name="CASH_FLOW_STM_YEAR_2")
	private String cashFlowStmtYear2;
	
	@Column(name="CASH_FLOW_STM_YEAR_3")
	private String cashFlowStmtYear3;
	
	
	
	@ManyToOne
	@JoinColumn(name = "DIRECTOR_REPORT_DOC_ID_1")
	private Document directorReportDoc1;


	@ManyToOne
	@JoinColumn(name = "DIRECTOR_REPORT_DOC_ID_2")
	private Document directorReportDoc2;

	@ManyToOne
	@JoinColumn(name = "DIRECTOR_REPORT_DOC_ID_3")
	private Document directorReportDoc3;

	
	
	@Column(name = "DIRECTOR_REPORT_YEAR_1")
	private String directorReportYear1;


	@Column(name = "DIRECTOR_REPORT_YEAR_2")
	private String directorReportYear2;
	
	
	@Column(name = "DIRECTOR_REPORT_YEAR_3")
	private String directorReportYear3;
	

	
	@ManyToOne
	@JoinColumn(name = "AUD_REPORT_DOC_ID_1")
	private Document auditedReportDocId1;

	
	@ManyToOne
	@JoinColumn(name = "AUD_REPORT_DOC_ID_2")
	private Document auditedReportDocId2;

	@ManyToOne
	@JoinColumn(name = "AUD_REPORT_DOC_ID_3")
	private Document auditedReportDocId3;
	
	@Column(name="AUD_REPORT_YEAR_1")
	private String auditedReportYear1;
	
	@Column(name="AUD_REPORT_YEAR_2")
	private String auditedReportYear2;
	
	@Column(name="AUD_REPORT_YEAR_3")
	private String auditedReportYear3;
	

	

	@ManyToOne
	@JoinColumn(name = "PAN_CARD_DOC_ID")
	private Document panCardDoc;
	
	@ManyToOne
	@JoinColumn(name = "PHOTO_GRAPH_DOC_ID")
	private Document photoGraphDoc;
	
	@ManyToOne
	@JoinColumn(name = "COMMENCEMENT_CERT_DOC_ID")
	private Document commencementCertDoc;

	@ManyToOne
	@JoinColumn(name = "APPROVE_SANC_DOC_ID")
	private Document approveSacPlanDoc;

	@ManyToOne
	@JoinColumn(name = "APPROVE_LAYOUT_DOC_ID")
	private Document approveLayoutPlanDoc;

	@ManyToOne
	@JoinColumn(name = "AGRMNT_FILE_DOC_ID")
	private Document agreementFileDoc;

	@ManyToOne
	@JoinColumn(name = "LAND_LOC_FILE_PATH_DOC")
	private Document landLocationFileDoc;
	
	
	@ManyToOne
	@JoinColumn(name = "ENCUMBRANCE_CERTIFICATE_DOC_IF")
	private Document   encumbranceCertificateDoc;


	@ManyToOne
	@JoinColumn(name = "LAND_SANC_LAYOUT_DOC_ID")
	private Document sanctionedLayoutPlanDoc;

	@ManyToOne
	@JoinColumn(name = "AREA_DEV_PLAN_DOC_ID")
	private Document areaDevelopmentDoc;

	@ManyToOne
	@JoinColumn(name = "PERF_ALLOT_LTR_DOC_ID")
	private Document performaOfAllotmentLetterDoc;

	@ManyToOne
	@JoinColumn(name = "BROCH_CURR_PROJ_DOC_ID")
	private Document brochureOfCurrentProjectDoc;

	@ManyToOne
	@JoinColumn(name = "PROJ_REALATED_DOC_ID")
	private Document projectRelatedDoc;

	@ManyToOne
	@JoinColumn(name = "DECLR_FORM_B_DOC_ID")
	private Document declarationFormbDoc;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Document> otherDocumentSet;
	

	public Set<Document> getOtherDocumentSet() {
		return otherDocumentSet;
	}

	public void setOtherDocumentSet(Set<Document> otherDocumentSet) {
		this.otherDocumentSet = otherDocumentSet;
	}

	public Long getDocId() {
		return docId;
	}

	public void setDocId(Long docId) {
		this.docId = docId;
	}

	public Document getPanCardDoc() {
		return panCardDoc;
	}

	public void setPanCardDoc(Document panCardDoc) {
		this.panCardDoc = panCardDoc;
	}

	public Document getPhotoGraphDoc() {
		return photoGraphDoc;
	}

	public void setPhotoGraphDoc(Document photoGraphDoc) {
		this.photoGraphDoc = photoGraphDoc;
	}






	

	public Document getCommencementCertDoc() {
		return commencementCertDoc;
	}

	public void setCommencementCertDoc(Document commencementCertDoc) {
		this.commencementCertDoc = commencementCertDoc;
	}

	public Document getApproveSacPlanDoc() {
		return approveSacPlanDoc;
	}

	public void setApproveSacPlanDoc(Document approveSacPlanDoc) {
		this.approveSacPlanDoc = approveSacPlanDoc;
	}

	public Document getApproveLayoutPlanDoc() {
		return approveLayoutPlanDoc;
	}

	public void setApproveLayoutPlanDoc(Document approveLayoutPlanDoc) {
		this.approveLayoutPlanDoc = approveLayoutPlanDoc;
	}

	public Document getAgreementFileDoc() {
		return agreementFileDoc;
	}

	public void setAgreementFileDoc(Document agreementFileDoc) {
		this.agreementFileDoc = agreementFileDoc;
	}

	public Document getLandLocationFileDoc() {
		return landLocationFileDoc;
	}

	public void setLandLocationFileDoc(Document landLocationFileDoc) {
		this.landLocationFileDoc = landLocationFileDoc;
	}

	public Document getSanctionedLayoutPlanDoc() {
		return sanctionedLayoutPlanDoc;
	}

	public void setSanctionedLayoutPlanDoc(Document sanctionedLayoutPlanDoc) {
		this.sanctionedLayoutPlanDoc = sanctionedLayoutPlanDoc;
	}

	public Document getAreaDevelopmentDoc() {
		return areaDevelopmentDoc;
	}

	public void setAreaDevelopmentDoc(Document areaDevelopmentDoc) {
		this.areaDevelopmentDoc = areaDevelopmentDoc;
	}

	public Document getPerformaOfAllotmentLetterDoc() {
		return performaOfAllotmentLetterDoc;
	}

	public void setPerformaOfAllotmentLetterDoc(
			Document performaOfAllotmentLetterDoc) {
		this.performaOfAllotmentLetterDoc = performaOfAllotmentLetterDoc;
	}

	public Document getBrochureOfCurrentProjectDoc() {
		return brochureOfCurrentProjectDoc;
	}

	public void setBrochureOfCurrentProjectDoc(Document brochureOfCurrentProjectDoc) {
		this.brochureOfCurrentProjectDoc = brochureOfCurrentProjectDoc;
	}

	public Document getProjectRelatedDoc() {
		return projectRelatedDoc;
	}

	public void setProjectRelatedDoc(Document projectRelatedDoc) {
		this.projectRelatedDoc = projectRelatedDoc;
	}

	public Document getDeclarationFormbDoc() {
		return declarationFormbDoc;
	}

	public void setDeclarationFormbDoc(Document declarationFormbDoc) {
		this.declarationFormbDoc = declarationFormbDoc;
	}

	public Document getEncumbranceCertificateDoc() {
		return encumbranceCertificateDoc;
	}

	public void setEncumbranceCertificateDoc(Document encumbranceCertificateDoc) {
		this.encumbranceCertificateDoc = encumbranceCertificateDoc;
	}



}
