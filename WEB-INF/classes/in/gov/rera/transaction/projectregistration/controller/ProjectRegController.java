package in.gov.rera.transaction.projectregistration.controller;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.ProjectFeeCalculator;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.master.subdistrict.dao.ISubDistrictDAO;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.dao.IProjectArchitectDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectContractorDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.dao.IStructuralEngneerDAO;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ExtOtherDevModel;
import in.gov.rera.transaction.projectregistration.model.ExternalDevelopmentWorkModel;
import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.PromoterBlacklistDetailsModel;
import in.gov.rera.transaction.projectregistration.model.PromoterDetailsModel;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import java.util.Calendar;
import java.util.HashSet;
import java.util.ListIterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import antlr.collections.List;

@Controller(value = "ProjectRegController")
@Scope("request")

public class ProjectRegController {
	static Logger log = Logger.getLogger(ProjectRegController.class);
	
	@Autowired
	HttpSession httpSession;
	@Autowired
	IDistrictDAO<DistrictModel ,Long> districtDAO;
	
	@Autowired
	ISubDistrictDAO<SubDistrictModel ,Long> subDistrictDAO;
	
	@Autowired
	IStateUtService<StateUtModel, Long>stateUtService;
	
	@Autowired
	IBankService<BankModel ,Long> bankService;
	@Autowired
	IProjectRegistrationDAO<BankModel ,Long>pRegistrationDAO;
	
	@Autowired
	ContentUtil contentUtil;
	
	@Autowired
	MailService mailService;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	
	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long>agentRegistrationService;
	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long>agentRegistrationDAO;
	
	@Autowired
	IProjectRegistrationService projectRegistrationService;
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@RequestMapping(value = "initProjectRegistration", method = RequestMethod.GET)
	public ModelAndView initProjectRegistration(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel) {
		ModelAndView mv = null;
		try {
			mv = new ModelAndView("projectRegistration");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "invOrComProjectRegForm", method = RequestMethod.POST)
	public ModelAndView redirectNextProjectForm(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			
					String str=	request.getParameter("emailId");
		ProjectRegistrationModel savedObj=projectRegistrationService.geSavedtProjectRegByEmailId(str);
		if(savedObj!=null){
			if(savedObj.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)){
				mv = new ModelAndView("redirect:/editRegInvForm");
				
			}else{
				mv = new ModelAndView("redirect:/editPromoterComDels");
				
			}
			httpSession.setAttribute("pkid", savedObj.getProjectRegId());
		}
		else{
			mv = new ModelAndView(request.getParameter("nextForm"));
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			httpSession.setAttribute("emailId", request.getParameter("emailId"));
		}
		

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "saveInvdPromoterDetails", method = RequestMethod.POST)
	public ModelAndView saveInvdPromoterDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,
			@RequestParam (value="completionDocId",required=false)MultipartFile[]completionDocId,
			@RequestParam (value="occupancyDocId",required=false)MultipartFile[]occupancyDocId,
			@RequestParam("individualPhotoGraphPath") MultipartFile promoterIndiPhoto) {
		ModelAndView mv = null;
		
			Long pkid=null;	
			try{
				projectRegistrationModel.setRegistrationType(ReraConstants.INDVISUAL_REG);
				projectRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
				projectRegistrationModel.setCreatedOn(Calendar.getInstance());
				
				projectRegistrationModel.getPromoterDetailsModel().setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
				pkid=projectRegistrationService.createProjectRegistration(projectRegistrationModel);
				projectRegistrationModel=projectRegistrationService.saveOrUpdateInvdPromoterDetails(projectRegistrationModel, request,completionDocId,occupancyDocId,promoterIndiPhoto);
				
				projectRegistrationService.editProjectRegistration(projectRegistrationModel);
			     
			     httpSession.setAttribute("pkid",pkid);
			
			 
			mv = new ModelAndView("redirect:/addProjectDetailsForm");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;	}
	

	/*
	 * Save promoter company details
	 * 
	 * 
	 * 

	 * 
	 * 
	 */
	
	@RequestMapping(value = "saveCompanyPromoterDetails", method = RequestMethod.POST)
	public ModelAndView saveCompanyPromoterDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
		 HttpServletRequest request,
		 @RequestParam("regCertificateFile") MultipartFile regCertificateFile,
		 @RequestParam("chairManPhoto") MultipartFile chairManPhoto,
		 @RequestParam("memberPhotoFile")MultipartFile []memberPhotoFile,
		 @RequestParam(value="completionDocId",required=false)MultipartFile[] completionDocId,
		 @RequestParam(value="occupancyDocId",required=false)MultipartFile[] occupancyDocId) throws Exception{
		ModelAndView mv = null;
		
			try{
				projectRegistrationModel.setRegistrationType(ReraConstants.FIRM_COMP_REG);
				projectRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
				projectRegistrationModel.setCreatedOn(Calendar.getInstance());
				projectRegistrationModel.getPromoterDetailsModel().setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
				projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("chairManDistrictId"))));
				
				projectRegistrationService.createProjectRegistration(projectRegistrationModel);
				
				projectRegistrationModel=projectRegistrationService.saveOrUpdatePromoterCompany(projectRegistrationModel, regCertificateFile, request,completionDocId,occupancyDocId);
				//throw new Exception();
				
				httpSession.setAttribute("pkid",projectRegistrationModel.getProjectRegId());
			    projectRegistrationModel.getPromoterDetailsModel().setPromoterBlackSet(getBalacklistPromoterSet(projectRegistrationModel.getPromoterDetailsModel(),request));
			    projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateChairManPhotograph(projectRegistrationModel, chairManPhoto));
			    projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateRegistrationCertificate(projectRegistrationModel, regCertificateFile));
				projectRegistrationService.saveUpdateMember(projectRegistrationModel, request, memberPhotoFile);
				projectRegistrationService.editProjectRegistration(projectRegistrationModel);
			
			  mv = new ModelAndView("redirect:/addProjectDetailsForm");

		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
		return mv;	
		}
	

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "addProjectDetailsForm")
	public ModelAndView addProjectDetailsForm() {
		ModelAndView mv = null;
		
			try{
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
			mv = new ModelAndView("projectDetailsForm");
			mv.addObject("projectRegistrationModel", bsModel);
		//	ReraConstants
			 mv.addObject("stateUtList", stateUtService.getStateUtList());
			 mv.addObject("bankList", bankService.getBankList());
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return mv;	}
	
	
	
	@RequestMapping(value = "saveProjectDetails", method = RequestMethod.POST)
	public ModelAndView saveProjectDetails(	@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("bankDistrictId") Long districtId,
			@RequestParam("projectDistrictId") Long projectDistrictId,
			@RequestParam("subDistrictId") Long subDistrictId
			) {
		ModelAndView mv = null;
		try {
			
			
			ProjectRegistrationModel savedProj=projectRegistrationService.getProjectRegByPk(projectRegistrationModel.getProjectRegId());
			
			savedProj.setProjectDetailsModel(projectRegistrationModel.getProjectDetailsModel());
			
			
			projectRegistrationModel.getProjectBankDetailsModel().setBankModel(bankService.getBankById(Long.parseLong(request.getParameter("projectBankId"))));
			ExternalDevelopmentWorkModel extDev= projectRegistrationModel.getExternalDevelopmentWorkModel();
			extDev.setExtOtherDevSet(getExtOtherDevSet(request,extDev));
			savedProj.setExternalDevelopmentWorkModel(extDev);
			projectRegistrationModel.getProjectBankDetailsModel().setDistrictModel(districtDAO.getDistirctById(districtId));
			savedProj.setProjectBankDetailsModel(projectRegistrationModel.getProjectBankDetailsModel());
			savedProj.setDevelopmentDetailSet(getDevelopmentDetailSet(request,savedProj));
			savedProj.getProjectDetailsModel().setDistrictModel(districtDAO.getDistirctById(projectDistrictId));
            savedProj.getProjectDetailsModel().setSubDistrictModel(subDistrictDAO.getSubDistirctById(subDistrictId));
			
            savedProj.setProjectAgentDetailSet(saveOrUdateAgent(request,savedProj));
		
			Set<ProjectArchitectDetailsModel> arcSet=getProjectArchitectSet(request,savedProj);
			if(arcSet.size()>0){
				savedProj.setProjectArchitectDetailSet(arcSet);
			}
			if(getStructuralEngineerSet(request,savedProj).size()>0){
				savedProj.setStructuralEngineerDetailSet(getStructuralEngineerSet(request,savedProj));
			}
			if(getProjectContratorSet(request,savedProj).size()>0){
				savedProj.setProjectContratorDetailSet(getProjectContratorSet(request,savedProj));
			}
	        projectRegistrationService.editProjectRegistration(savedProj);
			
			
		
			mv = new ModelAndView("redirect:/uploadProjectDocsForm");

		
		} catch (Exception ex) {
			ex.printStackTrace();
			
		}
		
		return mv;
	}
	

	
	/*
	 * Save promoter individual details
	 */
	@RequestMapping(value = "uploadProjectDocsForm")
	public ModelAndView uploadProjectDocs() {
		ModelAndView mv = null;
		
			try{
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
			mv = new ModelAndView("docUploadFrom");
			mv.addObject("projectRegistrationModel", bsModel);
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return mv;
		
	}
	
	
	@RequestMapping(value = "saveUploadProjectDoc", method = RequestMethod.POST)
	public ModelAndView saveUploadProjectDoc(@RequestParam(value="projectPhotoFile",required=false) MultipartFile[] projectPhotoFile,
			@RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
			@RequestParam("fieldName") String[]fieldNameArr,
			HttpServletRequest request){
		ModelAndView mv = null;
		try{
			ProjectRegistrationModel baseModel=projectRegistrationService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			ProjectRegistrationModel savedProject=projectRegistrationService.saveOrUpdateProjectPhotoDoc(projectPhotoFile, otherFileDoc,fieldNameArr,baseModel,Integer.parseInt(request.getParameter("flg")),Long.parseLong(request.getParameter("projectDocModel.docId")));
			projectRegistrationService.editProjectRegistration(savedProject);
			mv = new ModelAndView("redirect:/projectRegpaymentForm");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	
	
	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "projectRegpaymentForm")
	public ModelAndView projectRegpaymentForm() {
		ModelAndView mv = null;
		
			try{
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
		int regFee=ProjectFeeCalculator.getProjectRegFee(bsModel.getProjectDetailsModel());
			mv = new ModelAndView("projectPayment");
			mv.addObject("RegistrationFee", regFee);
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("stateUtList", stateUtService.getStateUtList());
		
			mv.addObject("pervProjectSet", bsModel.getPreviousProjectDetailsSet());
			
		//	projectRegistrationModel.setRegistrationType(ReraConstants.FIRM_COMP_REG);
			if(bsModel.getRegistrationType().equalsIgnoreCase(ReraConstants.FIRM_COMP_REG)){
			mv.addObject("projectMemberSet", bsModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet());
			mv.addObject("promoterBlackListSet", bsModel.getPromoterDetailsModel().getPromoterBlackSet());
			}
			mv.addObject("bankList", bankService.getBankList());
			
			if(bsModel.getProjectAgentDetailSet()==null || bsModel.getProjectAgentDetailSet().size()==0){
				mv.addObject("agentStatus", "NO");
			}else{
				mv.addObject("agentStatus", "YES");
			mv.addObject("agentSet", bsModel.getProjectAgentDetailSet());
			}
			mv.addObject("developmentSet", bsModel.getDevelopmentDetailSet());
			mv.addObject("architectSet", bsModel.getProjectArchitectDetailSet());
			mv.addObject("stcEngSet", bsModel.getStructuralEngineerDetailSet());
			mv.addObject("projContratorSet", bsModel.getProjectContratorDetailSet());
			mv.addObject("extOtherDevSet", bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet());
			
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return mv;
		
	}

	
	@RequestMapping(value = "saveProjectPayment", method = RequestMethod.POST)
	public ModelAndView saveProjectPayment(@RequestParam ("scanCopyDoc")MultipartFile scanCopyDoc,
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request){
		ModelAndView mv = null;
		
		try{
			
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
			bsModel.setPaymentDetailsModel(projectRegistrationModel.getPaymentDetailsModel());
			ProjectRegistrationModel savedProject=projectRegistrationService.saveProjectPayment(scanCopyDoc, bsModel);
			savedProject.setStatus(ReraConstants.PENDING_OPRATOR);
			projectRegistrationService.editProjectRegistration(savedProject);
			mv = new ModelAndView("redirect:/projectRegConfirmationPage");
			mailService.sendprojectRegConfirmation(savedProject);
		 
		}catch(Exception ex){
				ex.printStackTrace();
			}
		return mv;
		}
	
	

	/*
	 * Save promoter individual details
	 */
	@RequestMapping(value = "projectRegConfirmationPage")
	public ModelAndView projectRegConfirmationPage() {
		ModelAndView mv = null;
		
			try{
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
			mv = new ModelAndView("projectConfirmation");
			mv.addObject("projectRegistrationModel", bsModel);
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return mv;
		
	}
	
	
	/*
	 * Previous Individual Promoter
	 */
	@RequestMapping(value = "editRegInvForm")
	public ModelAndView pervInvdPromoterForm(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel, 
			 HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			projectRegistrationModel=projectRegistrationService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("editRegInvForm");
			mv.addObject("projectRegistrationModel", projectRegistrationModel);
			 
			if( projectRegistrationModel.getPreviousProjectDetailsSet()!=null &&  projectRegistrationModel.getPreviousProjectDetailsSet().size()>0){
				mv.addObject("pervProjectSet", projectRegistrationModel.getPreviousProjectDetailsSet());
				mv.addObject("pervProjectSetFlag", "YES");
			}
			else{
				mv.addObject("pervProjectSetFlag", "NO");
			}
			
			
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			
			
		} catch (Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	
		
	
	/*
	 * Save promoter individual details
	 */
	@RequestMapping(value = "updateInvdPromoterDetails", method = RequestMethod.POST)
	public ModelAndView updateInvdPromoterDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			 HttpServletRequest request,@RequestParam (value="completionDocId",required=false)MultipartFile[]completionDocId,
			 @RequestParam (value="occupancyDocId",required=false)MultipartFile[]occupancyDocId,
			 @RequestParam("individualPhotoGraphPath") MultipartFile promoterIndiPhoto) throws Exception{
		ModelAndView mv = null;
		
			Long pkid=null;	
			try{
				
				
				ProjectRegistrationModel baseObject=projectRegistrationService.getProjectRegByPk(projectRegistrationModel.getProjectRegId());
				baseObject.setPromoterDetailsModel(projectRegistrationModel.getPromoterDetailsModel());
				baseObject.getPromoterDetailsModel().setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
				
				baseObject=projectRegistrationService.saveOrUpdateInvdPromoterDetails(baseObject, request,completionDocId,occupancyDocId,promoterIndiPhoto);
				pkid=	projectRegistrationService.saveUpdateProjectRegistration(baseObject);
				httpSession.setAttribute("pkid",pkid);
			
			    if(baseObject.getProjectDetailsModel()!=null){
			    	mv = new ModelAndView("redirect:/editProjectDetailsForm");
				
				}else{
					mv = new ModelAndView("redirect:/addProjectDetailsForm");
				
			   }
			
		
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
		return mv;	}
	
	  @RequestMapping(value="editPromoterComDels")
		public ModelAndView editPromoterComDels(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
				 HttpServletRequest request){
	    	ModelAndView mv= null;
	    	try{
	    		mv = new ModelAndView("editProjectRegComForm");
	    		mv.addObject("stateUtList", stateUtService.getStateUtList());
				projectRegistrationModel=projectRegistrationService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
				mv.addObject("projectRegistrationModel", projectRegistrationModel);
				
				if(projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet()!=null &&
						projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet().size()>0){
					mv.addObject("projectMemberSet", projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet());
					mv.addObject("projectMemberSetFlag","YES");
				}
				else{
					mv.addObject("projectMemberSetFlag","NO");
				}
				
				if( projectRegistrationModel.getPreviousProjectDetailsSet()!=null &&  projectRegistrationModel.getPreviousProjectDetailsSet().size()>0){
					mv.addObject("pervProjectSet", projectRegistrationModel.getPreviousProjectDetailsSet());
					mv.addObject("pervProjectSetFlag", "YES");
				}
				else{
					mv.addObject("pervProjectSetFlag", "NO");
				}
				
				if(projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet()!=null && 
						projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet().size()>0){
					
					mv.addObject("promoterBlackListSet", projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet());
					mv.addObject("promoterBlackListSetFlag", "YES");
				}
				else{
					mv.addObject("promoterBlackListSetFlag", "NO");
				}
				
	    	
	    	}catch(Exception ex){
	    		ex.printStackTrace();
	    	}
	    	
			return mv;
			
		}
		
	

		/*
		 * Save promoter company details
		 */
		
		@RequestMapping(value = "updateCompanyPromoterDetails", method = RequestMethod.POST)
		public ModelAndView updateCompanyPromoterDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
				HttpServletRequest request,@RequestParam("regCertificateFile") MultipartFile regCertificateFile,
				@RequestParam("chairManPhoto") MultipartFile chairManPhoto,
				@RequestParam("memberPhotoFile")MultipartFile []memberPhotoFile,
				@RequestParam(value="completionDocId",required=false)MultipartFile[] completionDocId,
				@RequestParam(value="occupancyDocId",required=false)MultipartFile[] occupancyDocId) {
			ModelAndView mv = null;
			
			Long id=null;
				try{
					
					ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
					//projectRegistrationModel.getPromoterDetailsModel().setEmailId(request.getParameter("emailId"));
					
					bsModel.getPromoterDetailsModel().populateModel(projectRegistrationModel.getPromoterDetailsModel());
					
					projectRegistrationModel.getPromoterDetailsModel().setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
					
					projectRegistrationModel=projectRegistrationService.saveOrUpdatePromoterCompany(bsModel, regCertificateFile, request,completionDocId,occupancyDocId);
					
					
					projectRegistrationService.saveUpdateProjectRegistration(projectRegistrationModel);
				    bsModel.getPromoterDetailsModel().setPromoterBlackSet(getBalacklistPromoterSet(bsModel.getPromoterDetailsModel(),request));
				    projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateChairManPhotograph(bsModel, chairManPhoto));
				    projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateRegistrationCertificate(bsModel, regCertificateFile));
					projectRegistrationService.saveUpdateMember(bsModel, request, memberPhotoFile);
			    	id=	projectRegistrationService.saveUpdateProjectRegistration(bsModel);
					
					httpSession.setAttribute("pkid",id);
					if(projectRegistrationModel.getProjectDetailsModel()!=null){
					
						  mv = new ModelAndView("redirect:/editProjectDetailsForm");
						}
						
						else{
						
						  mv = new ModelAndView("redirect:/addProjectDetailsForm");
							
						}
					

			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return mv;	
			}
		
		

	
		
	
	/*
	 * Save promoter individual details
	 */
	@RequestMapping(value = "editProjectDetailsForm")
	public ModelAndView editProjectDetailsForm() {
		ModelAndView mv = null;
		
			try{
			ProjectRegistrationModel bsModel=  projectRegistrationService.getProjectRegByPk(Long.parseLong( httpSession.getAttribute("pkid").toString())); 
			mv = new ModelAndView("editProjectDetailsForm");
			mv.addObject("projectRegistrationModel", bsModel);
			 mv.addObject("stateUtList", stateUtService.getStateUtList());
			 mv.addObject("bankList", bankService.getBankList());
			 if(bsModel.getStructuralEngineerDetailSet()==null || bsModel.getStructuralEngineerDetailSet().size()==0){
				 mv.addObject("stcEngStatus", "NO");
			 }else{
				 mv.addObject("stcEngStatus", "YES");
				 mv.addObject("stcEngSet", bsModel.getStructuralEngineerDetailSet());
			 } 
			 
			 if(bsModel.getProjectAgentDetailSet()==null || bsModel.getProjectAgentDetailSet().size()==0){
				 mv.addObject("agentStatus", "NO");
			 }else{
				 mv.addObject("agentStatus", "YES");
				 mv.addObject("agentSet", bsModel.getProjectAgentDetailSet());
			 } 
			 
			 if(bsModel.getProjectContratorDetailSet()==null || bsModel.getProjectContratorDetailSet().size()==0){
				 mv.addObject("projContratorStatus", "NO");
			 }else{
				 mv.addObject("projContratorStatus", "YES");
				 mv.addObject("projContratorSet", bsModel.getProjectContratorDetailSet());
			 } 
			
			 if(bsModel.getProjectArchitectDetailSet()==null || bsModel.getProjectArchitectDetailSet().size()==0){
				 mv.addObject("architectStatus", "NO");
			 }else{
				 mv.addObject("architectStatus", "YES");
				 mv.addObject("architectSet", bsModel.getProjectArchitectDetailSet());
			 } 
			 
			 if(bsModel.getDevelopmentDetailSet()==null || bsModel.getDevelopmentDetailSet().size()==0){
				 mv.addObject("developmentStatus", "NO");
			 }else{
				 mv.addObject("developmentStatus", "YES");
				 mv.addObject("developmentSet", bsModel.getDevelopmentDetailSet());
			 } 
			 
			 if(bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet()==null || bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet().size()==0){
				 mv.addObject("extOtherDevStatus", "NO");
			 }else{
				 mv.addObject("extOtherDevStatus", "YES");
				 mv.addObject("extOtherDevSet", bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet());
			 } 
			
			 
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		
		return mv;	}
	

	@RequestMapping(value = "updateProjectDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("bankDistrictId") Long districtId,
			@RequestParam("projectDistrictId") Long projectDistrictId,@RequestParam("subDistrictId") Long subDistrictId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel savedProj=projectRegistrationService.getProjectRegByPk(projectRegistrationModel.getProjectRegId());
			savedProj.getProjectDetailsModel().populateModel(projectRegistrationModel.getProjectDetailsModel());
			ExternalDevelopmentWorkModel extDev= projectRegistrationModel.getExternalDevelopmentWorkModel();
			extDev.setExtOtherDevSet(getExtOtherDevSet(request,extDev));
			savedProj.setExternalDevelopmentWorkModel(extDev);
			projectRegistrationModel.getProjectBankDetailsModel().setBankModel(bankService.getBankById(Long.parseLong(request.getParameter("projectBankId"))));
			projectRegistrationModel.getProjectBankDetailsModel().setDistrictModel(districtDAO.getDistirctById(districtId));
			savedProj.setProjectBankDetailsModel(projectRegistrationModel.getProjectBankDetailsModel());
			savedProj.setDevelopmentDetailSet(getDevelopmentDetailSet(request,savedProj));
				Set<ProjectArchitectDetailsModel> arcSet=getProjectArchitectSet(request,savedProj);
			if(arcSet.size()>0){
				savedProj.setProjectArchitectDetailSet(arcSet);
			}
			if(getStructuralEngineerSet(request,savedProj).size()>0){
				savedProj.setStructuralEngineerDetailSet(getStructuralEngineerSet(request,savedProj));
			}
			if(getProjectContratorSet(request,savedProj).size()>0){
				savedProj.setProjectContratorDetailSet(getProjectContratorSet(request,savedProj));
					
			}
			
				savedProj.setProjectAgentDetailSet(saveOrUdateAgent(request,savedProj));
			savedProj.getProjectDetailsModel().setDistrictModel(districtDAO.getDistirctById(projectDistrictId));
			savedProj.getProjectDetailsModel().setSubDistrictModel(subDistrictDAO.getSubDistirctById(subDistrictId));
		
            projectRegistrationService.mergeProjectRegistration(savedProj);
		
		
			if(savedProj.getProjectDocModel()!=null){
				mv = new ModelAndView("redirect:/editUploadDoc");
			}else{
				mv = new ModelAndView("redirect:/uploadProjectDocsForm");
			}
          

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
	

	@RequestMapping("editUploadDoc")
	public ModelAndView editUploadDoc( ){
		ModelAndView mv = null;
		
		try{
			mv = new ModelAndView("editDocUploadFrom");
			ProjectRegistrationModel baseModel=	projectRegistrationService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", baseModel);
			if(baseModel.getProjectPhotoDetailSet()!=null && baseModel.getProjectPhotoDetailSet().size()>0){
				mv.addObject("projectPhotoFlag","YES");
			}
			else{
				mv.addObject("projectPhotoFlag","NO");
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}

 
 
 
 
	@RequestMapping(value = "updateUploadProjectDoc", method = RequestMethod.POST)
	public ModelAndView updateUploadProjectDoc(@RequestParam("projectPhotoFile") MultipartFile[] projectPhotoFile,
			@RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
			@RequestParam("fieldName") String[]fieldNameArr,
			@RequestParam(value="photoId",required=false) String[] photoId,
			HttpServletRequest request){
		ModelAndView mv = null;
		try{
			ProjectRegistrationModel baseModel=projectRegistrationService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			 baseModel=projectRegistrationService.updateProjectPhotoDoc(photoId,projectPhotoFile, otherFileDoc,fieldNameArr,baseModel);
			projectRegistrationService.editProjectRegistration(baseModel);
			mv = new ModelAndView("redirect:/projectRegpaymentForm");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	
	
	
	
	
		
  
	 public Set<PromoterBlacklistDetailsModel> getBalacklistPromoterSet(PromoterDetailsModel promoterDetailsModel,HttpServletRequest request){
		 Set<PromoterBlacklistDetailsModel> set= new HashSet<PromoterBlacklistDetailsModel>();
		 try{
			 PromoterBlacklistDetailsModel model = null;
			String[]arr=  request.getParameterValues("certificateNo");
			if(arr!=null){
			 for(int i=0;i<arr.length;i++){
			
				model= new PromoterBlacklistDetailsModel();
				model.setBlacklistReason(request.getParameterValues("blacklist")[i].toString());
				if(request.getParameterValues("prmBacklistId")!=null){
					if(!request.getParameterValues("prmBacklistId")[i].equals("")){
						model.setPrmBacklistId(Long.parseLong(request.getParameterValues("prmBacklistId")[i]));
								
					}
				}
				
				model.setIsBalckList(request.getParameterValues("isBalckListFld")[i]);
				model.setCertificateNo(arr[i]);
				model.setPromoterDetailsModel(promoterDetailsModel);
				model.setStateUtModel(stateUtService.getStateByID(Long.parseLong(request.getParameterValues("otherStateId")[i])));
				set.add(model);
			 }
			}
			}catch(Exception ex){
			 ex.printStackTrace();
		 }
		 
		 return set;
	 }
	 
		
	

	/*
	 * redirect Next Promoter Form
	 */
	
	
	
	
	
	
	
	private Set<DevelopmentDetailsModel> getDevelopmentDetailSet(HttpServletRequest request,ProjectRegistrationModel model){
		Set<DevelopmentDetailsModel> set = new HashSet<DevelopmentDetailsModel>();
		DevelopmentDetailsModel dev = null;
		try{
			String[]arr= request.getParameterValues("typeOfInventory");
			
			if(arr!=null){
			for(int i=0;i<arr.length;i++){
				dev = new DevelopmentDetailsModel();
				dev.setTypeOfInventory(arr[i]);
				
			
				dev.setNoOfInventory(Integer.parseInt(request.getParameterValues("noOfInventory")[i].toString()));
				//Changes done on 7/7/2017
				
				dev.setProposedFar(Double.parseDouble(request.getParameterValues("proposedFar")[i].toString()));
				dev.setSanctionedFar(Double.parseDouble(request.getParameterValues("sanctionedFar")[i].toString()));
				dev.setProposedBldgNo(Integer.parseInt(request.getParameterValues("proposedBldgNo")[i].toString()));
				dev.setSanctionedBldgNo(Integer.parseInt(request.getParameterValues("sanctionedBldgNo")[i].toString()));
				dev.setProposedFloors(Integer.parseInt(request.getParameterValues("proposedFloors")[i].toString()));
				dev.setSanctionedFloors(Integer.parseInt(request.getParameterValues("sanctionedFloors")[i].toString()));
				dev.setRecreationalOpenSpace(Double.parseDouble(request.getParameterValues("recreationalOpenSpace")[i].toString()));
				dev.setArchDesignStandard(request.getParameterValues("archDesignStandard")[i]);
				dev.setTypeOfConstruction(request.getParameterValues("typeOfConstruction")[i]);
				dev.setEarthquakeResistant(request.getParameterValues("earthquakeResistant")[i]);
				// End of change
				dev.setCarpetArea(Double.parseDouble(request.getParameterValues("carpetArea")[i].toString()));
				dev.setAreaOfExclusive(Double.parseDouble(request.getParameterValues("areaOfExclusive")[i]));
				dev.setAreaOfExclusiveOpenTerrace(Double.parseDouble(request.getParameterValues("areaOfExclusiveOpenTerrace")[i].toString()));
				if(request.getParameterValues("devId")!=null){
					dev.setDevId(Long.parseLong(request.getParameterValues("devId")[i].toString()));
				}
				
				set.add(dev);
			}
			}
			 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return set;
	}
		
		
		
		private Set<ExtOtherDevModel> getExtOtherDevSet(HttpServletRequest request,ExternalDevelopmentWorkModel model){
			Set<ExtOtherDevModel> set = new HashSet<ExtOtherDevModel>();
			ExtOtherDevModel dev = null;
			try{
				String[]arr= request.getParameterValues("extDevWorkDesc");
				if(arr!=null){
				for(int i=0;i<arr.length;i++){
					dev = new ExtOtherDevModel();
					dev.setDevelopeBy(request.getParameterValues("developeBy")[i]);
					dev.setExternalDevelopmentWorkModel(model);
					dev.setWorkDesc(request.getParameterValues("extDevWorkDesc")[i]);
					if(request.getParameterValues("extOtherDevId")!=null){
						if(!request.getParameterValues("extOtherDevId")[i].equals("")){
							dev.setExtOtherDevId(Long.parseLong(request.getParameterValues("extOtherDevId")[i]));	
										
						}
					}
					set.add(dev);
				}
				}
				 
			}catch(Exception ex){
				ex.printStackTrace();
				
			}
			return set;
		
		
		
	}
	private Set<ProjectArchitectDetailsModel> getProjectArchitectSet(HttpServletRequest request,ProjectRegistrationModel model){
		Set<ProjectArchitectDetailsModel> set = new HashSet<ProjectArchitectDetailsModel>();
		try{
			
			ProjectArchitectDetailsModel architectDetailsModel =null;
			String[]arr= request.getParameterValues("strcEmailId");
			String[] ids= request.getParameterValues("projectArchId");
			if(arr!=null){
			for(int i=0;i<arr.length;i++){
			
				
				if(ids!=null && ids.length>i && ids[i]!=null && ids[i].trim().length()>0 ){
					
						architectDetailsModel=projectArchitectDAO.getProjectArchoitectById(Long.parseLong(ids[i]));				
					
				}else{
					architectDetailsModel=new ProjectArchitectDetailsModel();
				}
				architectDetailsModel.setArchitectName(request.getParameterValues("architectName")[i]);
				architectDetailsModel.setEmailId(request.getParameterValues("arctEmailId")[i]);
				architectDetailsModel.setAddressLine1(request.getParameterValues("arctAddressLine1")[i]);
				architectDetailsModel.setAddressLine2(request.getParameterValues("arctAddressLine2")[i]);
				architectDetailsModel.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("arctProjDistrictId")[i])));
				architectDetailsModel.setYearOfEstablishment(request.getParameterValues("arctYearOfEst")[i]);
				architectDetailsModel.setKeyProject(request.getParameterValues("arctKeyProjectCompleted")[i]);
				architectDetailsModel.setPinCode(request.getParameterValues("arctPineCode")[i]);
				architectDetailsModel.setAddedOn(Calendar.getInstance());
				architectDetailsModel.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				set.add(architectDetailsModel);
			}
			 
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return set;
	}
	
	
	private Set<StructuralEngineerDetailsModel> getStructuralEngineerSet(HttpServletRequest request,ProjectRegistrationModel model){
		Set<StructuralEngineerDetailsModel> set = new HashSet<StructuralEngineerDetailsModel>();
		StructuralEngineerDetailsModel eg = null;
		try{
			
		
		
			String[]arr= request.getParameterValues("strcEmailId");
			String[] ids=request.getParameterValues("strcStcEngId");
			if(arr!=null){
			for(int i=0;i<arr.length;i++){
				if(ids !=null && ids.length>i && ids[i]!=null && ids[i].trim().length()>0){
				eg=		 structuralEngneerDAO.getEngineerById(Long.parseLong(ids[i]));
				}else{				
				eg = new StructuralEngineerDetailsModel();
			}
				eg.setEngineerName(request.getParameterValues("engineerName")[i].toString());
				eg.setEmailId(request.getParameterValues("strcEmailId")[i]);
				eg.setAddressLine1(request.getParameterValues("strcAddressLine1")[i]);
				
				eg.setAddressLine2(request.getParameterValues("strcAddressLine2")[i]);
				eg.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("strcProjDistrictId")[i])));
				eg.setYearOfEstablishment(request.getParameterValues("strcYearOfEst")[i]);
				
				eg.setKeyProject(request.getParameterValues("strcKeyProjectCompleted")[i]);
			
				eg.setPinCode(request.getParameterValues("strcPineCode")[i]);
				eg.setAddedOn(Calendar.getInstance());
				eg.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				
				set.add(eg);
			}
			}
			 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return set;
	}
	
	private Set<ProjectAgentModel> saveOrUdateAgent(HttpServletRequest request,ProjectRegistrationModel model){
		Set<ProjectAgentModel> agentSet = new HashSet<ProjectAgentModel>();
		
		try{
			String[]arr= request.getParameterValues("agentRegNo");
			if(arr!=null){
				ProjectAgentModel obj=null;
			for(int i=0;i<arr.length;i++){
				
					if(! arr[i].trim().equals("")){
						AgentRegistrationModel agent=projectRegistrationService.getAgentByRegNo(arr[i]);
						if(agent!=null){
						obj=new ProjectAgentModel();
						obj.setAddedOn(Calendar.getInstance());
						obj.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
						obj.setAgent(agent);
						obj.setProject(model);
						agentSet.add(obj);
						if(agent.getProjectRegistrationModelSet()==null){
							agent.setProjectRegistrationModelSet(new HashSet<ProjectAgentModel>());
						}
						agent.getProjectRegistrationModelSet().add(obj);
						commonDao.updateObject(agent);
						}
										
					}
				}
					
				
			}
			 
			 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return agentSet;
	}
	
	
	private Set<ProjectContratorDetailsModel> getProjectContratorSet(HttpServletRequest request,ProjectRegistrationModel model){
		Set<ProjectContratorDetailsModel> set = new HashSet<ProjectContratorDetailsModel>();
		ProjectContratorDetailsModel eg = null;
		try{
			
			String[]arr= request.getParameterValues("cntrEmailId");
			String[] ids=request.getParameterValues("projectCntrId");
			if(arr!=null){
			for(int i=0;i<arr.length;i++){
				if(ids!=null && ids.length>i && ids[i]!=null && ids[i].trim().length()>0){
					
				eg=contratorDetailsDAO.getProjectContractorById(Long.parseLong(ids[i]));
			    }else{
				eg = new ProjectContratorDetailsModel();
			    }
				eg.setContractorName(request.getParameterValues("contractorName")[i]);
				eg.setEmailId(request.getParameterValues("cntrEmailId")[i]);
				eg.setAddressLine1(request.getParameterValues("cntrAddressLine1")[i]);
				eg.setAddressLine2(request.getParameterValues("cntrAddressLine2")[i]);
				eg.setDistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("cntrProjDistrictId")[i])));
				eg.setYearOfEstablishment(request.getParameterValues("cntrYearOfEst")[i]);
				eg.setKeyProject(request.getParameterValues("cntrKeyProjectCompleted")[i]);
				eg.setPinCode(request.getParameterValues("cntrPineCode")[i]);
				eg.setAddedOn(Calendar.getInstance());
				eg.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				
				set.add(eg);
			}
			}
			 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return set;
	}
	
	@RequestMapping(value="getAgentDetailforProjectReg",method=RequestMethod.GET)
	public @ResponseBody String getAgentDetailforProjectReg(@RequestParam("agentRegNo")String agentRegNo,
			@RequestParam("SID")String sid){
		AgentRegistrationModel agent=null;
		String agentDls="Agent not found";
		try{
			
			 agent= projectRegistrationService.getAgentByRegNo(agentRegNo);
			 if(agent!=null){
				 if(agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG))
				 agentDls=sid+"~"+agent.getAgentRegistrationID()+"~"+ agent.getAgentDetailsModel().getAgentName()+"~"+agent.getAgentDetailsModel().getAgentIndividualAddressLine1();
				 else
					 agentDls=sid+"~"+agent.getAgentRegistrationID()+"~"+ agent.getAgentDetailsModel().getFirmName()+"~"+agent.getAgentDetailsModel().getFirmAddressLine1();
				 
			 }else{
				 agentDls=sid+"~NOEXIST";
			 }
				
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return agentDls;
		
		
	}
	@Autowired
	  IStructuralEngneerDAO<StructuralEngineerDetailsModel, Long>   structuralEngneerDAO;
	
	@Autowired
	IProjectContractorDAO<ProjectContratorDetailsModel, Long> contratorDetailsDAO;
	
	@Autowired
	IProjectArchitectDAO<ProjectArchitectDetailsModel, Long>  projectArchitectDAO;
}
