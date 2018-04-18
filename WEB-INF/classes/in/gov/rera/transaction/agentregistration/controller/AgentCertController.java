package in.gov.rera.transaction.agentregistration.controller;



import in.gov.rera.common.util.AgentCertificateUtil;
import in.gov.rera.common.util.ProjectCertificateUtil;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller(value = "AgentCertController")
@Scope("request")
public class AgentCertController {

	@Autowired
	HttpSession httpSession;
	
	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> service;
	
    @RequestMapping(value="agentCert")
	public void agentCert(@RequestParam("AID") Long pid, HttpServletResponse response){
		try{
			response.setContentType("application/pdf");
		AgentRegistrationModel agent=service.getAgentRegByPk(pid);
		AgentCertificateUtil util=new AgentCertificateUtil(agent);
		util.generateAgentCertificate(response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	
	}
	
	
	
}
