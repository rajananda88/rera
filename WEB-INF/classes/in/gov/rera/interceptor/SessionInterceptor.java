package in.gov.rera.interceptor;

import java.util.ResourceBundle;

import in.gov.rera.common.model.VisitorsModel;
import in.gov.rera.common.scheduler.RScheduler;
import in.gov.rera.common.util.HibernateSession;
import in.gov.rera.common.util.VisitorUtil;
import in.gov.rera.master.stateut.dao.IStateUtDAO;
import in.gov.rera.master.stateut.dao.impl.StateUtDAOImpl;
import in.gov.rera.master.stateut.model.StateUtModel;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.VisitorSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor  extends HandlerInterceptorAdapter{
 
	
	private static ResourceBundle bundle;
	
	@Autowired
	private IStateUtDAO<StateUtModel, Long> stateDao;
	
	@Autowired
	private VisitorUtil visitorUtil;
	
	@Autowired
	RScheduler scheduler;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if(bundle==null){
			System.out.println("scheduler.start();scheduler.start();scheduler.start();scheduler.start();scheduler.start();scheduler.start();scheduler.start();scheduler.start();");
			scheduler.start();
			bundle=ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		}
		try{
			String stateId=bundle.getString("STATE_UT_ID");
			StateUtModel	stateUt=stateDao.getStateById(Long.parseLong(stateId));
			request.setAttribute("RERA_STATEUT", stateUt);
			visitorUtil.getVisitorCount(request);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
    @Override
    public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	
		HibernateSession.closeSession();
		System.out.println("Session is closed..");
	}
    
    
}
