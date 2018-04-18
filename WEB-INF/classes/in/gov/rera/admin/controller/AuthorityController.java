package in.gov.rera.admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.GenerateRegistrationNumber;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationLog;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "AuthorityController")
@Scope("request")
public class AuthorityController {

	@Autowired
	HttpSession httpSession;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;

	@Autowired
	CommonDao<Object, Long> commonDao;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	DashboardService service;

	@RequestMapping(value = "authority/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.dashbord");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<AgentRegistrationModel> list = authorityService
		.getPendingAgentRegistration(ReraConstants.PENDING_AUTHORITY,
						ReraConstants.INDVISUAL_REG,user.getUserId());
		mv.addObject("AGENT_IND_REQUEST", list!=null? list.size():0);

		list = authorityService.getPendingAgentRegistration(
				ReraConstants.PENDING_AUTHORITY, ReraConstants.FIRM_COMP_REG,user.getUserId());
		mv.addObject("AGENT_FIRM_REQUEST", list!=null? list.size():0);

		List<ProjectRegistrationModel> lst = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_AUTHORITY,
						ReraConstants.INDVISUAL_REG,user.getUserId());
		mv.addObject("PROJECT_IND_REQUEST", lst!=null? lst.size():0);
		lst = authorityService.getPendingProjectRegistration(
				ReraConstants.PENDING_AUTHORITY, ReraConstants.FIRM_COMP_REG,user.getUserId());
		mv.addObject("PROJECT_FIRM_REQUEST", lst!=null? lst.size():0);
		
		request.setAttribute("barData", service.getBarChartData());
		request.setAttribute("pieData", service.getPieChartData());
		request.setAttribute("lineData", service.getLineChartData());
		
		return mv;

	}

	@RequestMapping(value = "authority/projectTasklist")
	public ModelAndView projectTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.projectTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_AUTHORITY,user.getUserId());
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}
	
	
	
	
	

	@RequestMapping(value = "authority/complaintTasklist")
	public ModelAndView approveComplaint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.complaintTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ComplaintModel> list = null;
		try {

			list = authorityService
					.getPendingComplaint(ReraConstants.PENDING_AUTHORITY,user.getUserId());
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());
			
		} catch (Exception e) {

			e.printStackTrace();
		}

		return mv;

	}

	@RequestMapping(value = "authority/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.approvComplaint");

		try {
			ComplaintModel complaintModel = complaintService
					.findComplaintById(Long.parseLong(request
							.getParameter("id")));
			mv.addObject("complaintModel", complaintModel);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;

	}

	@RequestMapping(value = "authority/projectDetails")
	public ModelAndView projectDetails(
			@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectCompDetails");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	@RequestMapping(value = "authority/sendProjectRegEnquiry", method = RequestMethod.POST )
	public ModelAndView sendProjectRegEnquiry(
			@RequestParam(value = "projectId") Long projectId,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			
			EnquiryModel enq=new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
		UserModel user=(UserModel)	httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);
			
			enq.setEmailId(project.getPromoterDetailsModel().getEmailId());
			
			mailService.sendMail(enq);
			if(project.getEnquiryList()==null){
				project.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			project.getEnquiryList().add(enq);
			
			projectRegistrationService.editProjectRegistration(project);
			
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectCompDetails");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	

	@RequestMapping(value = "authority/approveProjectRegistration")
	public ModelAndView approveProjectRegistration(
			@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REMARKS") String remarks,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			project.setStatus(ReraConstants.APPROVED);
			
			StateUtModel state = (StateUtModel) request
					.getAttribute("RERA_STATEUT");
			GenerateRegistrationNumber.generateRegNumber(project, state);
			UserModel user = new UserModel();
			user.setLoginId(project.getProjectRegistrationNo());
			user.setPassword("Welcome@123");
			user.setUserType(ReraConstants.PROJECT_USER);
			user.setStatus(ReraConstants.ACTIVE_USER);
            user.setCreatedOn(Calendar.getInstance());
            user.setEmailId(project.getPromoterDetailsModel().getEmailId());
			user.setUserName(project.getPromoterDetailsModel()
					.getPromoterName());
			project.setProjectUser(user);
			project.setApprovedOn(Calendar.getInstance());
			usr=(UserModel)commonDao.getObject(UserModel.class, usr.getUserId());
			project.setApprovedBy(usr);
			project.setExpireDate(project.getProjectDetailsModel().getCompletionDate());

			projectRegistrationService.editProjectRegistration(project);
  
			mailService.sendProjectRegApproval(project);
			
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.projectCompDetailsPage");
			}
			mv.addObject("project", project);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "authority/agentTasklist")
	public ModelAndView agentTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.agentTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<AgentRegistrationModel> list = authorityService
				.getPendingAgentRegistration(ReraConstants.PENDING_AUTHORITY,  user.getUserId());
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}
	
	
	
	@RequestMapping(value = "authority/sendAgentRegEnquiry", method = RequestMethod.POST )
	public ModelAndView sendAgentRegEnquiry(
			@RequestParam(value = "AGENT_ID") Long agenttId,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			AgentRegistrationModel agent=agentRegistrationService.getAgentRegByPk(agenttId);
			
			EnquiryModel enq=new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
		UserModel user=(UserModel)	httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);
			
			
			if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
				enq.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			}
			else{
				enq.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}
			
			mailService.sendMail(enq);
			if(agent.getEnquiryList()==null){
				agent.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			agent.getEnquiryList().add(enq);
			
			agentRegistrationService.editAgentRegistration(agent);
			
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentCompDetails");
			}
			mv.addObject("agent", agent);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	


	
	
	
	
	

	@RequestMapping(value = "authority/approveAgentRegistration")
	public ModelAndView approveAgentRegistrationStaus(
			@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REMARKS") String remarks,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		UserModel usr=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.APPROVED);
			StateUtModel state = (StateUtModel) request
					.getAttribute("RERA_STATEUT");
			GenerateRegistrationNumber.generateRegNumber(agent, state);
			UserModel user = new UserModel();
			user.setLoginId(agent.getAgentRegistrationNo());
			user.setPassword("Welcome@123");
			user.setCreatedOn(Calendar.getInstance());
			
			user.setUserType(ReraConstants.AGENT_USER);
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				user.setUserName(agent.getAgentDetailsModel().getAgentName());
				user.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				user.setUserName(agent.getAgentDetailsModel().getFirmName());
				user.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}
			
			user.setStatus(ReraConstants.ACTIVE_USER);
			usr=(UserModel)commonDao.getObject(UserModel.class,usr.getUserId());
			agent.setApprovedBy(usr);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setAgentUser(user);
            Calendar exp=Calendar.getInstance();
            exp.set(Calendar.YEAR, exp.get(Calendar.YEAR)+5);
            agent.setExpireDate(exp);
			agentRegistrationService.editAgentRegistration(agent);

			mailService.sendAgentRegApproval(agent);
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.agentCompDetailsPage");
			}
			mv.addObject("agent", agent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "authority/agentDetails")
	public ModelAndView agentDetails(
			@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("authority.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentCompDetails");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	
	@RequestMapping(value = "authority/viewAllAgents")
	public ModelAndView viewAllAgents(HttpServletRequest request,@RequestParam(value="status",required=false) String status,
			@RequestParam(value="regNo",required=false) String regNo) {
		
		ModelAndView mv = new ModelAndView("authority.allAgentlist");
		
		List<AgentRegistrationModel> list = authorityService
				.getViewAllAgents(status,regNo);
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}
	
	
	
	@RequestMapping(value = "authority/viewAllProjects")
	public ModelAndView viewAllProject(HttpServletRequest request,@RequestParam(value="status",required=false) String status,
			@RequestParam(value="regNo",required=false) String regNo) {
		
		ModelAndView mv = new ModelAndView("authority.allProjectlist");
		
		List<ProjectRegistrationModel> list = authorityService
				.getViewAllProjects(status,regNo);
		mv.addObject("projectList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}
	
	
	
	
	@RequestMapping(value = "authority/agentDetailsPage")
	public ModelAndView agentDetailsPage(
			@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("authority.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.agentCompDetailsPage");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	@RequestMapping(value = "authority/projectDetailsPage")
	public ModelAndView projectDetailsPage(
			@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.projectCompDetailsPage");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	
	


	@RequestMapping(value = "authority/revokeAgentRegistration")
	public ModelAndView revokeAgentRegistrationStaus(
			@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REASON") String remarks,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:viewAllAgents");
		try {
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.REVOKED);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setReasonForRevoke(remarks);
			agent.setLastUpdatedOn(Calendar.getInstance());
			agentRegistrationService.editAgentRegistration(agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "authority/revokeProjectRegistration")
	public ModelAndView revokeProjectRegistration(
			@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REASON") String remarks,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:viewAllProjects");
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			project.setStatus(ReraConstants.REVOKED);
					project.setLastUpdatedOn(Calendar.getInstance());
            project.setReasonForRevoke(remarks);
            
			projectRegistrationService.editProjectRegistration(project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	
	
	
	
	@RequestMapping(value = "authority/projectExtTasklist")
	public ModelAndView projectExtTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.projectExtTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingProjectExtReg(ReraConstants.PENDING_AUTHORITY,user.getUserId());
		mv.addObject("projectExtList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	

	@RequestMapping(value = "authority/projectExtDetails")
	public ModelAndView projectExtDetails(
			@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel)commonDao.getObject(ProjectRegExtensionModel.class, projectId);
			if(project.getRegistrationType()==null){
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectExtCompDetails");
			}
			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	@RequestMapping(value = "authority/sendProjectExtEnquiry", method = RequestMethod.POST )
	public ModelAndView sendProjectExtEnquiry(
			@RequestParam(value = "projectId") Long projectId,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao.getObject(ProjectRegExtensionModel.class, projectId);
			
			EnquiryModel enq=new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
		UserModel user=(UserModel)	httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);
			
			enq.setEmailId(project.getProjectRegistration().getPromoterDetailsModel().getEmailId());
			
			mailService.sendMail(enq);
			if(project.getEnquiryList()==null){
				project.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			project.getEnquiryList().add(enq);
			
		   commonDao.updateObject(project);
			
		   
			if(project.getRegistrationType()==null){
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectExtCompDetails");
			}

			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	@RequestMapping(value = "authority/approvedProjectExtRegistration")
	public ModelAndView approvedProjectExtRegistration(
			@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REMARKS") String remarks,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectExtTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
		ProjectRegExtensionModel project = (ProjectRegExtensionModel)commonDao.getObject(ProjectRegExtensionModel.class, projectId);
		project.setStatus(ReraConstants.APPROVED);
		project.setRemarks(remarks);
		project.getProjectRegistration().setExpireDate(project.getExpireDate());
		project.setApprovedOn(Calendar.getInstance());
		user=(UserModel)commonDao.getObject(UserModel.class, user.getUserId());
		project.setApprovedBy(user);
		commonDao.updateObject(project.getProjectRegistration());
		commonDao.updateObject(project);

		mailService.sendProjectRegExtApproval(project);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	
	@RequestMapping(value = "authority/agentRenewalTasklist")
	public ModelAndView agentRenwalTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.agentRenwalTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingAgentRegRenewal(ReraConstants.PENDING_AUTHORITY,user.getUserId());
		
		mv.addObject("agentRenwalList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	
	
	
	
	@RequestMapping(value = "authority/agentRenewalDetails")
	public ModelAndView agentRenewalDetails(
			@RequestParam(value = "AGENTREQ_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("authority.agentDetails");
		try {//AUTHORITYLIST
			AgentRegRenewalModel agent =(AgentRegRenewalModel)commonDao.getObject(AgentRegRenewalModel.class, agentId);
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	

	

	@RequestMapping(value = "authority/sendAgentRegRenewEnquiry", method = RequestMethod.POST )
	public ModelAndView sendAgentRegRenewEnquiry(
			@RequestParam(value = "AGENT_ID") Long agenttId,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			
			
			AgentRegRenewalModel agent=(AgentRegRenewalModel)commonDao.getObject(AgentRegRenewalModel.class, agenttId);
			
			EnquiryModel enq=new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
		UserModel user=(UserModel)	httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);
			
			if(agent.getAgentRegistration().getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
				enq.setEmailId(agent.getAgentRegistration().getAgentDetailsModel().getAgentEmailId());
			}
			else{
				enq.setEmailId(agent.getAgentRegistration().getAgentDetailsModel().getFirmEmail());
			}
		
			
			mailService.sendMail(enq);
			if(agent.getEnquiryList()==null){
				agent.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			agent.getEnquiryList().add(enq);
			
			commonDao.updateObject(agent);
			
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());


		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	

	
	
	@RequestMapping(value = "authority/approveAgentRegRenwal")
	public ModelAndView approveAgentRegRenwal(
			@RequestParam(value = "AGENT_ID") Long agentId,
			
			@RequestParam(value = "REMARKS") String remarks,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("redirect:agentRenewalTasklist");
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			AgentRegRenewalModel agent = (AgentRegRenewalModel)commonDao.getObject(AgentRegRenewalModel.class, agentId);
	      AgentRegistrationLog log=null;
        if(agent.getAgentRegistration().getRegistrationHistory()==null){
        	agent.getAgentRegistration().setRegistrationHistory(new ArrayList<AgentRegistrationLog>());
        	log=new AgentRegistrationLog();
        	log.setAgentRegistration(agent.getAgentRegistration());
        	log.setApprovedBy(agent.getAgentRegistration().getApprovedBy());
        	log.setApprovedOn(agent.getAgentRegistration().getApprovedOn());
        	log.setAssignTo(agent.getAgentRegistration().getAssignTo());
        	log.setCreatedOn(agent.getAgentRegistration().getCreatedOn());
        	log.setExpireDate(agent.getAgentRegistration().getExpireDate());
        	log.setRegPaymentDetailsModel(agent.getAgentRegistration().getAgentDetailsModel().getRegPaymentDetailsModel());
        	log.setStatus(agent.getAgentRegistration().getStatus());
        	agent.getAgentRegistration().getRegistrationHistory().add(log);
        }
        
		agent.setStatus(ReraConstants.APPROVED);
		agent.setApprovedOn(Calendar.getInstance());
	Calendar cal= Calendar.getInstance();
	 cal.setTime(agent.getAgentRegistration().getExpireDate().getTime());
	cal.set(Calendar.YEAR, cal.get(Calendar.YEAR)+5);
		agent.getAgentRegistration().setExpireDate(cal);
       user=(UserModel)commonDao.getObject(UserModel.class, user.getUserId());
       agent.setApprovedBy(user);
        
     		commonDao.updateObject(agent);
        
    	log=new AgentRegistrationLog();
    	log.setAgentRegistration(agent.getAgentRegistration());
    	log.setApprovedBy(agent.getApprovedBy());
    	log.setApprovedOn(agent.getApprovedOn());
    	log.setAssignTo(agent.getAssignTo());
    	log.setCreatedOn(agent.getCreatedOn());
    	log.setExpireDate(agent.getAgentRegistration().getExpireDate());
    	log.setRegPaymentDetailsModel(agent.getRegPaymentDetailsModel());
    	log.setStatus(agent.getStatus());
    	agent.getAgentRegistration().getRegistrationHistory().add(log);
        
        
		commonDao.updateObject(agent.getAgentRegistration());
		
		mailService.sendAgentRegRenewApproval(agent.getAgentRegistration());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	
	

	
	
	
	
	
	 
	 @RequestMapping(value="authority/changePasswordForm")
		public ModelAndView authorityChangePasswordForm(){
		
			ModelAndView mv=null;
			
				mv=new ModelAndView("authority.changePassword");
		
						return mv;
		}
	
	
}
