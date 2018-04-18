package in.gov.rera.transaction.agentregistration.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.dao.IPreAgentReistrationDao;
import in.gov.rera.transaction.agentregistration.model.AgentDetailsModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.RegPaymentDetailsModel;
import in.gov.rera.transaction.agentregistration.model.RegPreviousDatailsModel;
import in.gov.rera.transaction.agentregistration.model.RegUploadDetailsModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Controller(value="AgentRegistrationController")
@Scope("request")
public class AgentRegistrationController {


	@Autowired
	HttpSession httpSession;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IPreAgentReistrationDao<RegPreviousDatailsModel, Integer> preAgentReistrationDao;
	@Autowired
	IStateUtService<StateUtModel, Long> stateUtService;
	
	@Autowired
	IDistrictDAO<DistrictModel, Long> districtDao;
	
	@Autowired
	IBankService<BankModel ,Long> bankService;
	
	@Autowired
	MailService mailService;
	
	//@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,Model model
	@RequestMapping(value="initAgentRegistration",method=RequestMethod.GET)
		public ModelAndView initProjectRegistration(){
		ModelAndView mv = null;
		try{
			
			mv = new ModelAndView("agentRegistration");
		}catch(Exception ex){

		}
		return mv;
	}

//@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel
	//,Model model,HttpServletRequest request
	@RequestMapping(value="invOrComAgentRegForm",method=RequestMethod.POST)
	public ModelAndView invOrComAgentRegForm(@RequestParam(value="emailId") String emailId,@RequestParam(value="reg_type") String type){
		ModelAndView mv = null;
		AgentRegistrationModel agentReg=null;
		AgentDetailsModel agent=null;
		try{
				
			agentReg=	agentRegistrationService.getSavedAgentByEmailId(emailId);
			if(agentReg!=null){
				httpSession.setAttribute("pkid", agentReg.getAgentRegistrationID());
				type=agentReg.getRegistrationType();
				if(type.equals(ReraConstants.FIRM_COMP_REG)){
					mv = new ModelAndView("redirect:/editAgentComForm");
					}else{
						mv = new ModelAndView("redirect:/editIndAgentForm");
					}
			}
			else{
			
			if(type.equals("firm")){
			mv = new ModelAndView("agentRegComForm");
			}else{
				mv = new ModelAndView("agentRegInvForm");
			}
	   	agentReg=	new AgentRegistrationModel();
		agent=new AgentDetailsModel();
		agent.setAgentEmailId(emailId);
		agent.setFirmEmail(emailId);
		agentReg.setRegistrationType(type);
		agentReg.setAgentDetailsModel(agent);
			}
			mv.addObject("agentRegistrationModel",agentReg);
			mv.addObject("stateUtList",stateUtService.getStateUtList());
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}

	
	
	

	@RequestMapping(value="saveInvdAgentDetails",method=RequestMethod.POST)
	public ModelAndView saveAgentIndRegistration(@RequestParam("agentPhotographPath") MultipartFile photograph,
			@RequestParam(value="certificatePath" , required=false ) MultipartFile[] previousCert,@RequestParam("agentDistrictId") Long agentDistrictId,
			@RequestParam("businessDistrictId") Long businessDistrictId,
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			BindingResult result, HttpServletRequest request
			){
		ModelAndView mv = null;
		Long pkid1=null;
		
		try{
			String[]perRegArr=	 request.getParameterValues("preRegistrationNo");
			
			String[] preDistID= request.getParameterValues("preDistrictId");
			Set<RegPreviousDatailsModel> regPreviousDatailsModelSet = new HashSet<RegPreviousDatailsModel>();
				agentRegistrationModel.setRegistrationStage("First");
				agentRegistrationModel.setRegistrationType(ReraConstants.INDVISUAL_REG);
				agentRegistrationModel.setCreatedOn(Calendar.getInstance());
				agentRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
				agentRegistrationModel.getAgentDetailsModel().setAgentIndividualBussDistrictModel(districtDao.getDistirctById(businessDistrictId));
				agentRegistrationModel.getAgentDetailsModel().setDistrictModel(districtDao.getDistirctById(agentDistrictId));
				
				
				pkid1 = agentRegistrationService.createAgentRegistration(agentRegistrationModel);
			
			agentRegistrationModel=	agentRegistrationService.getAgentRegByPk(pkid1);
			RegPreviousDatailsModel regPreviousDatailsModel=null;
			if(perRegArr!=null && perRegArr.length>0){
			for(int i=0;i<perRegArr.length;i++){
				if(perRegArr[i]!=null){
				regPreviousDatailsModel = new RegPreviousDatailsModel();
				regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
				regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
				regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
				
				regPreviousDatailsModel.setCertificateDoc(agentRegistrationService.saveDocument(previousCert[i], agentRegistrationModel));
				regPreviousDatailsModelSet.add(regPreviousDatailsModel);
				}
			
			}
			}
			agentRegistrationModel.getAgentDetailsModel().setPhotograph(agentRegistrationService.saveDocument(photograph, agentRegistrationModel));
		
			agentRegistrationModel.getAgentDetailsModel().setRegPreviousDatailsModelSet(regPreviousDatailsModelSet);
			agentRegistrationService.editAgentRegistration(agentRegistrationModel);
				mv = new ModelAndView("redirect:/agentUploadDocForm");
			
			
			
		
			httpSession.setAttribute("pkid",pkid1);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	

	@RequestMapping(value="saveAgentCompRegistration",method=RequestMethod.POST)
	public ModelAndView saveAgentCompRegistration(@RequestParam("agentPhotographPath") MultipartFile photograph,
			@RequestParam("firmRegCertificatePath") MultipartFile firmRegcret,
			@RequestParam("agentDistrictId") Long agentDistrictId,
			@RequestParam("directorDistrictId") Long directorDistrictId,
			@RequestParam(value="certificatePath", required=false) MultipartFile[] previousCert,
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			HttpServletRequest request
			){
		ModelAndView mv = null;
		Long pkid1=null;
		
		try{
			String[]perRegArr=	 request.getParameterValues("preRegistrationNo");
			String[] preDistID= request.getParameterValues("preDistrictId");
			Set<RegPreviousDatailsModel> regPreviousDatailsModelSet = new HashSet<RegPreviousDatailsModel>();
				agentRegistrationModel.setRegistrationStage("First");
				agentRegistrationModel.setRegistrationType(ReraConstants.FIRM_COMP_REG);
				agentRegistrationModel.setCreatedOn(Calendar.getInstance());
				agentRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
				agentRegistrationModel.getAgentDetailsModel().setDistrictModel(districtDao.getDistirctById(agentDistrictId));
				agentRegistrationModel.getAgentDetailsModel().setPartnerOrDirectorDistrictModel(districtDao.getDistirctById(directorDistrictId));
				pkid1 = agentRegistrationService.createAgentRegistration(agentRegistrationModel);
			
			agentRegistrationModel=	agentRegistrationService.getAgentRegByPk(pkid1);
			RegPreviousDatailsModel regPreviousDatailsModel=null;
			
			if(perRegArr!=null && perRegArr.length>0){
				for(int i=0;i<perRegArr.length;i++){
				if(perRegArr[i]!=null){
					regPreviousDatailsModel = new RegPreviousDatailsModel();
				regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
				regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
				regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
				regPreviousDatailsModel.setCertificateDoc(agentRegistrationService.saveDocument(previousCert[i], agentRegistrationModel));
				regPreviousDatailsModelSet.add(regPreviousDatailsModel);
			
			}
					}
				}
			agentRegistrationModel.getAgentDetailsModel().setPhotograph(agentRegistrationService.saveDocument(photograph, agentRegistrationModel));
			agentRegistrationModel.getAgentDetailsModel().setFirmCertificatDoc(agentRegistrationService.saveDocument(firmRegcret, agentRegistrationModel));
			agentRegistrationModel.getAgentDetailsModel().setRegPreviousDatailsModelSet(regPreviousDatailsModelSet);;
			agentRegistrationService.editAgentRegistration(agentRegistrationModel);
				
			
			mv = new ModelAndView("redirect:/agentUploadDocForm");
			
			
			
		
			httpSession.setAttribute("pkid",pkid1);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "editIndAgentForm")
	public ModelAndView  editIndAgentForm(
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			HttpServletRequest request) {
			ModelAndView mv = null;
		try {
			System.out.println("in the previous actio "+httpSession.getAttribute("pkid"));
			agentRegistrationModel=agentRegistrationService.getAgentRegByPk(Long.parseLong((httpSession.getAttribute("pkid").toString())));
			mv = new ModelAndView("editAgentRegInvForm");
			mv.addObject("agentRegistrationModel",agentRegistrationModel);
			if(	agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet()!=null &&
					agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet().size()>0){
			mv.addObject("pervAgentSet", agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet());
			mv.addObject("pervAgentSetFlag","YES");
			}else{
				mv.addObject("pervAgentSetFlag","NO");
			}
			mv.addObject("stateUtList",stateUtService.getStateUtList());
			mv.addObject("agentDistrict",agentRegistrationModel.getAgentDetailsModel().getDistrictModel());
			mv.addObject("businessDistrictId",agentRegistrationModel.getAgentDetailsModel().getAgentIndividualBussDistrictModel());
			
			
		} catch (Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "editAgentComForm")
	public ModelAndView editAgentComForm(
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
		HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			mv = new ModelAndView("editAgentRegComForm");
			agentRegistrationModel=agentRegistrationService.getAgentRegByPk(Long.parseLong((httpSession.getAttribute("pkid").toString())));
			mv.addObject("agentRegistrationModel",agentRegistrationModel);
			if(	agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet()!=null &&
					agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet().size()>0){
			mv.addObject("pervAgentSet", agentRegistrationModel.getAgentDetailsModel().getRegPreviousDatailsModelSet());
			mv.addObject("pervAgentSetFlag","YES");
			}else{
				mv.addObject("pervAgentSetFlag","NO");
			}
			mv.addObject("stateUtList",stateUtService.getStateUtList());
			mv.addObject("agentDistrict",agentRegistrationModel.getAgentDetailsModel().getDistrictModel());
			mv.addObject("directorDistrictId",agentRegistrationModel.getAgentDetailsModel().getPartnerOrDirectorDistrictModel());
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
	

	@RequestMapping(value="updateInvdAgentDetails",method=RequestMethod.POST)
	public ModelAndView updateAgentIndRegistration(@RequestParam(value="agentPhotographPath", required=false) MultipartFile photograph,
			@RequestParam(value="certificatePath",required=false) MultipartFile[] previousCert,
			@RequestParam("agentDistrictId") Long agentDistrictId,
			@RequestParam("businessDistrictId") Long businessDistrictId,
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			HttpServletRequest request
			){
		ModelAndView mv = null;
		Long pkid1=null;
		
		try{
			
			AgentRegistrationModel baseModel=	agentRegistrationService.getAgentRegByPk(agentRegistrationModel.getAgentRegistrationID());
			
			
			String[]perRegArr=	 request.getParameterValues("preRegistrationNo");
			String[] preRegID= request.getParameterValues("preRegId"); 
			String[] preDistID= request.getParameterValues("preDistrictId");
			
			int pr=0;
			if(preRegID!=null && preRegID.length>0){
				pr=preRegID.length;
			}
			
		   if(photograph!=null && ! photograph.isEmpty()){
			Document doc=   agentRegistrationService.updateDocument(photograph, baseModel.getAgentDetailsModel().getPhotograph()); 
			baseModel.getAgentDetailsModel().setPhotograph(doc);
		   }
		   baseModel.getAgentDetailsModel().setAgentIndividualBussDistrictModel(districtDao.getDistirctById(businessDistrictId));
		   baseModel.getAgentDetailsModel().setDistrictModel(districtDao.getDistirctById(agentDistrictId));
		   
		  
			updateAgentModel(baseModel.getAgentDetailsModel(), agentRegistrationModel.getAgentDetailsModel());
			
			baseModel.setLastUpdatedOn(Calendar.getInstance());
				pkid1= agentRegistrationService
						.editAgentRegistration(baseModel);

				Set<RegPreviousDatailsModel> regPreviousDatailsModelSet = new HashSet<RegPreviousDatailsModel>();
				RegPreviousDatailsModel regPreviousDatailsModel=null;
			
				if(perRegArr!=null && perRegArr.length>0){
					for(int i=0;i<perRegArr.length;i++){
						if(perRegArr[i]!=null){
						
					if(pr>i && preRegID[i]!=null && preRegID[i].trim().length()>0){
						
						regPreviousDatailsModel=		preAgentReistrationDao.getPreRegistrationById(Integer.parseInt(preRegID[i]));
						regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
						regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
						
						regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
						if(previousCert[i]!=null && ! previousCert[i].isEmpty()){
							
									agentRegistrationService.updateDocument(previousCert[i], regPreviousDatailsModel.getCertificateDoc()); 	
					}	
						regPreviousDatailsModelSet.add(regPreviousDatailsModel);
						
					}else{
						regPreviousDatailsModel = new RegPreviousDatailsModel();
						regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
						regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
						regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
						regPreviousDatailsModelSet.add(regPreviousDatailsModel);
						agentRegistrationService.saveDocument(previousCert[i], baseModel);
						
					}
				}
					}
				}
				baseModel.getAgentDetailsModel().setRegPreviousDatailsModelSet(regPreviousDatailsModelSet);
				pkid1= agentRegistrationService
						.editAgentRegistration(baseModel);
			
			if(baseModel.getRegistrationStage()!=null && !baseModel.getRegistrationStage().equalsIgnoreCase("First")){
				mv = new ModelAndView("redirect:/editAgentUploadDoc");
			}
			else{
				mv = new ModelAndView("redirect:/agentUploadDocForm");
			}
			
			
			
		
			httpSession.setAttribute("pkid",baseModel.getAgentRegistrationID());
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
	}
	


	
	@RequestMapping(value="updateAgentCompRegistration",method=RequestMethod.POST)
	public ModelAndView updateAgentCompRegistration(@RequestParam("agentPhotographPath") MultipartFile photograph,
			@RequestParam("firmRegCertificatePath") MultipartFile firmRegcret,
			@RequestParam(value="certificatePath", required=false) MultipartFile[] previousCert,
			@RequestParam("agentDistrictId") Long agentDistrictId,
			@RequestParam("directorDistrictId") Long directorDistrictId,
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			HttpServletRequest request
			){

		ModelAndView mv = null;
		Long pkid1=null;
		
		try{
			
			AgentRegistrationModel baseModel=	agentRegistrationService.getAgentRegByPk(agentRegistrationModel.getAgentRegistrationID());
			
			
			String[]perRegArr=	 request.getParameterValues("preRegistrationNo");
			String[] preRegID= request.getParameterValues("preRegId"); 
			String[] preDistID= request.getParameterValues("preDistrictId");
			
			int pr=0;
			if(preRegID!=null && preRegID.length>0){
				pr=preRegID.length;
			}
			
		   if(photograph!=null && ! photograph.isEmpty()){
			Document doc=   agentRegistrationService.updateDocument(photograph, baseModel.getAgentDetailsModel().getPhotograph()); 
			baseModel.getAgentDetailsModel().setPhotograph(doc);
		   }
		   if(firmRegcret!=null && ! firmRegcret.isEmpty()){
				Document doc=   agentRegistrationService.updateDocument(firmRegcret, baseModel.getAgentDetailsModel().getFirmCertificatDoc()); 
				baseModel.getAgentDetailsModel().setFirmCertificatDoc(doc);
			   }
			
			updateAgentModel(baseModel.getAgentDetailsModel(), agentRegistrationModel.getAgentDetailsModel());
			agentRegistrationModel.getAgentDetailsModel().setDistrictModel(districtDao.getDistirctById(agentDistrictId));
			agentRegistrationModel.getAgentDetailsModel().setPartnerOrDirectorDistrictModel(districtDao.getDistirctById(directorDistrictId));
			baseModel.setLastUpdatedOn(Calendar.getInstance());
				pkid1= agentRegistrationService
						.editAgentRegistration(baseModel);

				Set<RegPreviousDatailsModel> regPreviousDatailsModelSet = new HashSet<RegPreviousDatailsModel>();
				RegPreviousDatailsModel regPreviousDatailsModel=null;
			
				if(perRegArr!=null && perRegArr.length>0){
					for(int i=0;i<perRegArr.length;i++){
						if(perRegArr[i]!=null){
						
					if(pr>i && preRegID[i]!=null && preRegID[i].trim().length()>0){
						
						regPreviousDatailsModel=		preAgentReistrationDao.getPreRegistrationById(Integer.parseInt(preRegID[i]));
						
						regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
						regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
						regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
						if(previousCert[i]!=null && ! previousCert[i].isEmpty()){
							
									agentRegistrationService.updateDocument(previousCert[i], regPreviousDatailsModel.getCertificateDoc()); 	
					}	
						regPreviousDatailsModelSet.add(regPreviousDatailsModel);
						
					}else{
						regPreviousDatailsModel = new RegPreviousDatailsModel();
						regPreviousDatailsModel.setPreRegistrationNo(perRegArr[i]);
						regPreviousDatailsModel.setDistrictModel(districtDao.getDistirctById(Long.parseLong(preDistID[i])));
						regPreviousDatailsModel.setAgentDetailsModel(agentRegistrationModel.getAgentDetailsModel());
						regPreviousDatailsModelSet.add(regPreviousDatailsModel);
						agentRegistrationService.saveDocument(previousCert[i], baseModel);
						
					}
					
				
				}
					}
					}
				baseModel.getAgentDetailsModel().setRegPreviousDatailsModelSet(regPreviousDatailsModelSet);
				pkid1= agentRegistrationService
						.editAgentRegistration(baseModel);
			
			if(baseModel.getRegistrationStage()!=null && !baseModel.getRegistrationStage().equalsIgnoreCase("First")){
				mv = new ModelAndView("redirect:/editAgentUploadDoc");
			}
			else{
				mv = new ModelAndView("redirect:/agentUploadDocForm");
			}
			
			
			
		
			httpSession.setAttribute("pkid",baseModel.getAgentRegistrationID());
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;

		
		}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "agentUploadDocForm")
	public ModelAndView agentUploadDocForm() {
			ModelAndView mv = null;
		try {
			mv = new ModelAndView("agentRegUploadform");
			AgentRegistrationModel		agentRegistrationModel=agentRegistrationService.getAgentRegByPk(Long.parseLong((httpSession.getAttribute("pkid").toString())));
			mv.addObject("agentRegistrationModel",agentRegistrationModel);
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}

	
	@RequestMapping(value = "agentRegUpload", method = RequestMethod.POST)
	public ModelAndView saveOrUploadProjectDoc(@RequestParam("panCardFile") MultipartFile panCardFile,
			@RequestParam("addressProofFile") MultipartFile addressProofFile,
		
			@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel){
		ModelAndView mv = null;

		try{
			
			AgentRegistrationModel agentBaseModel=agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			agentBaseModel.setRegistrationStage("Second");
			AgentRegistrationModel M=agentRegistrationService.saveOrUpdateAgentPhotoDoc( panCardFile,addressProofFile,agentBaseModel);
			agentRegistrationService.editAgentRegistration(M);
			mv = new ModelAndView("redirect: agentPaymentForm");
			
			
		

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;

	}
	                         

	
	
	@RequestMapping(value = "agentPaymentForm")
	public ModelAndView agentPaymentForm(){
		ModelAndView mv = null;

		try{
			
			AgentRegistrationModel agentBaseModel=agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
		
			mv = new ModelAndView("agentPayment");
			mv.addObject("bankList", bankService.getBankList());
			mv.addObject("agentRegistrationModel",agentBaseModel);
			mv.addObject("pervAgentSet", agentBaseModel.getAgentDetailsModel().getRegPreviousDatailsModelSet());
			mv.addObject("stateUtList",stateUtService.getStateUtList());
			mv.addObject("agentDistrict",agentBaseModel.getAgentDetailsModel().getDistrictModel());
			mv.addObject("businessDistrictId",agentBaseModel.getAgentDetailsModel().getAgentIndividualBussDistrictModel());
			mv.addObject("directorDistrictId",agentBaseModel.getAgentDetailsModel().getPartnerOrDirectorDistrictModel());
			mv.addObject("UploadDetails",agentBaseModel.getAgentDetailsModel().getRegUploadDetailsModel());

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;

	}
	                         

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
		@RequestMapping(value = "editAgentUploadDoc")
	public ModelAndView editAgentUploadForm(@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,BindingResult result,Model model){
		ModelAndView mv = null;
		
		try{
			mv = new ModelAndView("editAgentDocUploadFrom");
			AgentRegistrationModel agentBaseModel=	agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("agentRegistrationModel", agentBaseModel);
			mv.addObject("UploadDetails",agentBaseModel.getAgentDetailsModel().getRegUploadDetailsModel());
			
		
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	

	@RequestMapping(value = "editAgentRegUpload", method = RequestMethod.POST)
	public ModelAndView updateAgentRegUpload(@ModelAttribute("agentRegistrationModel") AgentRegistrationModel agentRegistrationModel,
			@RequestParam(value="panCardDocFile", required=false)MultipartFile panCardDocFile,
		@RequestParam(value="addressProofPath" , required=false)MultipartFile addressProofPath,
		@RequestParam(value="balanceSheetPath", required=false )MultipartFile balanceSheetPath){
		ModelAndView mv = null;
			try{
			AgentRegistrationModel agentBaseModel=	agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
		boolean flag=false;
			
			if(panCardDocFile!=null && !panCardDocFile.isEmpty()){
				agentRegistrationService.updateDocument(panCardDocFile, agentBaseModel.getAgentDetailsModel().getRegUploadDetailsModel().getPanCardPath());
				flag=true;
			}
			if(addressProofPath!=null && !addressProofPath.isEmpty()){
				agentRegistrationService.updateDocument(addressProofPath, agentBaseModel.getAgentDetailsModel().getRegUploadDetailsModel().getAddressProofPath());
				flag=true;
			}
			if(flag){
			 agentRegistrationService.editAgentRegistration(agentBaseModel);
			}
              				
			mv = new ModelAndView("redirect: agentPaymentForm");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	

	@RequestMapping(value="agentRegPayment",method=RequestMethod.POST)
	public ModelAndView agentRegPayment(@RequestParam ("attachScanCopy")MultipartFile attachScanCopy, @ModelAttribute("agentRegistrationModel")
			AgentRegistrationModel agentRegistrationModel,
			@RequestParam ("bankName") Long bankID,
			@RequestParam ("bankbranch") String bankBranch,
			@RequestParam ("ddChequeNo") String ddChequeNo,
			@RequestParam ("paymentmode") String mode,
			@RequestParam ("amount") Double amount){
			ModelAndView mv = null;
		try{
			RegPaymentDetailsModel paymentDetailsModel=new RegPaymentDetailsModel();
			paymentDetailsModel.setAmount(amount);
			paymentDetailsModel.setBranch(bankBranch);
			paymentDetailsModel.setDdOrChequeNo(ddChequeNo);
			paymentDetailsModel.setPaymentMode(mode);
			paymentDetailsModel.setBankModel(bankService.getBankById(bankID));
			
			AgentRegistrationModel baseModel=agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseModel.getAgentDetailsModel().setRegPaymentDetailsModel(paymentDetailsModel);
			AgentRegistrationModel saveAgentPayment =agentRegistrationService.saveAgentPayment(attachScanCopy,baseModel);
			saveAgentPayment.setStatus(ReraConstants.PENDING_OPRATOR);
			agentRegistrationService.editAgentRegistration(saveAgentPayment);
			mv = new ModelAndView("redirect:/agentRegistrationConfirmation");
			
			mailService.sendAgentRegConfirmation(saveAgentPayment);
		}catch(Exception ex){
ex.printStackTrace();
		}
		return mv;
	}
	
	
	
	@RequestMapping(value="redirectpaymentgateway",method=RequestMethod.POST)
	public void agentRegPayment(HttpServletResponse response,@RequestParam ("amount") Double amount){
		try{
		PrintWriter out=	response.getWriter();
		
		out.println("<div ><h1>Payment Gateway  Page!  Transactional Amout :-"+amount+" </h1></div>");
		out.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping(value="agentRegistrationConfirmation")
	public ModelAndView agentRegistrationConfirmation(HttpServletRequest request){
			ModelAndView mv = null;
		try{
			mv = new ModelAndView("agentRegSuccessfully");
			AgentRegistrationModel baseModel=agentRegistrationService.getAgentRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("agentRegistrationModel", baseModel);
		                           
			
			httpSession.removeAttribute("pkid");
		}catch(Exception ex){
ex.printStackTrace();
		}
		return mv;
	}
	
	
	
	
	private void updateAgentModel(AgentDetailsModel model1,AgentDetailsModel model2){
		model1.setAgentAdhaarNo(model2.getAgentAdhaarNo());
		model1.setAgentFatherName(model2.getAgentFatherName());
		model1.setAgentIndividualAddressLine1(model2.getAgentIndividualAddressLine1());
		model1.setAgentIndividualAddressLine2(model2.getAgentIndividualAddressLine2());
		model1.setAgentIndividualBussAddress1(model2.getAgentIndividualBussAddress1());
		model1.setAgentIndividualBussAddress2(model2.getAgentIndividualBussAddress2());
		model1.setAgentName(model2.getAgentName());
		
		model1.setAgentPanNo(model2.getAgentPanNo());
		model1.setAgentPhoneNo(model2.getAgentPhoneNo());
		model1.setFirmActivities(model2.getFirmActivities());
		model1.setFirmAddressLine1(model2.getFirmAddressLine1());
		model1.setFirmAddressLine2(model2.getFirmAddressLine2());
		model1.setFirmEmail(model2.getFirmEmail());
		
		model1.setFirmFaxNumber(model2.getFirmFaxNumber());
		model1.setFirmLandLineNo1(model2.getFirmLandLineNo1());
		model1.setFirmLandLineNo1(model2.getFirmLandLineNo1());
		model1.setFirmMobileNo(model2.getFirmMobileNo());
		model1.setFirmName(model2.getFirmName());
		model1.setFirmRegistrationNo(model2.getFirmRegistrationNo());
		model1.setFirmRegistrationType(model2.getFirmRegistrationType());
		
		model1.setLandLineNumber1(model2.getLandLineNumber1());
		model1.setOccupation(model2.getOccupation());
		model1.setPartnerOrDirectorAddressLine1(model2.getPartnerOrDirectorAddressLine1());
		model1.setPartnerOrDirectorAddressLine2(model2.getPartnerOrDirectorAddressLine2());
		model1.setPartnerOrDirectorEmailAddress(model2.getPartnerOrDirectorEmailAddress());
		model1.setPartnerOrDirectorName(model2.getPartnerOrDirectorName());
		
		model1.setPartnerOrDirectorPincode(model2.getPartnerOrDirectorPincode());
		model1.setAgentIndividualPincode(model2.getAgentIndividualPincode());
		model1.setFirmPincode(model2.getFirmPincode());
		model1.setAgentIndividualBussPincode(model2.getAgentIndividualBussPincode());
		
		
		
		
		//model1.setP(model2.getFirmRegistrationType());
		
		
	}
	
	
	@RequestMapping(value="getAgentDetailByPan",method=RequestMethod.GET)
	public @ResponseBody String getAgentDetailforProjectReg( @RequestParam("PANNO")String panNo){
		AgentRegistrationModel agent=null;
		String result=panNo+"~PANNUMBER_ERROR";
		try{
			
			 agent= agentRegistrationService.getAgentByPanNo(panNo);
			 if(agent!=null){
				 result=panNo+"~PANNUMBER_EXIST";		 
			 }else{
				 result=panNo+"~PANNUMBER_NOTEXIST";
			 }
				
			
		}catch(Exception ex){
			ex.printStackTrace();
			result=panNo+"~PANNUMBER_ERROR";
		}
		return result;
		
		
	}
	
	
	
	
	
	
}
