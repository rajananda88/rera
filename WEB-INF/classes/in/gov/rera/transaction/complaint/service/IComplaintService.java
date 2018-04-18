package in.gov.rera.transaction.complaint.service;

import org.springframework.web.multipart.MultipartFile;

public interface IComplaintService <E,PK>{
	PK saveComplaint(E e,MultipartFile[] multipartFile,String[] captions,MultipartFile attachScanCopy) throws Exception;
	E updateComplaint(E e) throws Exception;
	E findComplaintById(PK pk)throws Exception;
	
}
