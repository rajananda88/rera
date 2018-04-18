package in.gov.rera.admin.controller;


import java.util.List;
import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "OperaterController")
@Scope("request")
public class OperaterController {

	@Autowired
	HttpSession httpSession;

	@Autowired
	AuthorityService authorityService;
	
	@Autowired
	LoginService userService;
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;
	
	@Autowired
	DashboardService service;

	@RequestMapping(value = "operator/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.dashbord");
		List<AgentRegistrationModel> list = authorityService
		.getPendingAgentRegistration(ReraConstants.PENDING_OPRATOR,
						ReraConstants.INDVISUAL_REG);
		mv.addObject("AGENT_IND_REQUEST", list.size());

		list = authorityService.getPendingAgentRegistration(
				ReraConstants.PENDING_OPRATOR, ReraConstants.FIRM_COMP_REG);
		mv.addObject("AGENT_FIRM_REQUEST", list.size());

		List<ProjectRegistrationModel> lst = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR,
						ReraConstants.INDVISUAL_REG);
		mv.addObject("PROJECT_IND_REQUEST", lst.size());
		lst = authorityService.getPendingProjectRegistration(
				ReraConstants.PENDING_OPRATOR, ReraConstants.FIRM_COMP_REG);
		mv.addObject("PROJECT_FIRM_REQUEST", lst.size());
		
		
		
		request.setAttribute("barData", service.getBarChartData());
		request.setAttribute("pieData", service.getPieChartData());
		request.setAttribute("lineData", service.getLineChartData());
		
		
		return mv;

	}

	@RequestMapping(value = "operator/projectTasklist")
	public ModelAndView projectTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.projectTasklist");
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}
	
	
	
		
	

	@RequestMapping(value = "operator/complaintTasklist")
	public ModelAndView approveComplaint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.complaintTasklist");
		List<ComplaintModel> list = null;
		try {

			list = authorityService
					.getPendingComplaint(ReraConstants.PENDING_OPRATOR);
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());
			
		} catch (Exception e) {

			e.printStackTrace();
		}

		return mv;

	}

	
	@RequestMapping(value = "operator/forwardComplaint")
	public ModelAndView forwardComplaint(@RequestParam(value = "COMPLAINT_ID") Long complainttId,
		
			@RequestParam(value = "ASSIGN_TO") Long assignTo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect: complaintTasklist");

		try {
			ComplaintModel complaintModel = complaintService.findComplaintById(complainttId);
			UserModel user=userService.getUserById(assignTo);
			complaintModel.setAssignTo(user);
			complaintModel.setStatus(ReraConstants.PENDING_AUTHORITY);
			complaintService.updateComplaint(complaintModel);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;

	}

	
	@RequestMapping(value = "operator/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.approvComplaint");

		try {
			ComplaintModel complaintModel = complaintService
					.findComplaintById(Long.parseLong(request
							.getParameter("id")));
			mv.addObject("complaintModel", complaintModel);
			mv.addObject("AUTHORITYLIST",userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;

	}

	@RequestMapping(value = "operator/projectDetails")
	public ModelAndView projectDetails(
			@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.projectIndvDetails");
			} else {
				mv = new ModelAndView("operator.projectCompDetails");
			}
			mv.addObject("AUTHORITYLIST",userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
			mv.addObject("project", project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	
	
	

	@RequestMapping(value = "operator/forwardProjectRegistration")
	public ModelAndView forwardProjectRegistration(
			@RequestParam(value = "PROJECT_ID") Long projectId,
		
			@RequestParam(value = "ASSIGN_TO") Long assignTo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(projectId);
			project.setStatus(ReraConstants.PENDING_AUTHORITY);
		UserModel user=userService.getUserById(assignTo);
		project.setAssignTo(user);
			projectRegistrationService.editProjectRegistration(project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "operator/agentTasklist")
	public ModelAndView agentTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.agentTasklist");
		List<AgentRegistrationModel> list = authorityService
				.getPendingAgentRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}
	
	
	

	@RequestMapping(value = "operator/fowardAgentRegistration")
	public ModelAndView forwardAgentRegistrationStaus(
			@RequestParam(value = "AGENT_ID") Long agentId,
			
			@RequestParam(value = "ASSIGN_TO") Long assignTo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		try {
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.PENDING_AUTHORITY);
		UserModel user=userService.getUserById(assignTo);
		agent.setAssignTo(user);

			agentRegistrationService.editAgentRegistration(agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "operator/agentDetails")
	public ModelAndView agentDetails(
			@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("operator.agentDetails");
		try {//AUTHORITYLIST
			AgentRegistrationModel agent = agentRegistrationService
					.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.agentIndvDetails");
			} else {
				mv = new ModelAndView("operator.agentCompDetails");
			}
			mv.addObject("agent", agent);
		mv.addObject("AUTHORITYLIST",userService.getUserListByRole(ReraConstants.AUTHORITY_USER));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	

	
	@RequestMapping(value = "operator/viewAllAgents")
	public ModelAndView viewAllAgents(HttpServletRequest request,@RequestParam(value="status",required=false) String status,
			@RequestParam(value="regNo",required=false) String regNo) {
		
		ModelAndView mv = new ModelAndView("operator.allAgentlist");
		
		List<AgentRegistrationModel> list = authorityService
				.getViewAllAgents(status,regNo);
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}
	
	
	
	@RequestMapping(value = "operator/viewAllProjects")
	public ModelAndView viewAllProject(HttpServletRequest request,@RequestParam(value="status",required=false) String status,
			@RequestParam(value="regNo",required=false) String regNo) {
		
		ModelAndView mv = new ModelAndView("operator.allProjectlist");
		
		List<ProjectRegistrationModel> list = authorityService
				.getViewAllProjects(status,regNo);
		mv.addObject("projectList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}
	
	
	
	
	
	
	
	@RequestMapping(value = "operator/projectExtTasklist")
	public ModelAndView projectExtTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.projectExtTasklist");
		List<Object> list = authorityService.getPendingProjectExtReg(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectExtList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	

	@RequestMapping(value = "operator/projectExtDetails")
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
				mv = new ModelAndView("operator.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("operator.projectExtCompDetails");
			}
			mv.addObject("AUTHORITYLIST",userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	@RequestMapping(value = "operator/forwardProjectExtRegistration")
	public ModelAndView forwardProjectExtRegistration(
			@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "ASSIGN_TO") Long assignTo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel)commonDao.getObject(ProjectRegExtensionModel.class, projectId);
			project.setStatus(ReraConstants.PENDING_AUTHORITY);
		UserModel user=userService.getUserById(assignTo);
		project.setAssignTo(user);
		commonDao.updateObject(project);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	
	@RequestMapping(value = "operator/agentRenewalTasklist")
	public ModelAndView agentRenwalTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.agentRenwalTasklist");
		List<Object> list = authorityService.getPendingAgentRegRenewal(ReraConstants.PENDING_OPRATOR);
		mv.addObject("agentRenwalList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	
	
	
	
	@RequestMapping(value = "operator/agentRenewalDetails")
	public ModelAndView agentRenewalDetails(
			@RequestParam(value = "AGENTREQ_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("operator.agentReqIndvDetails");
		try {//AUTHORITYLIST
			AgentRegRenewalModel agent =(AgentRegRenewalModel)commonDao.getObject(AgentRegRenewalModel.class, agentId);
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(
					ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("operator.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());
	     	mv.addObject("AUTHORITYLIST",userService.getUserListByRole(ReraConstants.AUTHORITY_USER));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	

	
	
	@RequestMapping(value = "operator/fowardAgentRegRenwal")
	public ModelAndView fowardAgentRegRenwal(
			@RequestParam(value = "AGENT_ID") Long agentId,
			
			@RequestParam(value = "ASSIGN_TO") Long assignTo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentRenewalTasklist");
		try {
			AgentRegRenewalModel agent = (AgentRegRenewalModel)commonDao.getObject(AgentRegRenewalModel.class, agentId);
			agent.setStatus(ReraConstants.PENDING_AUTHORITY);
		UserModel user=userService.getUserById(assignTo);
		agent.setAssignTo(user);

		commonDao.updateObject(agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	
	
	
	
	
	
	
	
	
	 @RequestMapping(value="operator/changePasswordForm")
		public ModelAndView changePasswordForm(){

		
			ModelAndView mv=null;
			
				mv=new ModelAndView("operator.changePassword");
		
						return mv;
		}
	
	
}

	
	
	

