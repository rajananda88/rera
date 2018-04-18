<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html >

<head>
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
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
		document.paymenttrxForm1.action='saveProjectPayment';
	}
}
</script>
</head>

<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper">



			<h1>
				Payment<span></span>
			</h1>
			<div class="border">
				<div class="orange"></div>
				<div class="black"></div>
			</div>


			<form:form class="form-horizontal" action="saveProjectPayment" modelAttribute="projectRegistrationModel" id="trxForm"
			 method="post" enctype="multipart/form-data" name='paymenttrxForm1'>


				<div class="form-group">
				  
					<label for="inputEmail3" class="col-sm-3 control-label">
						Payment Mode</label>
					<div class="col-sm-3">
					        <input type="hidden" name="nextForm" value="projectConfirmation"/>
					        <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         <form:hidden path="projectDocModel.docId"/>
					       
					        
							<form:select path="paymentDetailsModel.paymentMode"
								class="form-control requiredValFld" onchange="choosepaymentmethod(this)">
								<form:option value="0" label="Select" />
								<form:option value="Demand Draft" label="Demand Draft" />
								<form:option value="Banker's Cheque" label="Banker's Cheque" />
                                <!-- >form:option value="Payment Gateway" label="Payment Gateway" /-->

							</form:select>
							<span class='requiredValFldMsg'> Please select Payment Mode.</span>
					
					

						
						
						
					</div>

					<label for="inputEmail3" class="col-sm-2 control-label optionfld2">
						Bank Name </label>
					<div class="col-sm-3">
					  
	                    	<form:select   path="paymentDetailsModel.bankModel.bankId" cssClass="form-control optionfld2"
								class="form-control requiredValFld">
								    <form:options items="${bankList}" itemValue="bankId" itemLabel="bankName" />

							</form:select>
					  <span class='requiredValFldMsg'> Please select Bank Name.</span>
					
					</div>




				</div>


				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">
						Amount</label>
					<div class="col-sm-3">
						
						<input name="paymentDetailsModel.amount" class="form-control input-sm requiredValFld" value="${RegistrationFee}" readonly="readonly"/>
						
					</div>

					<label for="inputEmail3" class="col-sm-2 control-label optionfld2">
						Branch </label>
					<div class="col-sm-3">
						
						<form:input path="paymentDetailsModel.branchName" cssClass="form-control input-sm optionfld2 "/>
				<span class='requiredValFldMsg'> Please enter Branch.</span>
						
						
					</div>




				</div>


				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label  optionfld2">
						DD/ Cheque No.</label>
					<div class="col-sm-3">
						<form:input path="paymentDetailsModel.ddChequeNo" cssClass="form-control input-sm optionfld2 requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter DD / Cheque No.</span>
					</div>





					<label class="col-sm-2 control-label optionfld2"> Attach Scan Copy</label>
					<div class="col-sm-3 optionfld2">
						<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="scanCopyDoc" id="scanCopyDoc">
					<span class='requiredValFldMsg'> Please select Scan Copy.</span>
					</div>
				</div>



				<br>

                  <div class="form-group">

			<strong>
					<input type="checkbox" name="showonpublicdomain"> Except Aadhaar Card Number & <u>Financial Details</u>, all other information will be added to the public domain</strong>

				</div>
                     <br>

				<div class="form-group">

					<input
							type="checkbox" name="checkAffidavit" class="requiredValFld"> I/We solemnly affirm and declare that
							the particulars given in herein are correct to [my /our]
							knowledge and belief and nothing material has been concealed by
							[me/us] therefrom</strong>
							<span class='requiredValFldMsg'> Please affirm the declarations .</span>

				</div>

			</form:form>





		</div>
		<!--inner container end here-->


		<div class="button-wrapper">


			<input name="btn1" class="btn-style" value="Previous" onclick="pervForm('editUploadDoc')" type="button">
			
			<input name="btn3" class="btn-style" value="Submit" type="button" onclick="saveOrUpdatePayment()"/>
			
			<input name="btn2" class="btn-style" value="Preview Registration Form"  type="button"  data-toggle="modal" data-target="#myModal">
		</div>

		<br>



	</div>
	


</div>





	<div class="pop_main">
	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <!--<h4 class="modal-title">Modal <span>Header</span></h4>
          <div class="border"><div class="orange"></div><div class="black"></div></div>-->
        </div>
        <div class="modal-body">
        
        <c:choose>
        <c:when test="${projectRegistrationModel.registrationType=='FIRM_COMP_REG' }">
        <jsp:include page="previewProjectRegComForm.jsp"  />
        </c:when>
        <c:otherwise>
         <jsp:include page="previewRegInvForm.jsp"  />
        </c:otherwise>
        
        </c:choose>
        </div>
        
        </div>
        </div>
        </div>
        </div>
        
        















