package in.gov.rera.transaction.projectregistration.service.impl;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.DateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.dao.IBlackListDao;
import in.gov.rera.transaction.projectregistration.dao.IDevelopmentDetailsDAO;
import in.gov.rera.transaction.projectregistration.dao.IPrevoiuProjectDao;
import in.gov.rera.transaction.projectregistration.dao.IProjectArchitectDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectContractorDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectMemberDao;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.dao.IStructuralEngneerDAO;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.PerviousProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDocModel;
import in.gov.rera.transaction.projectregistration.model.ProjectMemberDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service(value = "promoterRegistrationService")
@Scope("request")
public class ProjectRegistrationServiceImpl implements IProjectRegistrationService {

	@Autowired
	IDistrictDAO<DistrictModel ,Long> districtDAO;
	
	static Logger log = Logger.getLogger(ProjectRegistrationServiceImpl.class);
	
	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;
	
	@Autowired(required = true)
	IPrevoiuProjectDao<PerviousProjectDetailsModel, Long> preProjectDao;

	@Autowired
	IProjectContractorDAO<ProjectContratorDetailsModel, Long> projectContractorDao;
	@Autowired
	IProjectMemberDao<ProjectMemberDetailsModel, Long> projectMemberDao;
	@Autowired
	IStructuralEngneerDAO<StructuralEngineerDetailsModel, Long> structuralEngneerDAO;
	@Autowired
	IBlackListDao<ProjectMemberDetailsModel, Long> blackListDao;
	@Autowired
	IDevelopmentDetailsDAO<DevelopmentDetailsModel, Long> developmentDao;
	@Autowired
	IProjectArchitectDAO<ProjectArchitectDetailsModel, Long> projectArchitectDao;
	
	
	
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> promoterRegistrationDAO;

	@Override
	
	public Long createProjectRegistration(ProjectRegistrationModel enitity)
			throws Exception {
		return promoterRegistrationDAO.save(enitity);
	}

	@Override
	
	public ProjectRegistrationModel getProjectRegByPk(Long pk) throws Exception {
        return promoterRegistrationDAO.get(pk);
	}

	@Override
	
	public Long editProjectRegistration(ProjectRegistrationModel enitity)
			throws Exception {
		promoterRegistrationDAO.update(enitity);
		return enitity.getProjectRegId();
	}

	@Override
	
	public ProjectRegistrationModel saveOrUpdateProjectPhotoDoc(MultipartFile[] projectPhoto, MultipartFile[] otherFile,
			String[] fieldNameArr, ProjectRegistrationModel baseModel,
			Integer flg, Long proDocId) throws Exception {

		Document document = null;
		Long projectId = baseModel.getProjectRegId();
		ProjectDocModel projDoc = new ProjectDocModel();
		baseModel.setProjectDocModel(projDoc);
		for (int i = 0; i < otherFile.length; i++) {
			MultipartFile fileObj = otherFile[i];
			if (fileObj.getSize() > 0) {
				document = new Document();

				document.setInputStream(fileObj.getInputStream());
				document.setDocumentName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setFileName(fileObj.getOriginalFilename());
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(projectId));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				if (fieldNameArr[i].equalsIgnoreCase("panCardDoc")) {
										
					projDoc.setPanCardDoc(document);

				}
				//--auditedBalSheetDoc1
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc1")) {
						projDoc.setAuditedBalSheetYear1(String.valueOf(DateUtil.getYearBack(1)));
							projDoc.setAuditedBalSheetDoc1(document);
				}
				
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc2")) {
					projDoc.setAuditedBalSheetYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setAuditedBalSheetDoc2(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc3")) {
					projDoc.setAuditedBalSheetYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedBalSheetDoc3(document);
				}
				//auditedProfitLossSheetDoc1
				
				if (fieldNameArr[i]
						.equalsIgnoreCase("auditedProfitLossSheetDoc1")) {
					projDoc.setAuditedProfitLossSheetYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setAuditedProfitLossSheetDoc1(document);

				}
				if (fieldNameArr[i]
						.equalsIgnoreCase("auditedProfitLossSheetDoc2")) {
					projDoc.setAuditedProfitLossSheetDoc2(document);
					projDoc.setAuditedProfitLossSheetYear2(String.valueOf(DateUtil.getYearBack(2)));
					

				}if (fieldNameArr[i]
						.equalsIgnoreCase("auditedProfitLossSheetDoc3")) {
					projDoc.setAuditedProfitLossSheetYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedProfitLossSheetDoc3(document);

				}
				//-----CASH FLOW
				
				
				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc1")) {
					projDoc.setCashFlowStmtYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setCashFlowStmtFileDoc1(document);

				}
				
				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc2")) {
					projDoc.setCashFlowStmtYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setCashFlowStmtFileDoc2(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc3")) {
					projDoc.setCashFlowStmtYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setCashFlowStmtFileDoc3(document);

				}
				
				//--directorReportDoc
				
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc1")) {
					projDoc.setDirectorReportYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setDirectorReportDoc1(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc2")) {
					projDoc.setDirectorReportYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setDirectorReportDoc2(document);

				}if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc3")) {
					projDoc.setDirectorReportYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setDirectorReportDoc3(document);

				}
				//// AUDITED REPORT
				
				
				
				if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId1")) {
					projDoc.setAuditedReportYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setAuditedReportDocId1(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId2")) {
					projDoc.setAuditedReportYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setAuditedReportDocId2(document);

				}if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId3")) {
					projDoc.setAuditedReportYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedReportDocId3(document);

				}
				
				// END
				
				
				if (fieldNameArr[i].equalsIgnoreCase("encumbranceCertificateDoc")) {
					projDoc.setEncumbranceCertificateDoc(document);

				}
				
				if (fieldNameArr[i].equalsIgnoreCase("commencementCertDoc")) {
					projDoc.setCommencementCertDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("approveSacPlanDoc")) {
					projDoc.setApproveSacPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("approveLayoutPlanDoc")) {
					projDoc.setApproveLayoutPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("agreementFileDoc")) {
					projDoc.setAgreementFileDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("landLocationFileDoc")) {
					projDoc.setLandLocationFileDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("sanctionedLayoutPlanDoc")) {
					projDoc.setSanctionedLayoutPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("areaDevelopmentDoc")) {
									projDoc.setAreaDevelopmentDoc(document);

				}
				if (fieldNameArr[i]
						.equalsIgnoreCase("performaOfAllotmentLetterDoc")) {
					projDoc.setPerformaOfAllotmentLetterDoc(document);

				}
				
				if (fieldNameArr[i]
						.equalsIgnoreCase("performaForSaleOfAgreement")) {
					projDoc.setPerformaForSaleOfAgreement(document);

				}
				
				if (fieldNameArr[i].equalsIgnoreCase("brochureOfCurrentProjectDoc")) {
					projDoc.setBrochureOfCurrentProjectDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("projectRelatedDoc")) {
									projDoc.setProjectRelatedDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("declarationFormbDoc")) {
					projDoc.setDeclarationFormbDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("photoGraphDoc")) {
				    projDoc.setPhotoGraphDoc(document);

				}

			}

		}

			return saveProjectPhoto(projectPhoto, baseModel);

	}
	
	
	@Override
	
	public ProjectRegistrationModel updateProjectPhotoDoc(String[] photoId,MultipartFile[] projectPhoto, MultipartFile[] otherFile,
			String[] fieldNameArr, ProjectRegistrationModel baseModel) throws Exception {

		Document document = null;
		Long projectId = baseModel.getProjectRegId();
		ProjectDocModel projDoc = baseModel.getProjectDocModel();
		
		for (int i = 0; i < otherFile.length; i++) {
			MultipartFile fileObj = otherFile[i];
			if (fileObj.getSize() > 0) {
				document = new Document();

				document.setInputStream(fileObj.getInputStream());
				document.setDocumentName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setFileName(fileObj.getOriginalFilename());
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(projectId));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				if (fieldNameArr[i].equalsIgnoreCase("panCardDoc")) {
										
					projDoc.setPanCardDoc(document);

				}
				//--auditedBalSheetDoc1
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc1") && !fileObj.isEmpty()) {
							document=projDoc.getAuditedBalSheetDoc1();
							document.setFileName(fileObj.getOriginalFilename());
							document.setMimeType(fileObj.getContentType());
							document.setInputStream(fileObj.getInputStream());
							contentUtil.saveDocument(document);
							documentService.updateDoc(document);
							
				}else if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc2") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedBalSheetDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				}else if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc3")&& !fileObj.isEmpty()) {
					document=projDoc.getAuditedBalSheetDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				}else if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc1") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedProfitLossSheetDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc2") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedProfitLossSheetDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else	if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc3") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedProfitLossSheetDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}
				else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc1") && !fileObj.isEmpty()) {
					document=projDoc.getCashFlowStmtFileDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc2") && !fileObj.isEmpty()) {
					document=projDoc.getCashFlowStmtFileDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc3") && !fileObj.isEmpty()) {
					document=projDoc.getCashFlowStmtFileDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc1") && !fileObj.isEmpty()) {
					
					document=projDoc.getDirectorReportDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc2") && !fileObj.isEmpty()) {
					document=projDoc.getDirectorReportDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc3") && !fileObj.isEmpty()) {
					document=projDoc.getDirectorReportDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId1") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedReportDocId1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId2") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedReportDocId2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);


				}else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId3") && !fileObj.isEmpty()) {
					document=projDoc.getAuditedReportDocId3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("commencementCertDoc") && !fileObj.isEmpty()) {
					document=projDoc.getCommencementCertDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("approveSacPlanDoc") && !fileObj.isEmpty()) {
					document=projDoc.getApproveSacPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("approveLayoutPlanDoc") && !fileObj.isEmpty()) {
					document=projDoc.getApproveLayoutPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("agreementFileDoc") && !fileObj.isEmpty()) {
					document=projDoc.getAgreementFileDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("landLocationFileDoc") && !fileObj.isEmpty()) {
					document=projDoc.getLandLocationFileDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else if (fieldNameArr[i].equalsIgnoreCase("encumbranceCertificateDoc") && !fileObj.isEmpty()) {
					
					document=projDoc.getEncumbranceCertificateDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}
				
				else if (fieldNameArr[i].equalsIgnoreCase("sanctionedLayoutPlanDoc") && !fileObj.isEmpty()) {
					document=projDoc.getSanctionedLayoutPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
				if (fieldNameArr[i].equalsIgnoreCase("areaDevelopmentDoc") && !fileObj.isEmpty()) {
					document=projDoc.getAreaDevelopmentDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
				if (fieldNameArr[i]
						.equalsIgnoreCase("performaOfAllotmentLetterDoc") && !fileObj.isEmpty()) {
					document=projDoc.getPerformaOfAllotmentLetterDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
					if (fieldNameArr[i]
							.equalsIgnoreCase("performaForSaleOfAgreement") && !fileObj.isEmpty()) {
						document=projDoc.getPerformaForSaleOfAgreement();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);

					}else
				if (fieldNameArr[i]
						.equalsIgnoreCase("brochureOfCurrentProjectDoc") && !fileObj.isEmpty()) {
					document=projDoc.getBrochureOfCurrentProjectDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
				if (fieldNameArr[i].equalsIgnoreCase("projectRelatedDoc") && !fileObj.isEmpty()) {
					document=	projDoc.getProjectRelatedDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
				if (fieldNameArr[i].equalsIgnoreCase("declarationFormbDoc") && !fileObj.isEmpty()) {
					document=projDoc.getDeclarationFormbDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}else
				if (fieldNameArr[i].equalsIgnoreCase("photoGraphDoc") && !fileObj.isEmpty()) {
					document=  projDoc.getPhotoGraphDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}

			}

		}

			return saveProjectPhoto(projectPhoto,photoId, baseModel);

	}

	
	private ProjectRegistrationModel saveProjectPhoto(MultipartFile[] projectPhoto,ProjectRegistrationModel baseModel)
			throws Exception {
		Set<Document> projectPhotoDetailSet = new HashSet<Document>();
		if(projectPhoto!=null){
		for (int i = 0; i < projectPhoto.length; i++) {
			MultipartFile fileObj = projectPhoto[i];

			if (fileObj.getSize() > 0) {
				Document document = new Document();
				document.setInputStream(fileObj.getInputStream());
				document.setFileName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				
				projectPhotoDetailSet.add(document);
			}
		}

		}
		baseModel.setProjectPhotoDetailSet(projectPhotoDetailSet);
		return baseModel;
	}
	
	
	private ProjectRegistrationModel saveProjectPhoto(MultipartFile[] projectPhoto, String[] projectPhotoId,ProjectRegistrationModel baseModel)
			throws Exception {
		Document document = null;
		if(projectPhoto!=null){
		for (int i = 0; i < projectPhoto.length; i++) {
			MultipartFile fileObj = projectPhoto[i];
        if(!fileObj.isEmpty() &&  projectPhotoId!=null && projectPhotoId[i]!=null && projectPhotoId[i].trim().length()>0){
        	document=	documentService.getDoc(Integer.parseInt(projectPhotoId[i].trim()));
        	document.setFileName(fileObj.getOriginalFilename());
        	document.setInputStream(fileObj.getInputStream());
        	document.setMimeType(fileObj.getContentType());
        	contentUtil.saveDocument(document);
        	documentService.updateDoc(document);
        	
        }else if(!fileObj.isEmpty()){
        	if(baseModel.getProjectPhotoDetailSet()==null){
        		baseModel.setProjectPhotoDetailSet(new HashSet<Document>());
        	}
				 document = new Document();
				document.setInputStream(fileObj.getInputStream());
				document.setFileName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				
				baseModel.getProjectPhotoDetailSet().add(document);
			}
			
		}
		}
		return baseModel;
	}
	
	
	@Override
	
	public ProjectRegistrationModel saveUpdateMember(ProjectRegistrationModel model,HttpServletRequest request,MultipartFile[]memberPhotoFile){
		Set<ProjectMemberDetailsModel> set = new HashSet<ProjectMemberDetailsModel>();
		ProjectMemberDetailsModel memberModel=null;
		Document document = null;
		try{
		   String[]arr=	request.getParameterValues("memberName");
		   String[]ids=	request.getParameterValues("prjMemberChId");
		   
			for(int i=0;i<arr.length;i++){
				
				if(ids!=null && ids[i]!=null && ids[i].trim().length()>0){
					memberModel=	projectMemberDao.getProjectMemberById(Long.parseLong(ids[i]));
					if(!memberPhotoFile[i].isEmpty()){
					document=memberModel.getMomberPhotoDoc();
					document.setInputStream(memberPhotoFile[i].getInputStream());
					document.setFileName(memberPhotoFile[i].getOriginalFilename());
					document.setMimeType(memberPhotoFile[i].getContentType());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
					}
					
				}else{
					document = new Document();
					document.setInputStream(memberPhotoFile[i].getInputStream());
					document.setDocumentType("PROJECT_REG");
					document.setFileName(memberPhotoFile[i].getOriginalFilename());
					document.setMimeType(memberPhotoFile[i].getContentType());
					document.setFolderId(String.valueOf(model.getProjectRegId()));
					
					contentUtil.saveDocument(document);
					documentService.saveDoc(document);
					memberModel=new ProjectMemberDetailsModel();
					memberModel.setMomberPhotoDoc(document);
					memberModel.setProjectChairmanModel(model.getPromoterDetailsModel().getProjectChairmanModel());
					
				}
				
				 
				memberModel.setMemberName(arr[i]);
				memberModel.setMemberType(request.getParameterValues("memberType")[i]);
				memberModel.setEmailId(request.getParameterValues("memberEmailId")[i]);
				memberModel.setMobileNo(request.getParameterValues("memberMobileNo")[i]);
				memberModel.setAddressLine1(request.getParameterValues("memberAddressLine1")[i]);
				memberModel.setAddressLine2(request.getParameterValues("memberAddressLine2")[i]);
				memberModel.setPinCode(request.getParameterValues("memberPinCode")[i]);
				memberModel.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("memberDistrictId")[i])));
				
				set.add(memberModel);
			}
			model.getPromoterDetailsModel().getProjectChairmanModel().setMemberSet(set);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return model;
		
		
	}
	

	@Override
	public ProjectRegistrationModel saveProjectPayment(
			MultipartFile scanCopyMlt,
			ProjectRegistrationModel projectRegistrationModel) throws Exception {
		Document document = new Document();
		document.setInputStream(scanCopyMlt.getInputStream());
		document.setDocumentName(scanCopyMlt.getOriginalFilename());
		document.setDocumentType("PROJECT_REG");
		document.setFileName(scanCopyMlt.getOriginalFilename());
		document.setMimeType(scanCopyMlt.getContentType());
		document.setFolderId(String.valueOf(projectRegistrationModel.getProjectRegId()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);
		projectRegistrationModel.getPaymentDetailsModel().setScanCopyDoc(document);
		return projectRegistrationModel;
	}

	
	

	
	
	/*
	 * 
	 * 	 * projectAddress

stateUtId

pervProjDistrictId

projectAddrPinCode

isPaymentPending

isCasesPending
caseDetails
prevCompletionDate
prjDelayReason
pendingAmount
expectedCompletionDate
noOfMonthDelayed
completionDocId

typeOfLand
projectCurrentStatus

pervProjectDescription

pervProjectName
	 * */
	@Override
	public ProjectRegistrationModel saveOrUpdatePromoterCompany(ProjectRegistrationModel projectRegistrationModel,
			MultipartFile multipartFile,
			HttpServletRequest request,MultipartFile []completionDocId, MultipartFile []occupancyDocId)throws Exception {
		Set<PerviousProjectDetailsModel> pervRegSet = new HashSet<PerviousProjectDetailsModel>();
		
		try {
		
			
			String[] projextNameArr = request.getParameterValues("pervProjectName");
			String[] projextIdArr=	request.getParameterValues("pervProjectRegId");
			PerviousProjectDetailsModel perviousProjectDetailsModel=null;
			httpSession.setAttribute("projextNameArr", projextNameArr.length);
			if(projextNameArr!=null && projextNameArr.length>0){
			for (int i = 0; i < projextNameArr.length; i++) {
				if(projextNameArr[i]!=null){
			
				if(projextIdArr!=null && projextIdArr.length>i && projextIdArr[i]!=null 
						&& projextIdArr[i].trim().length()>0){
							perviousProjectDetailsModel=preProjectDao.getPerviousProjectDetailsModelById(Long.parseLong(projextIdArr[i]));
						}
						else{
							perviousProjectDetailsModel= new PerviousProjectDetailsModel();
						}
				perviousProjectDetailsModel.setProjectName(request.getParameterValues("pervProjectName")[i]);
				perviousProjectDetailsModel.setProjectDescription(request.getParameterValues("pervProjectDescription")[i]);
				perviousProjectDetailsModel.setProjectCurrentStatus(request.getParameterValues("projectCurrentStatus")[i]);
				
				Document document=null;
				Document document1=null;
				if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed")) 
						
					
				//if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !fileArr[i].isEmpty()){
					if (request.getParameterValues("completionDate") != null) {
						SimpleDateFormat sf=new SimpleDateFormat("dd/MM/yyyy");
					Date dt=new Date();
					dt=sf.parse(request.getParameterValues("completionDate")[i]);
						perviousProjectDetailsModel.setCompletionDate(dt);
					}					
					if(perviousProjectDetailsModel.getCompletionDocId()!=null ){
						  document=perviousProjectDetailsModel.getCompletionDocId();
						  document.setInputStream(completionDocId[i].getInputStream());
							
							document.setFileName(completionDocId[i].getOriginalFilename());
							document.setMimeType(completionDocId[i].getContentType());
							
							contentUtil.saveDocument(document);
							documentService.updateDoc(document);
						}
					else{
						document=new Document();
						document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
						document.setDocumentType("PROJECT_REG");
						document.setInputStream(completionDocId[i].getInputStream());
						document.setFileName(completionDocId[i].getOriginalFilename());
						document.setMimeType(completionDocId[i].getContentType());
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						
					}
					
					perviousProjectDetailsModel.setCompletionDocId(document);
												
					//else if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !occupancyDocId[i].isEmpty()){
					if(perviousProjectDetailsModel.getOccupancyDocId()!=null ){
						  document1=perviousProjectDetailsModel.getOccupancyDocId();
						  document1.setInputStream(occupancyDocId[i].getInputStream());
							
							document1.setFileName(occupancyDocId[i].getOriginalFilename());
							document1.setMimeType(occupancyDocId[i].getContentType());
							
							contentUtil.saveDocument(document1);
							documentService.updateDoc(document1);
						}
					else{
						document1=new Document();
						document1.setFolderId(projectRegistrationModel.getProjectRegId().toString());
						document1.setDocumentType("PROJECT_REG");
						document1.setInputStream(occupancyDocId[i].getInputStream());
						document1.setFileName(occupancyDocId[i].getOriginalFilename());
						document1.setMimeType(occupancyDocId[i].getContentType());
						contentUtil.saveDocument(document1);
						documentService.saveDoc(document1);
						
					}
					
					perviousProjectDetailsModel.setOccupancyDocId(document1);
					
				
				
						/*if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Delay")){
					if (request.getParameterValues("expectedCompletionDate") != null) {
						SimpleDateFormat sf=new SimpleDateFormat("dd/MM/yyyy");
					Date dt=new Date();//	sf.parse(request.getParameterValues("expectedCompletionDate")[i]);
						perviousProjectDetailsModel.setExpectedCompletionDate(dt);
					} 
				}*/
						if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Delay")){
							if (request.getParameterValues("noOfMonthDelayed") != null) {
								perviousProjectDetailsModel.setNoOfMonthDelayed(request
										.getParameterValues("noOfMonthDelayed")[i]);
							}
							
							
						}else{
							if (request.getParameterValues("expectedCompletionDate") != null) {
									Date dt = new Date();
								perviousProjectDetailsModel.setExpectedCompletionDate(dt);
							}
						}
						perviousProjectDetailsModel.setTypeOfLand(request.getParameterValues("typeOfLand")[i]);
						if(perviousProjectDetailsModel.getTypeOfLand().equalsIgnoreCase("Others")) 
						perviousProjectDetailsModel.setOthersOccupancy(request.getParameterValues("othersOccupancy")[i]);
						
						perviousProjectDetailsModel.setIsCasesPending(request.getParameterValues("isCasesPendingFld")[i]);
						if(perviousProjectDetailsModel.getIsCasesPending().equalsIgnoreCase("YES")) 
					// Changes done for RERA Bihar
							
							perviousProjectDetailsModel.setCaseNo(request.getParameterValues("caseNo")[i]);
							perviousProjectDetailsModel.setCaseDetails(request.getParameterValues("caseDetails")[i]);
							perviousProjectDetailsModel.setCaseStatus(request.getParameterValues("caseStatus")[i]);
					
				
					perviousProjectDetailsModel.setIsPaymentPending(request.getParameterValues("isPaymentPendingFld")[i]);
					if(perviousProjectDetailsModel.getIsPaymentPending().equalsIgnoreCase("YES"))
						perviousProjectDetailsModel.setPendingAmount(Double.parseDouble(request.getParameterValues("pendingAmount")[i]));
				
				//pervProjDistrictId
				perviousProjectDetailsModel.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("pervProjDistrictId")[i])));
                perviousProjectDetailsModel.setProjectAddress(request.getParameterValues("projectAddress")[i]);
				perviousProjectDetailsModel.setProjectAddrPinCode(request.getParameterValues("projectAddrPinCode")[i]);
				pervRegSet.add(perviousProjectDetailsModel);
			}
		}
	
			}
		} catch (Exception EX) {
			EX.printStackTrace();
		}
		projectRegistrationModel.setPreviousProjectDetailsSet(pervRegSet);
		return projectRegistrationModel;
	}

	
	
	@Override
	public ProjectRegistrationModel saveOrUpdateInvdPromoterDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request,
			MultipartFile[]fileArr,MultipartFile []occupancyDocId, MultipartFile promoterIndiPhoto) throws Exception {
		try {
			Document document = new Document();
			Document document1 = new Document();
			Set<PerviousProjectDetailsModel> pervRegSet = new HashSet<PerviousProjectDetailsModel>();
			String[] projextNameArr = request
					.getParameterValues("pervProjectName");
			PerviousProjectDetailsModel perviousProjectDetailsModel = null;
			String[] projextIdArr =request.getParameterValues("pervProjectRegId");
			
			if(projextNameArr!=null && projextNameArr.length>0){
			for (int i = 0; i < projextNameArr.length; i++) {
				if(projextNameArr[i]!=null){
				if (projextIdArr != null && projextIdArr.length>i  && projextIdArr[i]!=null && projextIdArr[i].trim().length()>0) {
					
					perviousProjectDetailsModel=preProjectDao.getPerviousProjectDetailsModelById(Long.parseLong(request
							.getParameterValues("pervProjectRegId")[i]));

				}
				else{
				
				perviousProjectDetailsModel = new PerviousProjectDetailsModel();
				}
				perviousProjectDetailsModel.setProjectName(projextNameArr[i]);
				perviousProjectDetailsModel.setProjectDescription(request.getParameterValues("pervProjectDescription")[i]);
				perviousProjectDetailsModel.setProjectCurrentStatus(request.getParameterValues("projectCurrentStatus")[i]);

//Old code goes here
///............................				
				if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed")) {
						
					
				//if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !fileArr[i].isEmpty()){
					if (request.getParameterValues("completionDate") != null) {
						//Date dt = Calendar.getInstance().getTime();	
						
						SimpleDateFormat sf=new SimpleDateFormat("dd/MM/yyyy");
					Date dt=new Date();
					dt=sf.parse(request.getParameterValues("completionDate")[i]);
						perviousProjectDetailsModel.setCompletionDate(dt);
					}
				
				
					if(perviousProjectDetailsModel.getCompletionDocId()!=null ){
						  document=perviousProjectDetailsModel.getCompletionDocId();
						  document.setInputStream(fileArr[i].getInputStream());
							
							document.setFileName(fileArr[i].getOriginalFilename());
							document.setMimeType(fileArr[i].getContentType());
							
							contentUtil.saveDocument(document);
							documentService.updateDoc(document);
						}
					else{
						document=new Document();
						document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
						document.setDocumentType("PROJECT_REG");
						document.setInputStream(fileArr[i].getInputStream());
						document.setFileName(fileArr[i].getOriginalFilename());
						document.setMimeType(fileArr[i].getContentType());
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						
					}
					
					perviousProjectDetailsModel.setCompletionDocId(document);
												
					//else if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !occupancyDocId[i].isEmpty()){
					if(perviousProjectDetailsModel.getOccupancyDocId()!=null ){
						  document1=perviousProjectDetailsModel.getOccupancyDocId();
						  document1.setInputStream(fileArr[i].getInputStream());
							
							document1.setFileName(fileArr[i].getOriginalFilename());
							document1.setMimeType(fileArr[i].getContentType());
							
							contentUtil.saveDocument(document1);
							documentService.updateDoc(document1);
						}
					else{
						document1=new Document();
						document1.setFolderId(projectRegistrationModel.getProjectRegId().toString());
						document1.setDocumentType("PROJECT_REG");
						document1.setInputStream(fileArr[i].getInputStream());
						document1.setFileName(fileArr[i].getOriginalFilename());
						document1.setMimeType(fileArr[i].getContentType());
						contentUtil.saveDocument(document1);
						documentService.saveDoc(document1);
						
					}
					
					perviousProjectDetailsModel.setOccupancyDocId(document1);
				
				//
/* New Code goes here				
					if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !fileArr[i].isEmpty()){
						if (request.getParameterValues("completionDate") != null) {
							Date dt = new Date();
						perviousProjectDetailsModel.setCompletionDate(dt);
					}
						//perviousProjectDetailsModel.setCompletionDate(request.getParameterValues("completionDate")[i]);
						
						else if(perviousProjectDetailsModel.getCompletionDocId()!=null ){
							  document=perviousProjectDetailsModel.getCompletionDocId();
							  document.setInputStream(fileArr[i].getInputStream());
								
								document.setFileName(fileArr[i].getOriginalFilename());
								document.setMimeType(fileArr[i].getContentType());
								
								contentUtil.saveDocument(document);
								documentService.updateDoc(document);
							}
						else{
							document=new Document();
							document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
							document.setDocumentType("PROJECT_REG");
							document.setInputStream(fileArr[i].getInputStream());
							document.setFileName(fileArr[i].getOriginalFilename());
							document.setMimeType(fileArr[i].getContentType());
							contentUtil.saveDocument(document);
							documentService.saveDoc(document);
						}
						
						perviousProjectDetailsModel.setCompletionDocId(document);
													
					} else if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed") && !occupancyDocId[i].isEmpty()){
						if(perviousProjectDetailsModel.getOccupancyDocId()!=null ){
							  document=perviousProjectDetailsModel.getOccupancyDocId();
							  document.setInputStream(fileArr[i].getInputStream());
								
								document.setFileName(fileArr[i].getOriginalFilename());
								document.setMimeType(fileArr[i].getContentType());
								
								contentUtil.saveDocument(document);
								documentService.updateDoc(document);
							}
						else{
							document=new Document();
							document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
							document.setDocumentType("PROJECT_REG");
							document.setInputStream(fileArr[i].getInputStream());
							document.setFileName(fileArr[i].getOriginalFilename());
							document.setMimeType(fileArr[i].getContentType());
							contentUtil.saveDocument(document);
							documentService.saveDoc(document);
						}
						
						
						perviousProjectDetailsModel.setOccupancyDocId(document);*/
													
					}else if(request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Delay")){
						if (request.getParameterValues("noOfMonthDelayed") != null) {
							perviousProjectDetailsModel.setNoOfMonthDelayed(request
									.getParameterValues("noOfMonthDelayed")[i]);
						}
						
						
					}else{
						if (request.getParameterValues("expectedCompletionDate") != null) {
								Date dt = new Date();
							perviousProjectDetailsModel.setExpectedCompletionDate(dt);
						}
					}
					perviousProjectDetailsModel.setTypeOfLand(request.getParameterValues("typeOfLand")[i]);
					if(perviousProjectDetailsModel.getTypeOfLand().equalsIgnoreCase("Others")) 
					perviousProjectDetailsModel.setOthersOccupancy(request.getParameterValues("othersOccupancy")[i]);
					
					perviousProjectDetailsModel.setIsCasesPending(request.getParameterValues("isCasesPendingFld")[i]);
					if(perviousProjectDetailsModel.getIsCasesPending().equalsIgnoreCase("YES")) 
				// Changes done for RERA Bihar
						
						perviousProjectDetailsModel.setCaseNo(request.getParameterValues("caseNo")[i]);
						perviousProjectDetailsModel.setCaseDetails(request.getParameterValues("caseDetails")[i]);
						perviousProjectDetailsModel.setCaseStatus(request.getParameterValues("caseStatus")[i]);
					
				//	
					perviousProjectDetailsModel.setIsPaymentPending(request.getParameterValues("isPaymentPendingFld")[i]);
					
					if(perviousProjectDetailsModel.getIsPaymentPending().equalsIgnoreCase("YES"))
					perviousProjectDetailsModel.setPendingAmount(Double.parseDouble(request.getParameterValues("pendingAmount")[i]));
				perviousProjectDetailsModel.setProjectAddress(request
						.getParameterValues("projectAddress")[i]);
				perviousProjectDetailsModel.setProjectAddrPinCode(request
						.getParameterValues("projectAddrPinCode")[i]);
				if((request.getParameterValues("pervProjDistrictId")[i]!=null)){
					perviousProjectDetailsModel.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("pervProjDistrictId")[i])));
				}
				pervRegSet.add(perviousProjectDetailsModel);
			}
		}
		}
			if(!promoterIndiPhoto.isEmpty() && promoterIndiPhoto.getSize()>10){
				if(projectRegistrationModel.getPromoterDetailsModel().getIndividualPhotoGraphPath()!=null){
					document=projectRegistrationModel.getPromoterDetailsModel().getIndividualPhotoGraphPath();
					document.setInputStream(promoterIndiPhoto.getInputStream());
					document.setFileName(promoterIndiPhoto.getOriginalFilename());
					document.setMimeType(promoterIndiPhoto.getContentType());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
					
				}else{
					 document = new Document();
						document.setInputStream(promoterIndiPhoto.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFileName(promoterIndiPhoto.getOriginalFilename());
						document.setMimeType(promoterIndiPhoto.getContentType());
						document.setFolderId(String.valueOf(projectRegistrationModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						projectRegistrationModel.getPromoterDetailsModel().setIndividualPhotoGraphPath(document);
				}
					
				}
			projectRegistrationModel.setPreviousProjectDetailsSet(pervRegSet);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			
			throw ex;
		}
		return projectRegistrationModel;
	}

	
	@Override
	
	public ProjectRegistrationModel saveOrUpdateChairManPhotograph(ProjectRegistrationModel projectId,MultipartFile multipartFile) throws Exception {
		Document document=null;
		if(projectId.getPromoterDetailsModel()!=null && projectId.getPromoterDetailsModel().getProjectChairmanModel()!=null &&
				projectId.getPromoterDetailsModel().getProjectChairmanModel().getDocument()!=null	){
			 document = 	projectId.getPromoterDetailsModel().getProjectChairmanModel().getDocument();
			 document.setInputStream(multipartFile.getInputStream());
			 document.setFileName(multipartFile.getOriginalFilename());
			 document.setMimeType(multipartFile.getContentType());
			 contentUtil.saveDocument(document);
			 documentService.updateDoc(document);
		}
		else{
			 document = new Document();
			 document.setDocumentType("PROJECT_REG");
			 document.setFolderId(String.valueOf(String.valueOf(projectId.getProjectRegId())));
			 document.setInputStream(multipartFile.getInputStream());
			 document.setFileName(multipartFile.getOriginalFilename());
			 document.setMimeType(multipartFile.getContentType());
			 contentUtil.saveDocument(document);
			 documentService.saveDoc(document);
		}
		
		projectId.getPromoterDetailsModel().getProjectChairmanModel().setDocument(document);
		return projectId;
	}

	@Override

	public ProjectRegistrationModel saveOrUpdateRegistrationCertificate(
			ProjectRegistrationModel projectId, MultipartFile multipartFile)
			throws Exception {
		Document document = null;
		if(projectId.getPromoterDetailsModel()!=null &&
				projectId.getPromoterDetailsModel().getDocument()!=null && !multipartFile.isEmpty()){
			document= projectId.getPromoterDetailsModel().getDocument();
			document.setInputStream(multipartFile.getInputStream());
			document.setMimeType(multipartFile.getContentType());
			document.setFileName(multipartFile.getOriginalFilename());
			contentUtil.saveDocument(document);
			documentService.updateDoc(document);
			
		}else if(!multipartFile.isEmpty()){
			document=new Document();
			document.setInputStream(multipartFile.getInputStream());
			document.setDocumentType("PROJECT_REG");
			document.setMimeType(multipartFile.getContentType());
			document.setFileName(multipartFile.getOriginalFilename());
			document.setFolderId(String.valueOf(String.valueOf(projectId.getProjectRegId())));
			contentUtil.saveDocument(document);
			documentService.saveDoc(document);
			
		}
		
		
		
		
		
		projectId.getPromoterDetailsModel().setDocument(document);

		return projectId;
	}



	@Override
	public Long mergeProjectRegistration(ProjectRegistrationModel enitity)
			throws Exception {
		
		return promoterRegistrationDAO.merge(enitity).getProjectRegId();
	}

	@Override
	public Long saveUpdateProjectRegistration(ProjectRegistrationModel enitity)
			throws Exception {
		promoterRegistrationDAO.saveOrUpdate(enitity);
		return enitity.getProjectRegId();
	}

	@Override
	public Session getSessiion() throws Exception {
		return promoterRegistrationDAO.getSessionObj();
	}

	@Override
	public AgentRegistrationModel getAgentByRegNo(String agentRegNo) {
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("agentRegistrationNo",agentRegNo));
		List<AgentRegistrationModel> list= agentRegistrationDAO.getAgentList(dt);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public ProjectRegistrationModel geSavedtProjectRegByEmailId(String emailId)
			throws Exception {
		DetachedCriteria dt=DetachedCriteria.forClass(ProjectRegistrationModel.class,"obj");
		dt.add(Restrictions.eq("obj.status", ReraConstants.SAVE_AS_DRAFT));
		//status
		dt.createAlias("obj.promoterDetailsModel", "promotor");
		dt.add(Restrictions.eq("promotor.emailId", emailId));
		List<ProjectRegistrationModel> list=	promoterRegistrationDAO.getProjectList(dt);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel,Long> agentRegistrationDAO;
	
	@Autowired
	CommonDao<Object, Long> dao;
}
