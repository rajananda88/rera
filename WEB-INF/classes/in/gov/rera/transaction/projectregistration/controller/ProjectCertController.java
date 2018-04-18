package in.gov.rera.transaction.projectregistration.controller;



import in.gov.rera.common.util.ProjectCertificateUtil;
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


@Controller(value = "ProjectCertController")
@Scope("request")
public class ProjectCertController {

	@Autowired
	HttpSession httpSession;
	
	private ProjectRegistrationModel project;

	@Autowired
	private IProjectRegistrationService service;
	
    @RequestMapping(value="projectCert")
	public void projectCert(@RequestParam("PID") Long pid, HttpServletResponse response){
		try{
			response.setContentType("application/pdf");
		this.project=service.getProjectRegByPk(pid);
		ProjectCertificateUtil util=new ProjectCertificateUtil(this.project);
		util.generateProjectCertificate(response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	
	}
	
	
	
}
