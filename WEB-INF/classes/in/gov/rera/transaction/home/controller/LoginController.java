package in.gov.rera.transaction.home.controller;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.home.service.LoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller("LoginController")
@Scope("request")
public class LoginController {
	@Autowired
	LoginService loginService;

	
	@RequestMapping(value="loginPage")
	public ModelAndView loginPage(){
		return new ModelAndView("loginPage");
	}
	
	@RequestMapping(value="authorityLoginPage")
	public ModelAndView authorityLoginPage(){
		return new ModelAndView("authorityLoginPage");
	} 
	
	@RequestMapping(value="userLogin")
	public ModelAndView userLogin(HttpServletRequest request, @RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass){
		
	UserModel user=	loginService.login(logId, pass);
	if(user!=null && user.getUserType()!=null &&
			(user.getUserType().equals(ReraConstants.AGENT_USER) || user.getUserType().equals(ReraConstants.PROJECT_USER) )){
		
		try{
		return	new ModelAndView("redirect:"+buildNewSession(request, user));
			
			}catch(Exception ex){
				ex.printStackTrace();
			}
		ModelAndView mv=new ModelAndView("loginPage");
		mv.addObject("ERROR_MSG","Something went wrong. Try again.");
		return mv;
	}
	else{
		
		ModelAndView mv=new ModelAndView("loginPage");
		mv.addObject("ERROR_MSG","Invalid login Id or passowrd.");
		return mv;
}
		
	}
	
	
	@RequestMapping(value="authorityLogin")
	public ModelAndView authorityLogin(HttpServletRequest request, @RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass){
		
	UserModel user=	loginService.login(logId, pass);
	if(user!=null && user.getUserType()!=null &&
			(user.getUserType().equals(ReraConstants.ADMIN_USER) || user.getUserType().equals(ReraConstants.AUTHORITY_USER)
					|| user.getUserType().equals(ReraConstants.OPERATOR_USER))){
		
		try{
		return	new ModelAndView("redirect:"+buildNewSession(request, user));
			
			}catch(Exception ex){
				ex.printStackTrace();
			}
		ModelAndView mv=new ModelAndView("authorityLoginPage");
		mv.addObject("ERROR_MSG","Something went wrong. Try again.");
		return mv;
	}
	else{
		
		ModelAndView mv=new ModelAndView("authorityLoginPage");
		mv.addObject("ERROR_MSG","Invalid login Id or passowrd.");
		return mv;
}
		
	}

	
	private String buildNewSession(HttpServletRequest request,UserModel user){
		HttpSession session=request.getSession(true);
		String path="loginPage";
		String type=user.getUserType();
		session.setAttribute(ReraConstants.SES_USER_ATTR, user);
		session.setAttribute(ReraConstants.SES_USER_ROLE,type);
		
		
		if(type.equals(ReraConstants.ADMIN_USER)){
			path="admin/dashboard";
		}else if(type.equals(ReraConstants.AUTHORITY_USER)){
			path="authority/dashboard";
		} else if(type.equals(ReraConstants.AGENT_USER)){
			path="agent/dashboard";
		}else if(type.equals(ReraConstants.PROJECT_USER)){
			path="project/dashboard";
		}else if(type.equals(ReraConstants.OPERATOR_USER)){
			path="operator/dashboard";
		}
		
		return path;
	}
	
	@RequestMapping(value="logout")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session=request.getSession(true);
		session.removeAttribute(ReraConstants.SES_USER_ATTR);
		session.removeAttribute(ReraConstants.SES_USER_ROLE);
		session.invalidate();
	return new ModelAndView("redirect: home");
	}
	
	
	
	
	
	@RequestMapping(value="forgetPasswordBForm")
    public ModelAndView forgetPasswordUserForm(){
  	  
  	  return new ModelAndView("forgetPasswordUserForm");
	}
	

	
	@RequestMapping(value="retrievePassword")
     public ModelAndView retrievePasswordUser(@RequestParam("uType") String uType,@RequestParam("regNo") String regNo){
		ModelAndView mv= new ModelAndView("forgetPasswordUserForm");
		try{
		if(	loginService.retrievePassword(uType, regNo)){
			mv.addObject("ERROR_MSG", "Login credential have been sent on registered email address.");
		}else{
			mv.addObject("ERROR_MSG", "User not found.");
		}
			 
		}
		catch (Exception e) {
			e.printStackTrace();
			mv.addObject("ERROR_MSG", "Something went wrong. Please try later.");
		}
		
	  return mv;
	}
	
	
	
	
	
	@RequestMapping(value="changePassword",method=RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request, @RequestParam(value = "oldPassword", required = true) String oldPassword,
			
			@RequestParam(value = "newpassword", required = true) String newpassword) throws Exception{
		
		
		ModelAndView mv=null;
		UserModel loggedUser=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		
		UserModel user=	loginService.updatePassword(loggedUser.getLoginId(), oldPassword, newpassword);
		if(user!=null){
			
			try{
			return	new ModelAndView("redirect:"+buildNewSession(request, user));
				
				}catch(Exception ex){
					ex.printStackTrace();
				}
	
		
		
	}else{
		String type=loggedUser.getUserType();
		String path="";
		
		if(type.equals(ReraConstants.ADMIN_USER)){
			path="admin/dashboard";
		}else if(type.equals(ReraConstants.AUTHORITY_USER)){
			path="authority/dashboard";
		} else if(type.equals(ReraConstants.AGENT_USER)){
			path="agent/dashboard";
		}else if(type.equals(ReraConstants.PROJECT_USER)){
			path="project/dashboard";
		}else if(type.equals(ReraConstants.OPERATOR_USER)){
			path="operator/dashboard";
		}
		return	new ModelAndView("redirect:"+path);
		
	}
		return mv;
	
		
	}
	
	
	
	
	
	
	
	@Autowired
	private HttpSession httpSession;
}
	
