package in.gov.rera.transaction.projectregistration.service;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.web.multipart.MultipartFile;

public interface IProjectRegistrationService {
    Long  createProjectRegistration(ProjectRegistrationModel enitity)throws Exception;
    Long editProjectRegistration(ProjectRegistrationModel enitity)throws Exception;
    Long mergeProjectRegistration(ProjectRegistrationModel enitity)throws Exception;
    Long saveUpdateProjectRegistration(ProjectRegistrationModel enitity)throws Exception;
    Session getSessiion()throws Exception;
    
     ProjectRegistrationModel getProjectRegByPk(Long pk)throws Exception;
     ProjectRegistrationModel saveOrUpdateProjectPhotoDoc(MultipartFile[] projectPhoto,MultipartFile[] otherFile,String[]fieldNameArr, ProjectRegistrationModel baseModel,Integer flg,Long projectDocId)throws Exception;
     ProjectRegistrationModel saveProjectPayment(MultipartFile multipartFile,ProjectRegistrationModel e) throws Exception;
     ProjectRegistrationModel saveOrUpdatePromoterCompany(ProjectRegistrationModel projectRegistrationModel,MultipartFile multipartFile,HttpServletRequest request,MultipartFile []completionDocId, MultipartFile []occupancyDocId)throws Exception;
     ProjectRegistrationModel saveOrUpdateInvdPromoterDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request,MultipartFile[] otherFile,MultipartFile []occupancyDocId, MultipartFile promoterIndiPhoto)throws Exception;
     ProjectRegistrationModel saveOrUpdateChairManPhotograph(ProjectRegistrationModel projectId,MultipartFile multipartFile)throws Exception;
     ProjectRegistrationModel saveOrUpdateRegistrationCertificate(ProjectRegistrationModel projectId,MultipartFile multipartFile)throws Exception;
     public ProjectRegistrationModel saveUpdateMember(ProjectRegistrationModel model,HttpServletRequest request,MultipartFile[]memberPhotoFile)throws Exception;;
     AgentRegistrationModel getAgentByRegNo(String agentRegNo);
     ProjectRegistrationModel updateProjectPhotoDoc(String[]photoId,MultipartFile[] projectPhoto,MultipartFile[] otherFile,String[]fieldNameArr, ProjectRegistrationModel baseModel)throws Exception;
     ProjectRegistrationModel geSavedtProjectRegByEmailId(String emailId)throws Exception;
} 
