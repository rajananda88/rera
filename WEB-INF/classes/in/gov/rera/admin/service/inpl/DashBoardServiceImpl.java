package in.gov.rera.admin.service.inpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;


@Service(value="DashBoardServiceImpl")
public class DashBoardServiceImpl implements DashboardService {

	@Autowired
	private CommonDao<Object,Long> dao;
	
	@Override
	public Map<String,String> getPieChartData() {
		int cheque=0,dd=0,online=0;
		Map<String,String> data= new HashMap<String, String>();    
	try{	
		String str="Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
		Query query=dao.getQuery(str);
		query.setString("mode", "Banker's Cheque");
		List<Object> ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			cheque+=((int)(long)(Long)ls.get(0));
		}
		
		
		 str="Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Banker's Cheque");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			cheque+=((int)(long)(Long)ls.get(0));
		}
		
			
		 str="Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Banker's Cheque");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			cheque+=((int)(long)(Long)ls.get(0));
		}
		
		
		
		
		 str="Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Payment Gateway");
	     ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			online+=((int)(long)(Long)ls.get(0));
		}
		
		
		 str="Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Payment Gateway");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			online+=((int)(long)(Long)ls.get(0));
		}
		
			
		 str="Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Payment Gateway");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			online+=((int)(long)(Long)ls.get(0));
		}
		
		
		
		
		
		 str="Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Demand Draft");
 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			dd+=((int)(long)(Long)ls.get(0));
		}
		
		
		 str="Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Demand Draft");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			dd+=((int)(long)(Long)ls.get(0));
		}
		
			
		 str="Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
		 query=dao.getQuery(str);
		query.setString("mode", "Demand Draft");
		 ls=query.list();
		if(ls!=null && ls.size()>0 && ls.get(0)!=null){
			dd+=((int)(long)(Long)ls.get(0));
		}
		
		data.put("online", online+"");
		
		data.put("cheque", cheque+"");
		
		data.put("dd", dd+"");
		
		
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		
		return data;
	}

	@Override
	public List<Object> getLineChartData() {
		int xx=0;
	
		List<Object> lst=new ArrayList<Object>();
		Map<String, String> data=null;
		try{
		while(xx<6){
			data=new HashMap<String, String>();
			Calendar cl=Calendar.getInstance();
			cl.add(Calendar.MONTH, -xx);
			int year=cl.get(Calendar.YEAR);
			int mnth=cl.get(Calendar.MONTH)+1;
			if(mnth<10){
				data.put("mYear",year+"-0"+mnth);
			}else{
			data.put("mYear",year+"-"+mnth);}
			
			String str="Select count(p.projectRegId) from ProjectRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
			Query query=dao.getQuery(str);
			query.setInteger("emonth", mnth);
			query.setInteger("eyear", year);
			List<Object> ls=query.list();
			if(ls!=null && ls.size()>0){
				data.put("project", ls.get(0).toString());
			}else{
				data.put("project", "0");
			}
			
			 str="Select count(p.agentRegistrationID) from AgentRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
				 query=dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				 ls=query.list();
				if(ls!=null && ls.size()>0){
					data.put("agent", ls.get(0).toString());
				}else{
					data.put("agent", "0");
				}
				
			
				 str="Select count(p.compId) from ComplaintModel p where MONTH(p.complaintDate) =:emonth and YEAR(p.complaintDate) =:eyear";
				 query=dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				 ls=query.list();
				if(ls!=null && ls.size()>0){
					data.put("complaint", ls.get(0).toString());
				}else{
					data.put("complaint", "0");
				}
				
			
			lst.add(data);
			xx++;
			
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<Object> getBarChartData() {
		int xx=0;
	
		List<Object> lst=new ArrayList<Object>();
		Map<String, String> data=null;
		try{
		while(xx<6){
			data=new HashMap<String, String>();
			Calendar cl=Calendar.getInstance();
			cl.add(Calendar.MONTH, -xx);
			int year=cl.get(Calendar.YEAR);
			int mnth=cl.get(Calendar.MONTH)+1;
			
			if(mnth<10){
				data.put("mYear",year+"-0"+mnth);
			}else{
			data.put("mYear",year+"-"+mnth);}
			
			String str="Select sum(p.paymentDetailsModel.amount) from ProjectRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
			Query query=dao.getQuery(str);
			query.setInteger("emonth", mnth);
			query.setInteger("eyear", year);
			List<Object> ls=query.list();
			if(ls!=null && ls.size()>0 && ls.get(0)!=null){
				data.put("project", ls.get(0).toString());
			}else{
				data.put("project", "0.0");
			}
			
			 str="Select sum(p.agentDetailsModel.regPaymentDetailsModel.amount) from AgentRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
				 query=dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				 ls=query.list();
				if(ls!=null && ls.size()>0 && ls.get(0)!=null){
					data.put("agent", ls.get(0).toString());
				}else{
					data.put("agent", "0.0");
				}
				
			
				 str="Select sum(p.complaintPaymentDetailsModel.amount) from ComplaintModel p where MONTH(p.complaintDate) =:emonth and YEAR(p.complaintDate) =:eyear";
				 query=dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				 ls=query.list();
				if(ls!=null && ls.size()>0 && ls.get(0)!=null){
					data.put("complaint", ls.get(0).toString());
				}else{
					data.put("complaint", "0.0");
				}
				
			
			
				
				lst.add(data);
				xx++;
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lst;
	}

	
	public static void main(String[] args) {
	Calendar c=	Calendar.getInstance(); 
		System.out.println(c.get(Calendar.MONTH));
		System.out.println(c.get(Calendar.YEAR));
	}
}
