package in.gov.rera.transaction.home.controller;

import in.gov.rera.master.stateut.model.StateUtModel;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller("HomeController")
@Scope("request")
public class HomeController {
	
	@RequestMapping(value="home")
	public ModelAndView home(){
		return new ModelAndView("home");
	}
	
	
	@RequestMapping(value="rtiPage")
	public ModelAndView rtiPage(){
		return new ModelAndView("rtiPage");
	}
	
	@RequestMapping(value="contactUsPage")
	public ModelAndView contactUs(){
		return new ModelAndView("contactUsPage");
	}
	                       
	@RequestMapping(value="functionsAndServicesPage")
	public ModelAndView functionsAndServicesPage(){
		return new ModelAndView("functionsAndServicesPage");
	}
	
	
	
	@RequestMapping(value="faq")
	public ModelAndView faq(@RequestParam(value="FID",required=false) Integer fd){
		ModelAndView mv=null;
	int	fid=0;
	if(fd!=null) fid=fd;
		if(fid==1){
			mv=new ModelAndView("faqPage1");
		}
		else if(fid==2){
			mv=new ModelAndView("faqPage2");
		}
		else{
			mv=new ModelAndView("faqPage");
		}
		return mv;
	}
	@RequestMapping(value="aboutUs")
	public ModelAndView aboutUs(HttpServletRequest request){
		
		StateUtModel stateUt=(StateUtModel)request.getAttribute("RERA_STATEUT");
		
		if(stateUt==null || stateUt.getStateUtCode().equalsIgnoreCase("CH")){
			return new ModelAndView("aboutUsCHPage");
			
		} else if(stateUt.getStateUtCode().equalsIgnoreCase("AN")){
			return new ModelAndView("aboutUsANPage");
			
		}
		 else if(stateUt.getStateUtCode().equalsIgnoreCase("DD")){
				return new ModelAndView("aboutUsDDPage");
				
			}
		 else if(stateUt.getStateUtCode().equalsIgnoreCase("DN")){
				return new ModelAndView("aboutUsDNPage");
				
			}
		 else if(stateUt.getStateUtCode().equalsIgnoreCase("LK")){
				return new ModelAndView("aboutUsLKPage");
			}
		return new ModelAndView("aboutUsCHPage");
	}

	
	
	
	
}
