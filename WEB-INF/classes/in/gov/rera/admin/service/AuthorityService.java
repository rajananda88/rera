package in.gov.rera.admin.service;

import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.util.List;

public interface AuthorityService {

	
	public List<Object> getPendingProjectExtReg(String status);
	public List<Object> getPendingProjectExtReg(String status,Long userId);
	
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status);
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status,Long userId);
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status,String type);
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status,String type,Long userId);
	public List<ProjectRegistrationModel> getViewAllProjects();
	public List<ProjectRegistrationModel> getViewAllProjects(String status,String regNo);
	
	
	
	public List<Object> getPendingAgentRegRenewal(String status);
	public List<Object> getPendingAgentRegRenewal(String status,Long userId);
    public List<AgentRegistrationModel> getPendingAgentRegistration(String status);
    public List<AgentRegistrationModel> getPendingAgentRegistration(String status,Long userId);
    public List<AgentRegistrationModel> getPendingAgentRegistration(String status,String type);
    public List<AgentRegistrationModel> getPendingAgentRegistration(String status,String type,Long userId);
	
	public List<AgentRegistrationModel> getViewAllAgents();
	public List<AgentRegistrationModel> getViewAllAgents(String status,String regNo);
	
	public List<ComplaintModel>getPendingComplaint(String status)throws Exception;
	
	public List<ComplaintModel>getPendingComplaint(String status,Long userId)throws Exception;
	
	
	
}
