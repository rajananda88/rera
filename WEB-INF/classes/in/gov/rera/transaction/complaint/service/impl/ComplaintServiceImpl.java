package in.gov.rera.transaction.complaint.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service(value="complaintService")
@Scope(value="request")
public class ComplaintServiceImpl<E,PK> implements IComplaintService<ComplaintModel,Long> {

	@Autowired
	IComplaintDAO<ComplaintModel,Long>complaintDAO;
	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;
	
	@Override
	public Long saveComplaint(ComplaintModel complaintModel,MultipartFile[] multipartFile,String[] captions,MultipartFile attachScanCopy) throws Exception {
	
		
		  complaintModel.setComplaintDate(Calendar.getInstance());
		  complaintModel.setComplaintNo(getComplaintNo());
		  Long id	=complaintDAO.saveComplaint(complaintModel);
	 
		try{
			complaintModel= setCompaintDocument(complaintModel, multipartFile,captions, attachScanCopy);
		   
	   }catch(Exception ex){
		   ex.printStackTrace();
	   }
		  complaintModel.setStatus(ReraConstants.PENDING_OPRATOR);
		 complaintDAO.updateComplaint(complaintModel);
		 return id;
	}

	@Override
	public ComplaintModel updateComplaint(ComplaintModel e) throws Exception {
		return complaintDAO.updateComplaint(e);
	}

	@Override
	public ComplaintModel findComplaintById(Long pk) throws Exception {
		return complaintDAO.findComplaintById(pk);
	}

	
	private final ComplaintModel setCompaintDocument(ComplaintModel complaintModel,MultipartFile[] multipartFile,String[] captions,MultipartFile scanCopy) throws Exception{
		List<Document>list = new ArrayList<Document>();
		int x=0;
		if(multipartFile!=null && multipartFile.length>0){
		for(MultipartFile multiDoc:multipartFile){
			if(!multiDoc.isEmpty() && multiDoc.getSize()>10){
				Document document=new Document();
				document.setInputStream(multiDoc.getInputStream());
				document.setDocumentType("COMPLAINT");
				document.setCaption(captions[x]);
				document.setMimeType(multiDoc.getContentType());
				document.setFileName(multiDoc.getOriginalFilename());
				document.setFolderId(String.valueOf(complaintModel.getCompId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				list.add(document);
				x++;
			}
		}
		}
		complaintModel.setDocList(list);
		
		Document document=new Document();
		document.setInputStream(scanCopy.getInputStream());
		document.setDocumentType("COMPLAINT");
		document.setMimeType(scanCopy.getContentType());
		document.setFileName(scanCopy.getOriginalFilename());
		document.setFolderId(String.valueOf(complaintModel.getCompId()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);
		
		complaintModel.getComplaintPaymentDetailsModel().setAttachScanCopy(document);
		
		
		return complaintModel;
	}
	
	
  
    
    

    
    private final String getComplaintNo(){
    	java.util.Random generator = new java.util.Random();
		generator.setSeed(System.currentTimeMillis());
		int i = generator.nextInt(1000000) % 1000000;
		java.text.DecimalFormat f = new java.text.DecimalFormat("000000");
		System.out.println(f.format(i));
		return f.format(i).toString();
    }
}
