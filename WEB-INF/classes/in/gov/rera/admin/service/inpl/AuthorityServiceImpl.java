package in.gov.rera.admin.service.inpl;

import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value="authorityService")
public class AuthorityServiceImpl implements AuthorityService{

	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> projectRegistrationDAO;
	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel,Long> agentRegistrationDAO;
	
	
	@Autowired
	IComplaintDAO<ComplaintModel, Long>complaintDAO;
	
	
	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
	
		return projectRegistrationDAO.getProjectList(dt);
	}
	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status,Long userId) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add( Restrictions.eq("assignTo.userId", userId));
		Disjunction disjunction = Restrictions.disjunction();
		return projectRegistrationDAO.getProjectList(dt);
	}

	

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status,String type) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add( Restrictions.eq("status", status));
		dt.add( Restrictions.eq("registrationType", type));
	
		return projectRegistrationDAO.getProjectList(dt);
	}

	
	@Override
	public List<ProjectRegistrationModel> getViewAllProjects() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectRegistrationModel> getViewAllProjects(String status,String regNo) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		if(status!=null && !status.equals("0")){
			dt.add(Restrictions.eq("status", status));
		}
		if(regNo!=null){
			dt.add(Restrictions.eq("projectRegistrationNo", regNo));
		}
		return projectRegistrationDAO.getProjectList(dt);
	}
	
	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status,String type) {
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add( Restrictions.eq("status", status));
		dt.add( Restrictions.eq("registrationType", type));
	
		return agentRegistrationDAO.getAgentList(dt);
	}
	
	
	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status,String type,Long userId) {
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add( Restrictions.eq("status", status));
		dt.add( Restrictions.eq("registrationType", type));
		dt.add( Restrictions.eq("assignTo.userId", userId));
		return agentRegistrationDAO.getAgentList(dt);
	}
	
	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status) {
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
	
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status,Long userId) {
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add( Restrictions.eq("assignTo.userId", userId));
		return agentRegistrationDAO.getAgentList(dt);
	}
	@Override
	public List<AgentRegistrationModel> getViewAllAgents() {
		// TODO Auto-generated method stub
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getViewAllAgents(String status,String regNo) {
		// TODO Auto-generated method stub
		DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class);
		if(status!=null && !status.equals("0")){
			dt.add(Restrictions.eq("status", status));
		}
		if(regNo!=null){
			dt.add(Restrictions.eq("agentRegistrationNo", regNo));
		}
		
		return agentRegistrationDAO.getAgentList(dt);
	}


	@Override
	public List<ComplaintModel> getPendingComplaint(String status) throws Exception {
		DetachedCriteria dt= DetachedCriteria.forClass(ComplaintModel.class);
		dt.add( Restrictions.eq("status", status));
		dt.addOrder(Order.asc("complaintDate"));
		return complaintDAO.getComplaintList(dt);
	}


	@Override
	public List<ComplaintModel> getPendingComplaint(String status,Long userId) throws Exception {
		DetachedCriteria dt= DetachedCriteria.forClass(ComplaintModel.class);
		dt.add( Restrictions.eq("status", status));
		dt.add( Restrictions.eq("assignTo.userId", userId));
		dt.addOrder(Order.asc("complaintDate"));
		return complaintDAO.getComplaintList(dt);
	}
	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, String type, Long userId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Object> getPendingProjectExtReg(String status) {
		DetachedCriteria dt=DetachedCriteria.forClass(ProjectRegExtensionModel.class);
		dt.add(Restrictions.eq("status", status));
		return dao.getList(dt);
	}
	@Override
	public List<Object> getPendingProjectExtReg(
			String status, Long userId) {
		DetachedCriteria dt=DetachedCriteria.forClass(ProjectRegExtensionModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("assignTo.userId", userId));
		return dao.getList(dt);
	}
	@Override
	public List<Object> getPendingAgentRegRenewal(String status) {
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegRenewalModel.class);
		dt.add(Restrictions.eq("status", status));
		return dao.getList(dt);
	
	}
	@Override
	public List<Object> getPendingAgentRegRenewal(String status, Long userId) {
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegRenewalModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("assignTo.userId", userId));
		return dao.getList(dt);
	}
	
	@Autowired
CommonDao<Object, Long> dao;
	
}
