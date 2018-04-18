<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html >
<html>
<head>

<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<script>
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

function choosePromoterType(slct){
	var val=$(slct).val();
	if(val!='Other'){
	$(".optionfld2").each(function(){
		$(this).hide();
	});	
	
	}
	else{
		$(".optionfld2").each(function(){
			$(this).show();
		});
	
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
			<div class="stepwizard-row setup-panel ">


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
	<form:form class="form-horizontal"
					action="saveCompanyPromoterDetails"
					commandName="projectRegistrationModel" method="post" id="trxForm" enctype= "multipart/form-data">
	
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


				
					<div class="form-group">
						<label class="col-sm-3 control-label">Type of Promoter<sup>*</sup></label>
						<div class="col-sm-3">
							<form:select path="promoterDetailsModel.typeOfPromoter"
								cssClass="form-control requiredValFld" onchange="choosePromoterType(this)">
								<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
								<form:option value="Competent Authority">Competent Authority</form:option>
								<form:option value="Limited Liability Partnership"> Limited Liability Partnership</form:option>
								<form:option value="Trust">Trust</form:option>
								<form:option value="Firm">Firm</form:option>
								<form:option value="Other">Other</form:option>



							</form:select>
<span class='requiredValFldMsg'> Please enter type of promotor.</span>
						</div>
						
						<label for="inputEmail3" style='display:none;' class="col-sm-2 control-label optionfld2"> Please Specify Other: </label>
						<div class="col-sm-3 optionfld2" style='display:none;'>
							<form:input path="promoterDetailsModel.ifOther"
								cssClass="form-control input-sm optionfld2 requiredValFld"  />

						</div>

					</div>



					<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">Name<sup>*</sup>
						</label>
						<div class="col-sm-3">
                        	<form:input path="promoterDetailsModel.promoterName"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Name.</span>

						</div>
					<label for="inputEmail3" class="col-sm-2 control-label">PAN Number <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.panNo"
							rel="txtTooltip" title="Only valid pan number is allowed.e.g:ABCDE1234F" data-toggle="tooltip" data-placement="bottom" 	cssClass="form-control input-sm panNoValFld requiredValFld" />
                    <span class='requiredValFldMsg'> Please enter PAN Number.</span>
						</div>

					</div>

 
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">E-mail<sup>*</sup></label>
						<div class="col-sm-3">
							<input  type="text" value="${emailId}" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz>com" data-toggle="tooltip" data-placement="bottom"  name="promoterDetailsModel.emailId"
								class="form-control input-sm emailValFld" />
						 		
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Mobile No. <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.mobileNo" rel="txtTooltip" title="Only 10 digits of valid mobile number is allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm mobileValFld requiredValFld" maxlength="10" />
								
							<span class='requiredValFldMsg'> Please enter Mobile No.</span>

						</div>

					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Address
							Line 1<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine1"
								cssClass="form-control input-sm requiredValFld" />
							<span class='requiredValFldMsg'> Please enter Address Line 1.</span>	
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">Address
							Line 2 <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine2"
								cssClass="form-control input-sm requiredValFld" />
							<span class='requiredValFldMsg'> Please enter Address Line 2.</span>	
						</div>

 					</div>
 

					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<select name="promoterStateUtId" id="invSate"  onchange="reloadChildDropdown(this)" class="form-control input-sm requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
									<span class='requiredValFldMsg'> Please select State/UT.</span>
							</div>


						<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup>
						</label>
						<div class="col-sm-3">

								<select class="form-control input-sm requiredValFld" name="permDistrictId"  id="District-invSate" >
									<option value="0"> --Select-- </option>
																		
								</select>
							<span class='requiredValFldMsg'> Please select District.</span>
						</div>
 

					</div>

					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Company
							Registration Number<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<input type="email" class="form-control input-sm alphanumericValFld requiredValFld" name="promoterDetailsModel.comRegistrationNo"
								id="inputEmail3" placeholder="">
								<span class='requiredValFldMsg'> Please enter Company Registration Number.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">PIN
							Code<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<input class="form-control input-sm pinCodeValFld requiredValFld" type="text" rel="txtTooltip" title="Only 6 digits of valid pin number is allowed." data-toggle="tooltip" data-placement="bottom" maxlength="6" name="promoterDetailsModel.pinCode">
						<span class='requiredValFldMsg'> Please enter PIN Code.</span>
						
						</div>
					</div>

 
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration
							Certificate<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip"  title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="regCertificateFile" name="regCertificateFile"/>
						 <span class='requiredValFldMsg'> Please select Registration Certificate.</span>
						</div>

					</div>


					<br>
 
 
					<div class="inner_wrapper">



						<h1>
							Organisation Chairman <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
						
							<label for="inputEmail3" class="col-sm-3 control-label">Chairman
								Name <sup>*</sup>
							</label>
						  <div class="col-sm-3">
						    <form:input path="promoterDetailsModel.projectChairmanModel.chairmanName" cssClass="form-control input-sm requiredValFld"/>
					         <span class='requiredValFldMsg'> Please enter Chairman Name.</span>
					         </div>
								

							<label for="inputEmail3" class="col-sm-2 control-label">
								Mobile No <sup>*</sup>
							</label>
							<div class="col-sm-3">
								
								<form:input path="promoterDetailsModel.projectChairmanModel.mobileNo" rel="txtTooltip" title="Only 10 digits of valid mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  cssClass="form-control input-sm mobileValFld requiredValFld" maxlength="10"/>
					<span class='requiredValFldMsg'> Please enter Mobile No.</span>



						</div>
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Email
								Address<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.emailId" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"  cssClass="form-control input-sm emailValFld requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Email Address.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Address Line1<sup>*</sup>
							</label>
							<div class="col-sm-3">
								
							<form:input path="promoterDetailsModel.projectChairmanModel.addressLine1" cssClass="form-control input-sm requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Address Line1.</span>
							</div>



						</div>



	<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">
								Address Line 2<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.addressLine2" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"  cssClass="form-control input-sm requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Address Line2.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">State<sup>*</sup>
							</label>
							<div class="col-sm-3">
								
						<select name="chStateUtId" id="chState"  onchange="reloadChildDropdown(this)" class= "form-control input-sm requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
								<span class='requiredValFldMsg'> Please select State.</span>
							</div>

						</div>


	<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">
								District<sup>*</sup>
							</label>
							<div class="col-sm-3">
                                   <select class="form-control input-sm requiredValFld" name="chairManDistrictId"  id="District-chState" >
									<option value="0"> --Select-- </option>
																		
								</select>
							 <span class='requiredValFldMsg'> Please select District.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Pincode<sup>*</sup>
							</label>
							<div class="col-sm-3">
								
							<form:input path="promoterDetailsModel.projectChairmanModel.pincode"  rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" cssClass="form-control input-sm pinCodeValFld requiredValFld"/>
					
							<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>

						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="chairManPhoto" name="chairManPhoto" />
							<span class='requiredValFldMsg'> Please select Photograph.</span>
							</div>
 
						</div>

 
					</div>

					<div class="inner_wrapper">


						<h1>
							Organisation Member <span>Details <sup>*</sup></span>
						</h1>
						
						
						<div id='member-dls-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						
						<div class="form-group">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Member
									Name<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm requiredValFld" name="memberName"/>
								<span class='requiredValFldMsg'> Please enter Member Name.</span>
								</div>

								<label for="inputEmail3" class="col-sm-2 control-label" >
									Member Type<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld " name="memberType">
									<option value="0">Select</option>
									<option value="Director">Director</option>
									<option value="Board Member">Board Member</option>
									
									</select>
								<span class='requiredValFldMsg'> Please select Member Type.</span>
								</div>
							</div>
 
							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Mobile
									No<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm mobileValFld requiredValFld" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  name="memberMobileNo" maxlength="10"/>
								<span class='requiredValFldMsg'> Please enter Mobile No.</span>
								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Email
									Address<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@zyx.com" data-toggle="tooltip" data-placement="bottom"  name="memberEmailId" />
								<span class='requiredValFldMsg'> Please enter Email Address.</span>
								</div>
							</div>



                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address Line1<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm requiredValFld"  name="memberAddressLine1"/>
							<span class='requiredValFldMsg'> Please enter Address Line1.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Address Line2<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text"  class="form-control input-sm requiredValFld" name="memberAddressLine2" id="memberAddressLine2"/>
							<span class='requiredValFldMsg'> Please enter Address Line2.</span>
							</div>
							
							</div>
							 
                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
							<div class="col-sm-3 ">
									<select name="chStateUtId" id="prMemberState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld input-sm requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
							 <span class='requiredValFldMsg'> Please select State.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								
								    <select class="form-control dynaselectfld input-sm requiredValFld " name="memberDistrictId"  id="District-prMemberState" >
									<option value="0"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							 
							</div>
							
							</div>
							
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm pinCodeValFld requiredValFld" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  name="memberPinCode"/>
							<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="memberPhotoFile" id="memberPhotoFile"/>
							 <span class='requiredValFldMsg'> Please select Photograph .</span>
							</div>
							
							</div>
							
						</div>
						</div>
						</div>
						    <!-- add more -->
						    
						    <div class="form-group">

							<div class="col-sm-2 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore" id="member-dls"> Add
									more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						
						
						</div>



					
					<br>
					<div class="inner_wrapper">
						<h1>
							 RERA Registration Details with any <span>other State/UTs</span>
						</h1>
						<div id='blacklist-dls-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">RERA Registration Number<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm alphanumericValFld requiredValFld" name="certificateNo"
										id="certificateNo" />
								<span class='requiredValFldMsg'> Please enter RERA Registration Number.</span>
								</div>



								<label for="inputEmail3" class="col-sm-2 control-label">
								State/UTs<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld" name="otherStateId">
									   <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>    			
									
									</select>
									<span class='requiredValFldMsg'> Please select State/UTs .</span>
								 
								</div>
							</div>
						
				

							<div class="form-group">


								<label for="inputEmail3" class="col-sm-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 ">
									<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList' class='dynaselectfld input-sm'>
									 <input type="radio" name="isBalckList"	id="isBalckList" value="YES" class='dynaselectfld input-sm requiredValFld' onclick='showrelatedfld(this)'> Yes
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" name="isBalckList" id="isBalckList" value="NO" class='dynaselectfld input-sm requiredValFld' onclick='hiderelatedfld(this)'> No
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>
									</label>
								 
								</div>


								<label for="inputEmail3" class="col-sm-2 control-label" id='LblisBalckList' style='display:none;'>
									Reason for Revoked<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld input-sm requiredValFld" style="display: none;" name="blacklist" id='FldisBalckList'>
									<option value='0'> --Select-- </option>
									      <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" >Further Investigation</option>
									     <option value="Misleading information" >Misleading information</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement</option>
									 
									</select>
									<span class='requiredValFldMsg'> Please select Reason for Revoked .</span>
								 
								</div>
							</div>

						</div>
						</div>
						<div class="form-group">

							<div class="col-sm-2 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore" id="blacklist-dls"> Add
									more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

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
							<span class='requiredValFldMsg'> Please enter Project Description.</span>
							</div>




						</div>




						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld input-sm requiredValFld" name="projectCurrentStatus" id='projectCurrentStatus' onchange="ocCurrentStatus(this)" >
									<option value="0"> --Select--  </option>
										<option value="Completed">Completed </option>
									    <option value="Ongoing">Ongoing</option>
									    <option value="Delay">Delay</option>
									 
									</select>
									<span class='requiredValFldMsg'> Please select status .</span>
								 
								</div>
 <!-- Customized for RERA Bihar -->                                 

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
<!--  -->
							<div class="form-group dynaselectfld" id='DVoccupancyType'>
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type Of Occupancy </label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld " name="typeOfLand" id="occupancyType" onchange="others(this)">
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
									there any case pending</label>
								<div class="col-sm-3 ">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending' class='dynaselectfld input-sm'>
									&nbsp;&nbsp;Yes&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="YES"class='dynaselectfld requiredValFld' id="isCasesPending" onclick='showrelatedfld(this)' />
									&nbsp;&nbsp;No&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="NO" class='dynaselectfld requiredValFld'	id="isCasesPending"  onclick='hiderelatedfld(this)'>
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>

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
							<div class="col-sm-3 ">
								<textarea class="form-control input-sm requiredValFld" name="projectAddress" id="" rows="3"></textarea>
							<span class='requiredValFldMsg'> Please enter Address.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-3">
							<select name="stateUtId" id="pervSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld input-sm requiredValFld">
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
                        		<select class="form-control dynaselectfld input-sm requiredValFld " name="pervProjDistrictId"  id="District-pervSate" >
									<option value="0"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							 
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm pinCodeValFld requiredValFld" rel="txtTooltip" title="Only 6 digits of valid pin number is allowed." data-toggle="tooltip" data-placement="bottom"  name="projectAddrPinCode" id="projectAddrPinCode" maxlength="6"/>
							
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

 
			</div>
			<!--inner container end here-->
	</div>
		<!-- container end here-->

</div>


	
            </form:form>

			<div class="button-wrapper">
				<input name="btn1" class="btn-style" value="Next" type="button" onclick="saveOrUpdateCompanyPromoter()">
			</div>

			<br>
 
	
</body>
</html>
