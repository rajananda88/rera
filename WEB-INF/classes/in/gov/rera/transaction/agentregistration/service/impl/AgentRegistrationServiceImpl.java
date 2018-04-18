package in.gov.rera.transaction.agentregistration.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.RegPaymentDetailsModel;
import in.gov.rera.transaction.agentregistration.model.RegUploadDetailsModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;


@Service(value="agentRegistrationService")
@Scope("request")
public class AgentRegistrationServiceImpl <E ,PK> implements IAgentRegistrationService<AgentRegistrationModel,Long>{

	
	@Autowired
	ContentUtil contentUtil;

	@Autowired(required=true)
	IDocumentService<Document,Integer> documentService;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel,Long> agentRegistrationDAO;
		
	

	@Override
	public Long createAgentRegistration(AgentRegistrationModel enitity) {
		return agentRegistrationDAO.save(enitity);
	}

	@Override
	@Transactional(readOnly=true)
	public AgentRegistrationModel getAgentRegByPk(Long pk) throws Exception {
		
		return agentRegistrationDAO.get(pk);
	}

	@Override
	public Long editAgentRegistration(AgentRegistrationModel enitity) {
		agentRegistrationDAO.update(enitity);
		return enitity.getAgentDetailsModel().getAgentRegDetailID();
	}

	@Override
	public AgentRegistrationModel saveOrUpdateAgentPhotoDoc(MultipartFile panCard,MultipartFile addressProof,
			AgentRegistrationModel agentBaseModel) throws Exception {
		
		
		  Long agentId= agentBaseModel.getAgentRegistrationID();
		  RegUploadDetailsModel  agentDoc = new RegUploadDetailsModel();
			  
				 
				  
				  Document document = new Document();
					document.setInputStream(panCard.getInputStream());
					document.setDocumentType("AGENT_REG");
					document.setFileName(panCard.getOriginalFilename());
					document.setMimeType(panCard.getContentType());
					document.setFolderId(String.valueOf(agentBaseModel.getAgentRegistrationID()));
					contentUtil.saveDocument(document);
					documentService.saveDoc(document);
					
					 agentDoc.setPanCardPath(document);
					 
					 document = new Document();
						document.setInputStream(addressProof.getInputStream());
						document.setDocumentType("AGENT_REG");
						document.setFileName(addressProof.getOriginalFilename());
						document.setMimeType(addressProof.getContentType());
						document.setFolderId(String.valueOf(agentBaseModel.getAgentRegistrationID()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						 agentDoc.setAddressProofPath(document);
						 
							
				
				
		
		
		  agentBaseModel.getAgentDetailsModel().setRegUploadDetailsModel(agentDoc);
		  
		return agentBaseModel;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public AgentRegistrationModel saveAgentPayment(MultipartFile agentPayScanCopy, AgentRegistrationModel agentRegistrationModel) throws Exception {
		
		  
		  Document document = new Document();
			document.setInputStream(agentPayScanCopy.getInputStream());
			document.setDocumentType("AGENT_REG");
			document.setFileName(agentPayScanCopy.getOriginalFilename());
			document.setMimeType(agentPayScanCopy.getContentType());
			document.setFolderId(String.valueOf(agentRegistrationModel.getAgentRegistrationID()));
			contentUtil.saveDocument(document);
			documentService.saveDoc(document);
		  
		  agentRegistrationModel.getAgentDetailsModel().getRegPaymentDetailsModel().setAttachScanCopy(document);
		 
		  
		  return agentRegistrationModel;
		
	}

	@Override
	public AgentRegistrationModel saveOrUpdateAgentDoc(AgentRegistrationModel baseObj, MultipartFile panCard,
		 MultipartFile addProof) throws Exception {
		
		 Document parnCardDocId= baseObj.getAgentDetailsModel().getRegUploadDetailsModel().getPanCardPath();
		
		 Document addressProofId= baseObj.getAgentDetailsModel().getRegUploadDetailsModel().getAddressProofPath();
		if(panCard!=null){
		 parnCardDocId.setMimeType(panCard.getContentType());
		 parnCardDocId.setInputStream(panCard.getInputStream());
		 parnCardDocId.setFileName(panCard.getOriginalFilename());
		  contentUtil.saveDocument(parnCardDocId);
		 	}
		  
			 
	if(addProof!=null){		  
			  
		  addressProofId.setMimeType(addProof.getContentType());
		  addressProofId.setInputStream(addProof.getInputStream());
		  addressProofId.setFileName(addProof.getOriginalFilename());
		  contentUtil.saveDocument(addressProofId);
	}
		  
		  		 
		return baseObj;
	}

	@Override
	public AgentRegistrationModel getSavedAgentByEmailId(String emailId) {
		
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class,"obj");
		
		dt.add(Restrictions.eq("obj.status", ReraConstants.SAVE_AS_DRAFT));
		dt.createAlias("obj.agentDetailsModel", "agentDetailsModel");
		dt.add(Restrictions.or( Restrictions.eq("agentDetailsModel.agentEmailId", emailId),Restrictions.eq("agentDetailsModel.firmEmail", emailId)));
		
	List<AgentRegistrationModel> list=	agentRegistrationDAO.getAgentList(dt);
	if(list!=null && list.size()>0){
		return list.get(0);
	}else{
		return null;
	}
	}

	@Override
	public Document saveDocument(MultipartFile file,AgentRegistrationModel baseObj)throws Exception {
		  Document document = new Document();
			document.setInputStream(file.getInputStream());
			document.setDocumentType("AGENT_REG");
			document.setFileName(file.getOriginalFilename());
			document.setMimeType(file.getContentType());
			document.setFolderId(String.valueOf(baseObj.getAgentRegistrationID()));
			contentUtil.saveDocument(document);
			documentService.saveDoc(document);
		
		return document;
	}
	@Override
	public Document updateDocument(MultipartFile file,Document baseObj)throws Exception {
		
		baseObj.setInputStream(file.getInputStream());
		baseObj.setFileName(file.getOriginalFilename());
		baseObj.setMimeType(file.getContentType());
		contentUtil.saveDocument(baseObj);
			documentService.updateDoc(baseObj);
		
		return baseObj;
	}

	@Override
	public AgentRegistrationModel getAgentByPanNo(String panNo)
			throws Exception {
DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class,"obj");
		
		dt.add(Restrictions.ne("obj.status", ReraConstants.REJECTED));
		dt.createAlias("obj.agentDetailsModel", "agentDetailsModel");
		dt.add(Restrictions.eq("agentDetailsModel.agentPanNo", panNo));
		
	List<AgentRegistrationModel> list=	agentRegistrationDAO.getAgentList(dt);
	if(list!=null && list.size()>0){
		return list.get(0);
	}else{
		return null;
	}	
	}
	
	
	
	
}