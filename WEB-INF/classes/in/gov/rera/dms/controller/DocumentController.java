package in.gov.rera.dms.controller;

import javax.servlet.http.HttpServletResponse;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.dms.util.DownloadUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller(value="DocumentController")
@Scope("request")
public class DocumentController {

	
	@Autowired
	DocumentService documentService;
	
	
	@RequestMapping(value="reraimage",method=RequestMethod.GET)
	public ModelAndView getImage(@RequestParam(value="IMG_ID")int docId,HttpServletResponse response){
		try{
		Document document=documentService.getDoc(docId);
		DownloadUtil util=new DownloadUtil();
		util.getImage(response, document);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@RequestMapping(value="download",method=RequestMethod.GET)
	public ModelAndView getDocument(@RequestParam(value="DOC_ID")int docId,HttpServletResponse response){
		try{
		Document document=documentService.getDoc(docId);
		DownloadUtil util=new DownloadUtil();
		util.download(response, document);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
