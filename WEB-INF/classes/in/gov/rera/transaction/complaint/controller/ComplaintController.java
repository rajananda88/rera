package in.gov.rera.transaction.complaint.controller;

import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.model.ComplaintPaymentDetailsModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller("ComplaintController")
@Scope(value="request")
public class ComplaintController {
	
	@Autowired
    IBankService<BankModel ,Long> bankService;
	
	@Autowired
	IComplaintService <ComplaintModel,Long>complaintService;
	
	@Autowired
	IStateUtService<StateUtModel, Long>stateUtService;
	
	@Autowired
	IDistrictDAO<DistrictModel, Long>districtDAO;
	
	
	@Autowired
	HttpSession httpSession;

	@RequestMapping(value="complaintForm")
	public ModelAndView complaintForm(@ModelAttribute("complaintModel") ComplaintModel complaintModel,BindingResult result){
		
		ModelAndView mv = null;
		try{
			mv = new ModelAndView("complaintForm");
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			mv.addObject("bankList", bankService.getBankList());
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	
	@RequestMapping(value="saveComplaint",method=RequestMethod.POST)
	public ModelAndView saveComplaint(@ModelAttribute("complaintModel") ComplaintModel complaintModel,
			@RequestParam(value="captions",required=false)String[] captions,
			@RequestParam(value="supportDoc",required=false)MultipartFile[] supportDoc,
			@RequestParam("attachScanCopy") MultipartFile attachScanCopy,
			HttpServletRequest request){
		ModelAndView mv = null;
		try{
			
			complaintModel.setAppResdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("applicantDistrictId").toString())));
			complaintModel.setAppResSameAsdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("resSameAsDistrictId").toString())));
			complaintModel.setRespondentdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("respondentDistrictId").toString())));
			complaintModel.setRespondentSameAsdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("respondentSameAsdistrict").toString())));
						
			
				
			ComplaintPaymentDetailsModel complaintPaymentDetailsModel=new ComplaintPaymentDetailsModel();
			if(!request.getParameter("paymentmode").trim().equals("Payment Gateway".trim())){
				complaintPaymentDetailsModel.setBankModel(bankService.getBankById(Long.parseLong(request.getParameter("bankName"))));
				complaintPaymentDetailsModel.setAmount(Double.parseDouble(request.getParameter("amount")));
				complaintPaymentDetailsModel.setBranch(request.getParameter("bankbranch"));
				complaintPaymentDetailsModel.setDdOrChequeNo(request.getParameter("ddChequeNo"));
				
			}
			
			complaintPaymentDetailsModel.setPaymentMode(request.getParameter("paymentmode"));
			
			complaintModel.setComplaintPaymentDetailsModel(complaintPaymentDetailsModel);
			complaintService.saveComplaint(complaintModel, supportDoc,captions,  attachScanCopy);
			
			mv = new ModelAndView("redirect:/confirmComplaintPayment");
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	
	
	@RequestMapping(value="confirmComplaintPayment")
	public ModelAndView confirmComplaintPayment(@ModelAttribute("complaintModel") ComplaintModel complaintModel){
		
		ModelAndView mv = null;
		try{
			mv = new ModelAndView("complaintConfirmForm");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return mv;
		
	}
	
	

}
