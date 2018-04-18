<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page isELIgnored="false"%>

<html>
<head>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title></title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>
<div class="breadcrumb">Home / Real Estate Agent Registration</div>

<div class="container">
  
<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Applicant Detail</p>
      </div>
     
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >2</a>
        <p>Upload Documents </p>
      </div>
      
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" >3</a>
        <p>Payment </p>
      </div>
      
      <div class="stepwizard-step ">
        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
        <p>Confirmation</p>
      </div>
    </div>
  </div>
  
    
</div>
<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Upload<span> Document</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>


<form:form class="form-horizontal" action="agentRegUpload" id="agenttrxForm1" method="POST" modelAttribute="agentRegistrationModel"    enctype="multipart/form-data" >
	
	 
	
				      <form:hidden path="agentDetailsModel.agentRegDetailID"/>
					       
					          <form:hidden path="agentRegistrationID"/>
					      	
	
			<div class="form-group">
				<label class="col-sm-3 control-label"> PAN Card<sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="file"  class="form-control requiredValFld" name="panCardFile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="agentFileDoc" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" >
				  <span class='requiredValFldMsg'> Please select Pan Card.</span>
				</div>
		

              <label class="col-sm-2 control-label"> Address proof<sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="file"  class="form-control requiredValFld" name="addressProofFile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"   id="agentFileDoc" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom">
				  <span class='requiredValFldMsg'> Please select Address Proof.</span>
				</div>
			
			</div>
		
			
		

 </form:form>
	</div>
<!--inner container end here-->


<div class="button-wrapper">
<c:choose>
<c:when test="${agentRegistrationModel.registrationType == 'FIRM_COMP_REG' }">
   <input name="btn1" class="btn-style" value="Previous" id="preDocButton" type="button" onclick="pervAgentForm('editAgentComForm')"/>
   </c:when>
   <c:otherwise>
    <input name="btn1" class="btn-style" value="Previous" id="preDocButton" type="button" onclick="pervAgentForm('editIndAgentForm')"/>
   </c:otherwise>
   </c:choose>
   
   <input name="btn1" class="btn-style" value="Next" type="submit" onclick="nextForm()"/>
   </div>
  

<br>



</div>
<!-- container end here-->


	</div>

</body>
</html>