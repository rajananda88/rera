<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath() %>/resources/projectjs/projectJs.js"></script>
<script>

function others(a) {
	var sid=$(a).attr('id');
	//alert(sid);
	var val=$(a).val();
	//alert(val);
	if(val=='Others') {
		$('#DV'+sid).find('.othersOccupancy').show();
	} else {
		$('#DV'+sid).find('.othersOccupancy').hide();
	}
}

function ocCurrentStatus(slct){
var sid=	$(slct).attr('id');
var val=	$(slct).val();
//alert(val);
if(val=='Completed'){ 
	$('#DV'+sid).find('.completionDate').show();
	$('#DV'+sid).find('.completionDocId').show();
	$('#DV'+sid).find('.occupancyDocId').show();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
}else if(val=='Ongoing'){
	$('#DV'+sid).find('.completionDate').hide();
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.occupancyDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').show();
	
}else if(val=='Delay'){
	$('#DV'+sid).find('.completionDate').hide();
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.occupancyDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').show();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
}
else{
	
	$('#DV'+sid).find('.completionDate').hide();
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.occupancyDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
	
}


}

function showrelatedfld(rdo){
	var sid=	$(rdo).attr('id');
	//alert(sid);
	$('#Lbl'+sid).show();
	$('#Fld'+sid).show();
	$('#Lbl1'+sid).show();
	$('#Pdt'+sid).show();
	$('#Lbl2'+sid).show();
	$('#Rdl'+sid).show();
	var hd=$('#Hd'+sid);
	if(hd){
		$(hd).val($(rdo).val());
	}
}
function hiderelatedfld(rdo){
	var sid=	$(rdo).attr('id');
	$('#Lbl'+sid).hide();
	$('#Fld'+sid).hide();
	$('#Lbl1'+sid).hide();
	$('#Pdt'+sid).hide();
	$('#Lbl2'+sid).hide();
	$('#Rdl'+sid).hide();
	var hd=$('#Hd'+sid);
	if(hd){
		$(hd).val($(rdo).val());
	}
}

</script>
</head>
<body>


	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel">


				<div class="stepwizard-step blank">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
					<p>Project Detail</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">3</a>
					<p>Upload Documents</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>Payment</p>
				</div>


				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">5</a>
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



				<h1>
					Promoter <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>


				<form:form class="form-horizontal" action="saveInvdPromoterDetails" modelAttribute="projectRegistrationModel" id="trxForm"  enctype= "multipart/form-data">


					<div class="form-group">
						<label class="col-sm-3 control-label">Name<sup>*</sup></label>
						<div class="col-sm-3">
							  <form:input path="promoterDetailsModel.promoterName" id='promoterName' cssClass="form-control input-sm requiredValFld"/>	
							   <span class='requiredValFldMsg'> Please enter promoter name.</span>
							  <input name="nextForm" type="hidden" value="${nextView}"/>	
								
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Father's
							Name<sup>*</sup> </label>
						<div class="col-sm-3">
							<form:hidden path="projectRegistrationNo" />	
							 <form:input path="promoterDetailsModel.promoterIndividualFatherName" id="promoterIndividualFatherName" cssClass="form-control input-sm requiredValFld"/>	
							 <span class='requiredValFldMsg'> Please enter father name.</span>
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">PAN
							Number<sup>*</sup> </label>
						<div class="col-sm-3">
								 <form:input path="promoterDetailsModel.panNo" rel="txtTooltip" title="Only valid pan number is allowed.e.g:ABCDE1234F" data-toggle="tooltip" data-placement="bottom"  id="panNo" cssClass="form-control input-sm panNoValFld requiredValFld" maxlength="10"/>	
						 <span class='requiredValFldMsg'> Please enter PAN Number.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Aadhaar Number<sup>*</sup> </label>
						<div class="col-sm-3">
							
						     <form:input path="promoterDetailsModel.adhaarNo" rel="txtTooltip" title="Only 12 digits of valid adhaar number is allowed." data-toggle="tooltip" data-placement="bottom"  id="adhaarNo" cssClass="form-control input-sm aadhaarNoValFld requiredValFld" maxlength="12"/>		
									 <span class='requiredValFldMsg'> Please enter Aadhaar Number.</span>
						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Mobile	No.<sup>*</sup></label>
						<div class="col-sm-3">
							
							<form:input path="promoterDetailsModel.mobileNo" rel="txtTooltip" title="Only 10 digits of valid mobile number is allowed." data-toggle="tooltip" data-placement="bottom"   id="mobileNo" cssClass="form-control input-sm mobileValFld requiredValFld" maxlength="10"/>	
								<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">
							Telephone No.<sup>*</sup> </label>
						<div class="col-sm-3">
							 <form:input path="promoterDetailsModel.telephoneNo" rel="txtTooltip" title="Only 6-10 digits of landline number is allowed." data-toggle="tooltip" data-placement="bottom"  id="telephoneNo" cssClass="form-control input-sm landlineValFld requiredValFld" maxlength="12"/>			
								<span class='requiredValFldMsg'> Please enter Telephone No.</span>
						</div>
						
						

					</div>
					
					
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							<sup></sup></label>
						<div class="col-sm-3">
								
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">
							E-mail <sup>*</sup></label>
						<div class="col-sm-3">
							 <input name="promoterDetailsModel.emailId"  value='${emailId}' rel="txtTooltip" title="Only valid emailId is allowed. e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"   readonly="readonly" id="emailId" class="form-control input-sm "/>			
								
						</div>
						
						

					</div>
					


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Fax
							Number </label>
						<div class="col-sm-3">
							
							<form:input path="promoterDetailsModel.faxNumber" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"  id="faxNumber" cssClass="form-control input-sm numericValFld " maxlength="12"/>
							
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">Address Line 1<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.addressLine1"  id="addressLine1" cssClass="form-control input-sm requiredValFld"/>
							<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
							
						</div>


                      </div>
                      
                      <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">
							Occupation  </label>
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.accupation" cssClass="form-control input-sm "/>
							
						</div>

						
						<label for="inputEmail3" class="col-sm-2 control-label">Address Line 2<sup>*</sup>
						</label>
						
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.addressLine2"  id="addressLine2" cssClass="form-control input-sm requiredValFld"/>
							<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
						</div>


                      </div>
                      
                      
                      
                      
                      



					<div class="form-group">


							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3">
							<select name="promoterStateUtId" id="invSate"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
						       <span class='requiredValFldMsg'> Please select State.</span>
									
								
							</div>



							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								<select class="form-control requiredValFld" name="permDistrictId"  id="District-invSate" >
									<option value="0"> --Select-- </option>
																		
								</select>
								 <span class='requiredValFldMsg'> Please select District.</span>
							</div>

						</div>
					
					<div class="form-group">
                	<label for="inputEmail3" class="col-sm-3 control-label">PIN Code<sup>*</sup></label>
						<div class="col-sm-3">
                         <form:input path="promoterDetailsModel.pinCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  id="pinCode" cssClass="form-control  requiredValFld pinCodeValFld" maxlength="6"/>
							<span class='requiredValFldMsg'> Please enter PIN Code.</span>
						

						</div>
						
                        
						
							<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" 
								data-placement="bottom"  id="chairManPhoto" name="individualPhotoGraphPath"/>
							<span class='requiredValFldMsg'> Please select Photograph.</span>
							</div>

						
						</div>

                      



					<br>

                   <div class="inner_wrapper">


						<h1>
							Previous Project <span>Details</span><span
								style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
								(Last 5 years only)</span>
						</h1>
                       <div id='pre_project-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Project Name </label>
								
							<div class="col-sm-3">
								<input type="text" class="form-control input-sm requiredValFld"
									id="pervProjectName" name="pervProjectName" >
									<span class='requiredValFldMsg'> Please enter Project Name.</span>
									
									
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 control-label">
								Project Description <br/> <span style="font-size:10px; color:#929090;">(Maximum 500 Character)</span></label>
							<div class="col-sm-3">
								<textarea class="form-control input-sm requiredValFld" name="pervProjectDescription" id="pervProjectDescription" rows="3"></textarea>
								<span class='requiredValFldMsg'> Please enter Project Discription.</span>
							</div>




						</div>




						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld requiredValFld" name="projectCurrentStatus" id='projectCurrentStatus' onchange="ocCurrentStatus(this)" >
									<option value="0"> --Select--  </option>
										<option value="Completed">Completed </option>
									    <option value="Ongoing">Ongoing</option>
									    <option value="Delay">Delay</option>
									
									</select>
									 <span class='requiredValFldMsg'> Please select Status.</span>
								</div>
                                
                                <div class='completionDate'  style='display:none;'>  
                                  
                            </div>
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control requiredValFld" name="noOfMonthDelayed" />
									 <span class='requiredValFldMsg'> Please enter No Of Months Delayed.</span>
								</div>
                              </div>

<div class='completionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Date of Completion </label>
								<div class="col-sm-3">
									
										<input type="text" name="completionDate" class="form-control input-sm augCalCssClass requiredValFld" readonly="readonly">
										 <span class='requiredValFldMsg'> Please enter Date of Completion.</span>
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
</div>
                                <div class='expectedCompletionDate'  style='display:none;'>

								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" class="form-control input-sm augCalCssClass requiredValFld" readonly="readonly">
										 <span class='requiredValFldMsg'> Please enter Expected Completion Date.</span>
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
								</div>



                        <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-3 control-label">
									Project Completion Certificate</label>
								<div class="col-sm-3 ">
							      <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" name="completionDocId"/>
	                          		 <span class='requiredValFldMsg'> Please select Project Completion Certificate.</span>
	                            </div>
                                   	</div>  
                                
						                                
                                 <div class='occupancyDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Occupancy Certificate</label>
								<div class="col-sm-3 ">
							      <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" name="occupancyDocId"/>
	                          		 <span class='requiredValFldMsg'> Please select Project Occupancy Certificate.</span>
	                            </div>
                                   	</div> 		
		</div>
							<div class="form-group dynaselectfld" id='DVoccupancyType'>
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type
									of Occupancy </label>
								<div class="col-sm-3">
									<select class="form-control requiredValFld" name="typeOfLand" id="occupancyType" onchange="others(this)">
										<option value="0">Select</option>
										<option value="Residential">Residential</option>
										<option value="Commercial">Commercial</option>
                                    	<option value="Mixed Development">Mixed Development</option>
                                    	<option value="Others">Others</option>
	
									</select>
									 <span class='requiredValFldMsg'> Please select Type Of Occupancy.</span>
								</div>
								<div class='othersOccupancy'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									If Others, Please Enter here </label>
								<div class="col-sm-3">
									<input class="form-control requiredValFld" name="othersOccupancy" />
									 <span class='requiredValFldMsg'> Please enter Other Type of Occupancy.</span>
								</div>
                              </div>
							</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									</label>
								<div class="col-sm-3 ">
									
								</div>
							
							</div>



							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Is
									there any legal case pending</label>
								<div class="col-sm-3 ">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending' class='dynaselectfld'>
									&nbsp;&nbsp;Yes&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="YES"class='dynaselectfld requiredValFld' id="isCasesPending" onclick='showrelatedfld(this)' />
									
									&nbsp;&nbsp;No&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="NO" class='dynaselectfld requiredValFld'	id="isCasesPending"  onclick='hiderelatedfld(this)'>
									<span class='requiredValFldMsg'> Please select Yes Or No.</span>
								</div>
							
									 <label id="LblisCasesPending" for="inputEmail3" class="col-sm-2 control-label dynaselectfld requiredValFld" style='display:none;'>
									 Case No</label>
									 	<div class="col-sm-3">
									 		<input type="text"	id="FldisCasesPending" name="caseNo"  style='display:none;' 
									 		class="form-control dynaselectfld requiredValFld" /> 
									 		
									
									  		<span class='requiredValFldMsg'> Please enter Case No.</span>
										</div>
																			
								</div>		
										


									
							<div class="form-group">			  
	
									 <label id="Lbl1isCasesPending" for="inputEmail3" class="col-sm-3 control-label dynaselectfld requiredValFld" style='display:none;'>
									 Case Details (Type, Location, Authority etc.)</label>
									 	<div class="col-sm-3">
									 		<input type="text"	id="PdtisCasesPending" name="caseDetails"  style='display:none;' 
									 		class="form-control dynaselectfld requiredValFld" /> 
									 		
									
									  		<span class='requiredValFldMsg'> Please enter Case Details (Type, Location, Authority etc.).</span>
										</div>                                  	
                                  	
                                  	
                                  	<label id="Lbl2isCasesPending" for="inputEmail3" class="col-sm-2 control-label dynaselectfld requiredValFld" style='display:none;'>
                                  	Case Status</label>
									<div class="col-sm-3">
									 <input type="text"	id="RdlisCasesPending" name="caseStatus"  style='display:none;' 
									 class="form-control dynaselectfld requiredValFld" />
									
									  <span class='requiredValFldMsg'> Please Enter Case Status</span>										
									</div>
										
							</div>
								

						<div class="form-group">
								<label  for="inputEmail3" class="col-sm-2 control-label" >
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3">
									
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending' class='dynaselectfld input-sm'>
										&nbsp;&nbsp;Yes&nbsp;&nbsp;<input type="radio" name="isPaymentPending" value="YES" class='dynaselectfld input-sm requiredValFld' id="isPaymentPending" onclick='showrelatedfld(this)'/>
										&nbsp;&nbsp;No&nbsp;&nbsp;<input type="radio" name="isPaymentPending" value="NO" class='dynaselectfld input-sm requiredValFld' id="isPaymentPending" onclick='hiderelatedfld(this)' /> 
										 <span class='requiredValFldMsg'> Please select Yes Or No.</span>
									
								</div>	
							
								<label id="LblisPaymentPending" for="inputEmail3" class="col-sm-2 control-label dynaselectfld requiredValFld" style='display:none;' >
									 Amount</label>
								 	<div class="col-sm-2">
									 		<input type="text" name="pendingAmount" class="form-control dynaselectfld input-sm requiredValFld" style='display:none;' id="FldisPaymentPending" /> 
											<span class='requiredValFldMsg'> Please enter Amount.</span>
									</div>
							
						</div>
						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-3">
								<textarea class="form-control input-sm requiredValFld" name="projectAddress" id="" rows="3"></textarea>
								<span class='requiredValFldMsg'> Please enter Address.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-2">
							<select name="stateUtId" id="pervSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
						       	  <span class='requiredValFldMsg'> Please select State.</span>
				
							</div>
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District</label>
							<div class="col-sm-3 ">
                        		<select class="form-control dynaselectfld requiredValFld" name="pervProjDistrictId"  id="District-pervSate" >
									<option value="0"> --Select-- </option>
																		
								</select>
									  <span class='requiredValFldMsg'> Please select District.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm pinCodeValFld requiredValFld" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  name="projectAddrPinCode" id="projectAddrPinCode" maxlength="6"/>
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
						</div>
						</div>
						
						
						
					</div>


					<div class="form-group">




						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span>
								<span class="theme-clr addmore" id="pre_project"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>



					</div>
					
 

				</form:form>
 

			</div>
			<!--inner container end here-->


			<div class="button-wrapper">
				<input name="btn1" class="btn-style" value="Next" type="button" onclick="nextProjectDetailsForm()"/>
			</div>

			<br>



		</div>
		<!-- container end here-->


	</div>

	<!--<div class="container">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="gov-bodies"> <a href="#"><img src="images/got-bodies1.jpg" width="108" height="28" /> </a> <a href="#"><img src="images/got-bodies2.jpg" width="139" height="30" /> </a> <a href="#"><img src="images/got-bodies3.jpg" width="134" height="29" /> </a> <a href="#"><img src="images/got-bodies4.jpg" width="85" height="34" /> </a> <a href="#"><img src="images/got-bodies5.jpg" width="72" height="43" /> </a> <a href="#"><img src="images/got-bodies6.jpg" width="90" height="26" /> </a> <a href="#"><img src="images/got-bodies7.jpg" width="57" height="44" /> </a> <a href="#"><img src="images/got-bodies8.jpg" width="78" height="28" /> </a> <a href="#"><img src="images/got-bodies9.jpg" width="105" height="35" /> </a> </div>
    </div>
  </div>
</div>-->
</body>
</html>