package in.gov.rera.transaction.agentregistration.controller;

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller(value="AgentUserController")
@Scope("request")
public class AgentUserController {

	@Autowired
	IAgentUserService<AgentRegistrationModel,Long> agentService;
	
	@Autowired
	CommonDao<Object, Long> dao;
	
	@Autowired
	ContentUtil contentUtil;
	
	@Autowired
	DocumentService documentService;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	IBankService<BankModel, Long> bankService;
	
	AgentRegistrationModel agentReg;
	
	 @RequestMapping(value="agent/dashboard")
	public ModelAndView dashboard(){
		populateAgent();
		ModelAndView mv=null;
		if(agentReg.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv=new ModelAndView("agent.dashbordIndv");
		}
		else{
			mv=new ModelAndView("agent.dashbordComp");
		}
		mv.addObject("agentReg",agentReg);
		return mv;
	}
	
	 @RequestMapping(value="agent/agentDocumentPage")
		public ModelAndView agentDocumentPage(){
			populateAgent();
			ModelAndView mv=null;
			
				mv=new ModelAndView("agent.agentDocuments");
		
			mv.addObject("agentReg",agentReg);
			return mv;
		}
	
	 @RequestMapping(value="agent/paymentDetailsPage")
		public ModelAndView paymentDetailsPage(){
			populateAgent();
			ModelAndView mv=null;
			
				mv=new ModelAndView("agent.paymentDetails");
		
			mv.addObject("agentReg",agentReg);
			return mv;
		}
	
	 @RequestMapping(value="agent/projectListPage")
		public ModelAndView projectList(){
			populateAgent();
			ModelAndView mv=null;
			
				mv=new ModelAndView("agent.projectList");
		
			mv.addObject("agentReg",agentReg);
			return mv;
		}
	
	 
	 @RequestMapping(value="agent/changePasswordForm")
		public ModelAndView changePasswordForm(){
			populateAgent();
			ModelAndView mv=null;
			
				mv=new ModelAndView("agent.changePassword");
		
			mv.addObject("agentReg",agentReg);
			return mv;
		}
	 
	 @RequestMapping(value="agent/openRenewalForm")
	 public ModelAndView openRenewalForm(){
		 populateAgent();
			ModelAndView mv=null;
		int fee=(int)(double)	agentReg.getAgentDetailsModel().getRegPaymentDetailsModel().getAmount();
			fee=fee/2;
			
			mv=new ModelAndView("agent.regRenewalForm");
			try{
			mv.addObject("regFee",fee);
			mv.addObject("bankList",bankService.getBankList());
			mv.addObject("agentReq",new AgentRegRenewalModel());
			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
	 }
	 
	 
	 
	 @RequestMapping(value="agent/saveAgentRegRenewalReq")
		public ModelAndView saveAgentRegRenewalReq(@ModelAttribute("agentReq") AgentRegRenewalModel model,
				@RequestParam("scanCopyDoc")MultipartFile scanCopy,
	   			@RequestParam(value="captions",required=false)String [] captions,
	   			@RequestParam(value="attachments",required=false)MultipartFile[] files,
	   			@RequestParam("bankName")Long bankId){
			populateAgent();
			ModelAndView 	mv=new ModelAndView("redirect:confirmationPage");;
			model.setCreatedOn(Calendar.getInstance());
	    	model.setStatus(ReraConstants.PENDING_OPRATOR);
	    	model.setAgentRegistration(agentReg);
	    	try{
	    		BankModel bank=bankService.getBankById(bankId);
	    		model.getRegPaymentDetailsModel().setBankModel(bank);
	    		
	    	if(scanCopy!=null && !scanCopy.isEmpty()){
	    		Document doc=new Document();
	    		doc.setFileName(scanCopy.getOriginalFilename());
	    		doc.setInputStream(scanCopy.getInputStream());
	    		doc.setFolderId(agentReg.getAgentRegistrationID()+"");
	    		doc.setMimeType(scanCopy.getContentType());
	    		doc.setDocumentType("AGENT");
	    		contentUtil.saveDocument(doc);
	    		documentService.saveDoc(doc);
	    		model.getRegPaymentDetailsModel().setAttachScanCopy(doc);
	    	}
	    	if(files!=null && files.length>0){
	    		Set<Document> docs=new HashSet<Document>();
	    		int xx=0;
	    		for(MultipartFile file:files){
	    			if(!file.isEmpty()){
	    			Document doc=new Document();
	        		doc.setFileName(file.getOriginalFilename());
	        		doc.setCaption(captions[xx]);
	        		doc.setInputStream(file.getInputStream());
	        		doc.setFolderId(agentReg.getAgentRegistrationID()+"");
	        		doc.setMimeType(file.getContentType());
	        		doc.setDocumentType("AGENT");
	        		contentUtil.saveDocument(doc);
	        		documentService.saveDoc(doc);
	        		docs.add(doc);
	    			}
	        		xx++;
	    		}
	    		model.setSupportingDocs(docs);
	    	}
	    	
	    	}
	    	catch (Exception e) {
			e.printStackTrace();
			}
	    	dao.saveObject(model);
			
		
			mv.addObject("agentReg",agentReg);
			return mv;
		}
	
	
	    
	    @RequestMapping(value="agent/confirmationPage")
	    public ModelAndView confirmationPage(){
	    	ModelAndView mv=new ModelAndView("agent.confirmationPage");
	    	
	    	return mv;
	    	
	    }
	    

	
	
	
	
	private void populateAgent(){
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		agentReg=agentService.getAgentByRegNo(user.getLoginId());
	}
}
