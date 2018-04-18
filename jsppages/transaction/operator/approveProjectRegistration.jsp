	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div class="breadcrumb">Home /Project Details</div>



  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper">




<h1>Project Registration<span> Detail</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Promoter Detail</a></li>
			<li><a data-toggle="tab" href="#menu1">Project Detail</a></li>
			<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
			<li><a data-toggle="tab" href="#menu3">	Payment</a></li>
		  </ul>



 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
 
  
     
    <br>

     <div class="col-md-12">
     <h1>Promoter <span> Detail</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Farm Type <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">Individual </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.promoterName }</p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Father's Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.promoterIndividualFatherName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.panNo} </p></div>
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Adhaar Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.adhaarNo} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Phone Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.telephoneNo}  </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">E-mail<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.emailId} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fax Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.faxNumber}  </p></div>
	</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PIN Code <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.promoterDetailsModel.pinCode}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.individualPhotoGraphPath.documentId}'>${project.promoterDetailsModel.individualPhotoGraphPath.fileName}</a>  </p></div>
	</div>
																	
						
												

<div class="inner_wrapper">
			
			<h1>Promoter Blacklist <span> Details</span></h1>
			<div class="drop_shadow"></div>
<c:forEach items="${project.promoterDetailsModel.promoterBlackSet}" var="blckListObj">

	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Have you ever been blacklisted <span class="space_LR">:</span></p></div>
		<c:if test="${blckListObj.isBalckList==true}">
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> Yes</p></div>
		</c:if>
		<c:if test="${blckListObj.isBalckList==false}">
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> No</p></div>
		</c:if>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  ${blckListObj.certificateNo}   </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reason for blacklist<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${blckListObj.blacklistReason}</p></div>
		
	</div>
	</c:forEach>
		</div>	
			
		
<div class="inner_wrapper">
		
		<h1>Previous Project   <span>Details</span><span style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;"> (Last 5 years only)</span></h1>
			<div class="drop_shadow"></div>
      <c:forEach items="${project.previousProjectDetailsSet}" var="preobj">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Description<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectDescription} </p></div>
	</div>
	
		<c:choose>
		<c:when test="${preobj.projectCurrentStatus == 'Completed'}">		
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Current Status <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectCurrentStatus} </p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Date of Completion<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.completionDate}  </p></div>
	</div>
	

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Completion Cretificate <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" >
			<a href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.completionDocId.documentId}'>${preobj.completionDocId.fileName }</a></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Occupancy Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" >
			<a href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.occupancyDocId.documentId}'>${preobj.occupancyDocId.fileName }</a></div>
	</div>
		</c:when>

	<c:when test="${preobj.projectCurrentStatus == 'Delay'}">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Current Status <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectCurrentStatus} </p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Months Delayed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.noOfMonthDelayed}  </p></div>
	</div>
	</c:when>
	<c:when test="${preobj.projectCurrentStatus == 'Ongoing'}">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Current Status <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectCurrentStatus} </p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Expected Completion Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.expectedCompletionDate}  </p></div>
	</div>
	</c:when>
	<c:otherwise>			
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Date of Completion<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.completionDate}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">No of Months Delayed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${obj.noOfMonthDelayed}  </p></div>
	</div>		
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Expected Completion Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.expectedCompletionDate}  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Project Completion Cretificate <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'>
			<a href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.completionDocId.documentId}'>${preobj.completionDocId.fileName }</a></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Project Occupancy Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'>
			<a href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.occupancyDocId.documentId}'>${preobj.occupancyDocId.fileName }</a></div>
	</div>		
	</c:otherwise>
	</c:choose>
		
		
	<c:choose>
	<c:when test="${preobj.typeOfLand == 'Others'}">
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-right">Type of Land <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.typeOfLand} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">If Others then Occupancy details:<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.othersOccupancy}  </p></div>
	</div>
	</c:when>
	<c:otherwise>
	
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Type of Land <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.typeOfLand} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">If Others then Occupancy details:<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.othersOccupancy}  </p></div>
	</div>	
	</c:otherwise>
	</c:choose>

	<c:choose>
	<c:when test="${preobj.isCasesPending=='YES' }">
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-right">Is there any legal case pending <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.isCasesPending} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Case No<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.caseNo}  </p></div>
	</div>
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-right">Case Details (Type, Location, Authority etc.)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.caseDetails} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Case Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.caseStatus}  </p></div>
	</div>
	</c:when>
	<c:otherwise>

	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Is there any legal case pending <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.isCasesPending} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Case No<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.caseNo}  </p></div>
	</div>
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Case Details (Type, Location, Authority etc.)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.caseDetails} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Case Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.caseStatus}  </p></div>
	</div>	
	
	</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${preobj.isPaymentPending=='YES' }">
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-right">Is Payment Pertaining to Project Land Pending <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.isPaymentPending} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.pendingAmount}  </p></div>
	</div>
	</c:when>
	<c:otherwise>	
	<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Is Payment Pertaining to Project Land Pending <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.isPaymentPending} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" style='display:none;'><p>${preobj.pendingAmount}  </p></div>
	</div>
	
	</c:otherwise>
	</c:choose>	

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectAddress} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.districtModel.stateUtModel.stateUtName}  </p></div>
	</div>
	
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.districtModel.districtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectAddrPinCode}  </p></div>
	</div>
	</c:forEach>
				</div>									
			

     
  </div>
  
  
  
    <div id="menu1" class="tab-pane fade">
      <form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Project  <span> Detail</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Project Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${project.projectDetailsModel.projectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.projectDescription} </p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.projectType}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.projectStatus}  </p></div>
	</div>
		

   <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Start Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
	
                              
    
      <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${project.projectDetailsModel.startDate.time}"/>
      
                              
		</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project End Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
		
         <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${project.projectDetailsModel.completionDate.time}"/>
      
		
		
		</p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Area Of Land (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalAreaOfLand}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Coverd Area (Sq Mtr) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalCoverdArea}  </p></div>
	</div>
							
											
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Address Line 1 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.addressLine1}, ${project.projectDetailsModel.addressLine2}</p></div>
		
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.subDistrictModel.districtModel.districtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Tehsil/Sub District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${project.projectDetailsModel.subDistrictModel.subDistrictName} </p></div>
	</div>
																
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Khesra No.<span class="space_LR">:</span></p></div>
		<%-- <fmt:parseNumber var = "i" type = "number" value = "${projectReg.projectDetailsModel.noOfGarageForSale}" /> --%>
		 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${project.projectDetailsModel.khesraNo}" />
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${i} </p></div>
		</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Latitude of End point of the plot<span class="space_LR">:</span></p></div>
		<%-- <fmt:parseNumber var = "i" type = "number" value = "${projectReg.projectDetailsModel.noOfGarageForSale}" /> --%>
		 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${project.projectDetailsModel.latitudeEndPt}" />
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${i} </p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Longitude of End point of the plot<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.longitudeEndPt}  </p></div>
	</div>																
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Garage for Sale<span class="space_LR">:</span></p></div>
		<%-- <div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.noOfGarageForSale} </p></div> --%>
		
		<fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${ project.projectDetailsModel.noOfGarageForSale}" />
							<div class="col-md-3 col-sm-6 col-xs-6"><p>${i}</p>
							</div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Garage for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.areaOfGarageForSale}  </p></div>
	</div>
															
																														
																																														<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Parking for Sale <span class="space_LR">:</span></p></div>
		<%-- <div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.noOfParkinfForSale} </p></div> --%>
				<fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${ project.projectDetailsModel.noOfParkinfForSale}" />
							<div class="col-md-3 col-sm-6 col-xs-6"><p>${y}</p>
							</div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Parking for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.areaOfParkinfForSale}  </p></div>
	</div>
																																																																													
								

<div class="inner_wrapper">
			
			<h1>Development <span> Details</span></h1>
			<div class="drop_shadow"></div>
<c:forEach items="${project.developmentDetailSet}" var="devObj">
 
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.typeOfInventory}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.noOfInventory}  </p></div>
	</div>
	<td>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Proposed FAR<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.proposedFar} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sanctioned FAR<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.sanctionedFar} Sq Mtr</p></div>	
	
	</div>
	</td>
	<td>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Proposed No of Building(s) or Wing(s)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.proposedBldgNo} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sanctioned No of Building(s) or Wing(s)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.sanctionedBldgNo} Sq Mtr</p></div>	
	
	</div>
	</td>	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Proposed No of Floors<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.proposedFloors} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sanctioned No of Floors<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.sanctionedFloors} Sq Mtr</p></div>	
	
	</div>	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Aggregate area of the recreational open space<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.recreationalOpenSpace} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Architecture/Design standards used<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.archDesignStandard} Sq Mtr</p></div>	
	
	</div>	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of construction technology<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.typeOfConstruction} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Earthquake resistant measures adopted for building and common areas<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.earthquakeResistant} Sq Mtr</p></div>	
	
	</div>	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Carpet Area (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.carpetArea} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive balcony/verandah (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusive} Sq Mtr</p></div>
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive open terrace if any (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusiveOpenTerrace}  Sq Mtr</p></div>
		
	
	</div>
	</c:forEach>
</div>	
			
		
		
		
<div class="inner_wrapper">
		
<h1>External Development  <span>Work</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Road And Road System<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.roadSysetmDevBy }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Water Supply<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.waterSupplyBy }  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sewege and Drainage System <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Electricity Supply Trasfomer And Sub Stattion<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply }  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Solid Waste Managment And Disposal<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.solidWasteSupplyBy } </p></div>
		
	</div>
	

</div>



<div class="inner_wrapper">
		
<h1>Project  <span>Bank</span></h1>
<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.bankModel.bankName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Branch<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.bankBranch} </p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Account No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.accountNumber} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">ifscCode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.ifscCode} </p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.districtModel.districtName} </p></div>
		
	</div>
	
	
</div>

		

		
	
	
<div class="inner_wrapper">
		
<h1>Associated Vendor <span>Work</span></h1>

<div class="inner_wrapper">
		
<h1>Project  <span>Agent</span></h1>
			<div class="drop_shadow"></div>
<c:forEach items="${project.projectAgentDetailSet}" var="preAgentObj">
<c:if test="${preAgentObj.status=='CONFIRMED'}">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Registration No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preAgentObj.agent.agentRegistrationNo}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preAgentObj.agent.agentDetailsModel.agentName}   </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${preAgentObj.agent.agentDetailsModel.agentIndividualAddressLine1}  </p></div>
		
	</div>
	</c:if>
</c:forEach>



</div>
		
<div class="inner_wrapper">
		
<h1>Project   <span>Architects</span></h1>
			

  <c:forEach items="${project.projectArchitectDetailSet}" var="arctObj">
  <c:if test="${arctObj.status=='CONFIRMED'}">
  <div class="drop_shadow"></div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.architectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.addressLine1},${arctObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  </p></div>
    </div>
    
    </c:if>
    
	</c:forEach>


</div>

<div class="inner_wrapper">
		
<h1>Structural    <span>Engineers</span></h1>
		
  <c:forEach items="${project.structuralEngineerDetailSet}" var="strObj">
   <c:if test="${strObj.status=='CONFIRMED'}">
	<div class="drop_shadow"></div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.engineerName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  </p></div>
    </div>
    
</c:if>
	</c:forEach>
	


</div>

<div class="inner_wrapper">
		
<h1>Project     <span>Contrators</span></h1>


 <c:forEach items="${project.projectContratorDetailSet}" var="strObj">
  <c:if test="${strObj.status=='CONFIRMED'}">
<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"> Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.contractorName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  </p></div>
    </div>
    
</c:if>

	</c:forEach>
	



</div>	

</div>																						
																																										
																																																																																		
			
	
</form>
    </div>
    <div id="menu2" class="tab-pane fade">
      <form class="form-horizontal">
     
    <br>

   
 

<div class="inner_wrapper">
			
			<h1>Promoter <span> Document </span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Card <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.panCardDoc.documentId}'>${project.projectDocModel.panCardDoc.fileName }</a></p></div>
	</div>
	

		</div>	
		
		
		
<div class="inner_wrapper">
		
		<h1>Project  <span>Approval</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Commencement Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.encumbranceCertificateDoc.documentId}'>${project.projectDocModel.encumbranceCertificateDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approved Sanctioned Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveSacPlanDoc.documentId}'>${project.projectDocModel.approveSacPlanDoc.fileName }</a>  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approved Layout Plan <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveLayoutPlanDoc.documentId}'>${project.projectDocModel.approveLayoutPlanDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Legal Title Deed (Agreement)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.agreementFileDoc.documentId}'>${project.projectDocModel.agreementFileDoc.fileName }</a>  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Land documents & Location<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.landLocationFileDoc.documentId}'>${project.projectDocModel.landLocationFileDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sanctioned Layout Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.sanctionedLayoutPlanDoc.documentId}'>${project.projectDocModel.sanctionedLayoutPlanDoc.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area Development Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.areaDevelopmentDoc.documentId}'>${project.projectDocModel.areaDevelopmentDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Performa of Allotment Letter<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.performaOfAllotmentLetterDoc.documentId}'>${project.projectDocModel.performaOfAllotmentLetterDoc.fileName }</a> </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Brochure of Current Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.brochureOfCurrentProjectDoc.documentId}'>${project.projectDocModel.brochureOfCurrentProjectDoc.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Related Documents<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectRelatedDoc.documentId}'>${project.projectDocModel.projectRelatedDoc.fileName }</a> </p></div>
	</div>
	
				
			</div>									
			
<div class="inner_wrapper">
		
		<h1>Financial   <span>Document</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2014)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc1.documentId}'>${project.projectDocModel.auditedBalSheetDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2015)<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc2.documentId}'>${project.projectDocModel.auditedBalSheetDoc2.fileName }</a></p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2016) <span class="space_LR">:</span></p></div>
	<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc3.documentId}'>${project.projectDocModel.auditedBalSheetDoc3.fileName }</a></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc1.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc1.fileName }</a> </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc2.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc3.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc3.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc1.documentId}'>${project.projectDocModel.directorReportDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc2.documentId}'>${project.projectDocModel.directorReportDoc2.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc3.documentId}'>${project.projectDocModel.directorReportDoc3.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc1.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc1.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc3.fileName }</a> </p></div>
	</div>
	
	
</div>
	
	<div class="inner_wrapper">
		
		<h1>Declaration   </h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Declaration (Form B)<span class="space_LR">:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.declarationFormbDoc.documentId}'>${project.projectDocModel.declarationFormbDoc.fileName }</a> </p></div>
	
	</div>

</div>


		
<div class="inner_wrapper">
		
<h1>Project   <span>Photo</span></h1>
<div class="drop_shadow"></div>
    

    <c:forEach items="${project.projectPhotoDetailSet}" var="projectPhoto">
    <div class="drop_shadow"></div>
    
      <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Photo Uploaded<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectPhoto.documentId}'>${projectPhoto.documentName}</a></p></div>
		
	</div>
      
    </c:forEach>

	
</div>			
			
		
</form>


    </div>
    
    
    
    <div id="menu3" class="tab-pane fade">
     
  

     <div class="col-md-12">
     <h1>Payment </h1>
    
	 
 
<c:if test="${project.paymentDetailsModel.paymentMode!='Payment Gateway'}">
	<div class="row">
		 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${project.paymentDetailsModel.paymentMode}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.bankModel.bankName}  </p></div>
	
	
	<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetYear2.documentId}'>${project.projectDocModel.auditedBalSheetYear2.fileName }</a></p></div>
	 --%>
	 </div>
	
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Branch<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.branchName} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">DD/Cheque No<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.ddChequeNo} </p></div>
		 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Attach Scan Copy<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.scanCopyDoc.documentId}'>${project.paymentDetailsModel.scanCopyDoc.fileName} </a></p></div>
		 
	</div>
</c:if>	
	
	<c:if test="${project.paymentDetailsModel.paymentMode=='Payment Gateway'}">
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>Payment Gateway</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.bankModel.bankName}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Branch<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.branchName} </p></div>
	</div>
	
		
	</c:if>

    </div>
  </div>


		
		
		
		
	</div>




<form name="approvalForm" class="form-horizontal"  action="forwardProjectRegistration" method="post">

<input type='hidden' name='PROJECT_ID' value="${project.projectRegId }" />
  <input type='hidden' name='STATUS' />
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Forward To: </label>
				<div class="col-sm-3">
			
				<select name="ASSIGN_TO" id="assigntToApp" class="form-control requiredValFld" >
				<option value="0"> --Select-- </option>
				<c:forEach items="${AUTHORITYLIST }" var="user">
				<option value="${user.userId }"> ${user.userName} </option>
				</c:forEach>
				</select>
				<span class='requiredValFldMsg'> Please select the authority.</span>
				</div>
				
			
		
	</div>
	<br/><br/><br/><br/>
<div class="button-wrapper">
   

   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Forward" type="button"  onclick="submitTrxForm('FORWARD')" /></div>



</form>

	
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
	<script>
function submitTrxForm(_out){
document.approvalForm.STATUS.value=_out;
if(_out=='REJECTED'){
if(confirm('Are you sure reject this application?')){
//document.approvalForm.submit();

}
}
else{
if(confirm('Are you sure forward this application?')){
document.approvalForm.submit();

}
}
}
</script>
	