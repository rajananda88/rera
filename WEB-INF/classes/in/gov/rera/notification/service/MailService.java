package in.gov.rera.notification.service;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;


@Service(value="MailService")
@Scope(value="request",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class MailService {

	public void sendprojectRegConfirmation(ProjectRegistrationModel project){
		EmailNotification email=new EmailNotification();
		email.setSubject("Project Registration submitted successfuly.");
		StringBuffer sb=new StringBuffer();
		if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}else{
		sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration of your project '"+project.getProjectDetailsModel().getProjectName()+"' is submited.");
		sb.append("\n").append("\n").append("\n");
		
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	

	
	
	
	public void sendProjectRegApproval(ProjectRegistrationModel project){
		EmailNotification email=new EmailNotification();
		email.setSubject("Project Registration Approved.");
		StringBuffer sb=new StringBuffer();
		if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}else{
		sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration of your project '"+project.getProjectDetailsModel().getProjectName()+"' has been approved.");
		sb.append("Below is the credential for login in rera portal for manage/update your project status.");
		sb.append("\n");
		sb.append("Login ID/Registration No.: ").append(project.getProjectRegistrationNo()).append("\n");
        sb.append("Password: ").append(project.getProjectUser().getPassword());
		sb.append("\n").append("\n").append("\n");
		
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	

	
	public void sendProjectRegExtApproval(ProjectRegExtensionModel model){
		ProjectRegistrationModel project=model.getProjectRegistration();
		EmailNotification email=new EmailNotification();
		email.setSubject("Extension request for Project Registration No. "+project.getProjectRegistrationNo()+"   ");
		StringBuffer sb=new StringBuffer();
		if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}else{
		sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
	}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your  extension application for  project registration no. '"+project.getProjectRegistrationNo()+"' has been approved.");
		
		
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	public void sendAgentRegConfirmation(AgentRegistrationModel agent){
		EmailNotification email=new EmailNotification();
		email.setSubject("Real Estate Agent Registration submitted successfuly.");
		StringBuffer sb=new StringBuffer();
		System.out.println("agent.getRegistrationType()" +agent.getRegistrationType());
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
		} else {
		sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration as real estate agent is submited.");
		sb.append("\n").append("\n").append("\n");
		
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	
	public void sendAgentRegApproval(AgentRegistrationModel agent){
		EmailNotification email=new EmailNotification();
		email.setSubject("Real Estate Agent Registration Approved.");
		StringBuffer sb=new StringBuffer();
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
	}else{
		sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
	}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration as real estate agent has been approved.");
		sb.append("\n");
		
		sb.append("Below is the credential for login in rera portal for manage/update your rera account.");
		sb.append("\n");
		sb.append("Login ID/Registration No.: ").append(agent.getAgentRegistrationNo()).append("\n");
        sb.append("Password: ").append(agent.getAgentUser().getPassword());
		sb.append("\n").append("\n").append("\n");
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	
	public void sendAgentRegRenewApproval(AgentRegistrationModel agent){
		EmailNotification email=new EmailNotification();
		email.setSubject("Real Estate Agent Registration Renewal .");
		StringBuffer sb=new StringBuffer();
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
	}else{
		sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
	}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for renewal of  real estate agent registration no."+agent.getAgentRegistrationNo()+" has been approved.");
		sb.append("\n");
		sb.append("\n").append("\n").append("\n");
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority").append("\n");
		sb.append("Bihar");
		email.setBodyContent(sb.toString());
		if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
	public void sendMail(EnquiryModel enq){
		EmailNotification email=new EmailNotification();
		email.setSubject(enq.getSubject());
		
		
		email.setBodyContent(enq.getEnquiryText());
		email.setSendTo(enq.getEmailId());
		
		EmailSender sender=new EmailSender(email);
		sender.start();
		
	}
	
}
