<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <%@ page isELIgnored="false"%>
        <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>


    
    <div class="breadcrumb">Home /Agent Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %> </b></span></div>


<!--News Ticker-->
<div class="container">



    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">

	<div class="row">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${agentReg.agentDetailsModel.photograph.documentId}" class="img-responsive" width="157" height="181" alt=""/></div>
		<div class="col-md-11 no_pad_lft">
		
		<div class="col-md-6">

			<h1><%=user.getUserName() %></h1>
			<p>${agentReg.agentDetailsModel.firmAddressLine1 } ,${agentReg.agentDetailsModel.firmAddressLine2}, ${agentReg.agentDetailsModel.districtModel.stateUtModel.stateUtName}
				${agentReg.agentDetailsModel.districtModel.districtName},${agentReg.agentDetailsModel.firmRegistrationNo}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${agentReg.registrationType}</p>


			
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number: ${agentReg.agentDetailsModel.firmRegistrationNo}</span></p>
			<br clear="all"/>
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${agentReg.approvedOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${agentReg.expireDate.time} </p>
			</div>
			
			
		</div>
		</div>
		
	</div>


<div class="drop_shadow"></div>

<form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Basic <span> Detail</span></h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-view">${agentReg.agentDetailsModel.firmName }</p></div>

		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmMobileNo } </p></div>

		
</div>

<div class="row">
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmAddressLine1 } </p></div>

		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmAddressLine2} </p></div>

</div>
<div class="row">

		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Firm/Company Address Line 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmAddressLine1 } </p></div>

		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Firm/Company Address Line 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmAddressLine1 } </p></div>
		
</div>


		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Major Activities <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmActivities} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Email Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmEmail} </p></div>
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fax Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmFaxNumber}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Phone Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmLandLineNo1} </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Company Registration Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.firmRegistrationNo } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Company Registration Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agentReg.agentDetailsModel.firmCertificatDoc.documentId }' >${agentReg.agentDetailsModel.firmCertificatDoc.fileName}</a> </p></div>
	</div>
							
											
	<div class="inner_wrapper">
			
			<h1>Partner/Director <span>  Details</span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Partner / Director Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.partnerOrDirectorName}</p></div>
	    <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Phone Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.partnerOrDirectorPhoneNO}</p></div>
		
		
	</div>
	
	<div class="row">
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.partnerOrDirectorAddressLine1} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${agentReg.agentDetailsModel.partnerOrDirectorAddressLine2} </p></div>
			
		
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agentReg.agentDetailsModel.partnerOrDirectorPhotographPath.documentId }' >${agentReg.agentDetailsModel.partnerOrDirectorPhotographPath.fileName}</a></p></div>

		
	</div>
	
		</div>		
												

<div class="inner_wrapper">
			
			<h1>Previous <span> Registration Details</span></h1>
			<c:forEach items="${agentReg.agentDetailsModel.regPreviousDatailsModelSet}" var="obj">
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${obj.preRegistrationNo}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Union Territory/State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${obj.districtModel.stateUtModel.stateUtName } </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.certificateDoc.documentId }' >${obj.certificateDoc.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p>${obj.districtModel.districtName } </p></div>
		
	</div>
	</c:forEach>
		</div>	
			
		
							
			

			
			
		
</form>
	
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
    