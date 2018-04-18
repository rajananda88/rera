package in.gov.rera.common.scheduler;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value="RScheduler")
public class RScheduler extends Thread{

	@Autowired
	SessionFactory sessionFactory;
	
	Session session;
	
	public void run(){
		
		while(true){
		try{
			session=sessionFactory.openSession();
			
			deleteDraftAgent();
			deleteDraftProject();
			checkExpiryDate();
			
			if(session!=null && session.isOpen())
			session.close();
		//	sleep(60*1000);
				sleep(24*60*60*1000);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		}
		
	}
	
	
	private void checkExpiryDate(){
		try{
	
		Calendar cal=Calendar.getInstance();
		Query q=session.createQuery("Select p from ProjectRegistrationModel p where p.status=:st and ( p.expireDate is null or p.expireDate<:cal)");
		q.setString("st", ReraConstants.APPROVED);
		q.setCalendar("cal", cal);
		
	 List<Object> lst=	q.list();
	 System.out.println(" checkExpiryDate of projects "+lst);
		for(Object ob:lst){
			Transaction trx=	session.beginTransaction();
			ProjectRegistrationModel pm=(ProjectRegistrationModel)ob;
			pm.setStatus(ReraConstants.EXPIRED);
			pm.getProjectUser().setStatus(ReraConstants.INACTIVE_USER);
			session.update(pm);
			trx.commit();
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			
			Calendar cal=Calendar.getInstance();
			
			Query q=session.createQuery("Select p from AgentRegistrationModel p where p.status=:st and ( p.expireDate is null or p.expireDate<:cal)");
			q.setString("st", ReraConstants.APPROVED);
			q.setCalendar("cal", cal);
			
		 List<Object> lst=	q.list();
		
		 System.out.println(" checkExpiryDate of agents "+lst);
		for(Object ob:lst){
			Transaction trx=	session.beginTransaction();
			AgentRegistrationModel pm=(AgentRegistrationModel)ob;
			pm.setStatus(ReraConstants.EXPIRED);
			pm.getAgentUser().setStatus(ReraConstants.INACTIVE_USER);
			session.update(pm);
			trx.commit();
		}
		}
		catch (Exception e) {
		e.printStackTrace();
		}
	}
	
	private void deleteDraftProject(){
		try{
	
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
		System.out.println("DDDDDDDDDDDDDDDDDDDDDDDDDDDD"+cal.getTime()); 
		Query q=session.createQuery("Select p from ProjectRegistrationModel p where p.status=:st and  p.createdOn<:cal");
		q.setString("st", ReraConstants.SAVE_AS_DRAFT);
		q.setCalendar("cal", cal);
		 List<Object> lst=	q.list();
	List lst2=new ArrayList(lst);
	 System.out.println(" delete  draft projects "+lst);
		for(Object ob:lst2){
			Transaction trx=	session.beginTransaction();
			trx.commit();
			session.delete(ob);
		}
		}catch (Exception e) {
		e.printStackTrace();
		}
	}
     private void deleteDraftAgent(){
		try{
    	
 		Calendar cal=Calendar.getInstance();
 		cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
 		Query q=session.createQuery("Select p from AgentRegistrationModel p where p.status=:st and  p.createdOn<:cal");
		q.setString("st", ReraConstants.SAVE_AS_DRAFT);
		q.setCalendar("cal", cal);
		 List<Object> lst=	q.list();
		 List lst2=new ArrayList(lst);
 	 System.out.println(" delete  draft agents "+lst);
 		for(Object ob:lst2){
 		Transaction trx=	session.beginTransaction();
 			session.delete(ob);
 			trx.commit();
 		}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
public static void main(String[] args) {

	Calendar cal=Calendar.getInstance();
	cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
	System.out.println("DDDDDDDDDDDDDDDDDDDDDDDDDDDD"+cal.getTime()); 
}     
}
