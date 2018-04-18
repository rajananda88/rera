<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<script>
function choosepaymentmethod(slct){
	var val=$(slct).val();
	if(val=='Payment Gateway'){
	$(".optionfld2").each(function(){
		$(this).hide();
	});	
	document.paymenttrxForm1.action='redirectpaymentgateway';
	}
	else{
		$(".optionfld2").each(function(){
			$(this).show();
		});
		document.paymenttrxForm1.action='agentRegPayment';
	}
}
</script>

<form:form class="form-horizontal" id="agenttrxForm1" action="agentRegPayment" name="paymenttrxForm1" method="POST"
 enctype="multipart/form-data" modelAttribute="agentRegistrationModel">
 <form:hidden path="agentRegistrationID"/>
<div class="breadcrumb">Home / Real Estate Agent Registration</div>

<div class="container">
  
 
<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Applicant Detail</p>
      </div>
     
    
      
      
      <div class="stepwizard-step fill">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >2</a>
        <p>Upload Documents </p>
      </div>
      
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >3</a>
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

<!--Inner wrapper start here-->
<div class="inner_wrapper">



<h1>Payment<span>Details</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>




				<div class="form-group">
				<label for="inputEmail3" class="col-sm-3 control-label"> Payment Mode</label>
						<div class="col-sm-3">
						
					        
					        
							<select name ="paymentmode" id='paymentmode' onchange="choosepaymentmethod(this)"
								class="form-control requiredValFld">
								<option value="0"> --Select-- </option>
								<option value="Demand Draft" > Demand Draft </option>
								<option value="Banker's Cheque" > Banker's Cheque </option>
                                <!-- option value="Payment Gateway" > Payment Gateway </option-->

							</select>
					
					<span class='requiredValFldMsg'> Please select Payment Mode</span>
		
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> Bank Name </label>
				<div class="col-sm-3 optionfld2">
				
					
					
					<select  name="bankName" class="form-control requiredValFld">
					<option value='0'> --Select-- </option>
					<c:forEach  items="${bankList}" var="obj">
					<option value='${obj.bankId}'> ${obj.bankName} </option>
					</c:forEach>
					</select>
					<span class='requiredValFldMsg'> Please select Bank Name</span>
					
				</div>
	
	         </div>
	
	
		<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Amount (INR)</label>
				<div class="col-sm-3">
				<c:choose>
				<c:when test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG' }">
				<input class="form-control input-sm" type="text" name="amount" readonly="readonly" value="50000" />
				</c:when>
				<c:otherwise>
				<input class="form-control input-sm" type="text" name="amount"  readonly="readonly"  value="10000" />
				</c:otherwise>
				</c:choose>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> Branch </label>
				<div class="col-sm-3 optionfld2">
				<input name="bankbranch" class="form-control input-sm requiredValFld"></input>
				<span class='requiredValFldMsg'> Please enter Branch.</span>
				</div>
		
	</div>
	
	<div class="form-group optionfld2">
	<label for="inputEmail3" class="col-sm-3 control-label"> DD/ Cheque No.</label>
				<div class="col-sm-3">
				<input type="text" name="ddChequeNo" class="form-control  input-sm requiredValFld"  />
				<span class='requiredValFldMsg'> Please enter DD/ Cheque No.</span>
				</div>
		
				
			<label class="col-sm-2 control-label"> Attach Scan Copy</label>
				<div class="col-sm-3">
				  <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="attachScanCopy"  id="exampleInputFile">
				<span class='requiredValFldMsg'> Please select Scan Copy.</span>
				</div>	
	</div>
			
	
		<br>
<div class="form-group">

	<strong><input type="checkbox" class="requiredValFld" name="showonpublicdomain"></input> Except Aadhaar Card Number & <u>Financial Details</u>, all other information will be added to the public domain</strong>
		
		 <span class='requiredValFldMsg'> Please affirm the declarations.</span>					
 </div>
	
<br>
	<div class="form-group">

		<strong><input type="checkbox" class="requiredValFld" name="affirm" id="affirm"></input> [I/We] solemnly affirm and declare that the particulars given in herein are correct to [my /our] knowledge and belief and nothing material has been concealed by [me/us] therefrom</strong>
		<span class='requiredValFldMsg'> Please affirm the declarations.</span>
		
	</div>
			
			
	</div>





<c:if test="${agentRegistrationModel.registrationType=='INDVISUAL_REG'}">

<jsp:include page="previewtAgentRegIndviForm.jsp" />

</c:if>

<c:if test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG'}">

<jsp:include page="previewAgentRegistrationCompanyForm.jsp" />

</c:if>

<div class="button-wrapper">
   
   <!-- editAgentUploadDoc -->
   <input name="btn1"  class="btn-style" id="editDocButton" value="Previous" type="button" onclick="pervAgentForm1('editAgentUploadDoc')"/>
   <input name="btn2" class="btn-style" value="Submit" type="button" onclick="nextConfirmationForm()">
   <input name="btn3" class="btn-style" value="Preview Registration Form" data-toggle="modal" data-target="#myModal" type="button">
   
   </div>

<br>



</div>

<!-- container end here-->


	</div>
</form:form>