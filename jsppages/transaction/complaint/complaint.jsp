<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<script
	src="<%=request.getContextPath()%>/resources/complaintjs/complaint.js"></script>
<script>
	function choosepaymentmethod(slct) {
		var val = $(slct).val();
		if (val == 'Payment Gateway') {
			$(".optionfld2").each(function() {
				$(this).hide();
			});
			document.paymenttrxForm1.action = 'redirectpaymentgateway';
		} else {
			$(".optionfld2").each(function() {
				$(this).show();
			});
			document.paymenttrxForm1.action = 'saveComplaint';
		}
	}

	function hideShow() {
	
		var interimOrderRequired1 = $("input[name='interimOrderRequired']:checked").val()

		if (interimOrderRequired1 == "YES") {

			$('#interimOrderPrayed').show();
		}
		if (interimOrderRequired1 == "NO"){
			$('#interimOrderPrayed').hide();
		}
	}
</script>

</head>

<body>
	<form:form action="saveComplaint" method="post"
		cssClass="form-horizontal" id="complaint" commandName="complaintModel"
		name="paymenttrxForm11" enctype="multipart/form-data">


		<!--Banner-->


		<div class="breadcrumb">Home / Real Estate Complaint Registration</div>


		<!--News Ticker-->
		<div class="container">

			<!--main container start here-->
			<div class="Main_containner comp">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">



					<h1>Complaint Registration Form</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>






					<div class="inner_wrapper">
						<h1>
							Details of the <span>Complainant</span>
						</h1>
						<div class="drop_shadow"></div>
						<div class="clearfix"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Name of Complainant<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="applicateName"
									cssClass="form-control input-sm" rel="txtTooltip" title="Only Alphabets are allowed" 
					     data-toggle="tooltip" data-placement="bottom" />
							</div>





							<label for="inputEmail3" class="col-sm-2 control-label">Telephone
								Number <sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="applicatePhoneNo"
									cssClass="form-control input-sm" maxlength="8" rel="txtTooltip" title="Only Digits are allowed." 
					     data-toggle="tooltip" data-placement="bottom" />
							</div>



						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Mobile Number<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="applicateMobileNo"
									cssClass="form-control input-sm" maxlength="10" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." 
					     data-toggle="tooltip" data-placement="bottom" />
							</div>




							<label for="inputEmail3" class="col-sm-2 control-label">EmailId
								<sup>*</sup>
							</label>
							<div class="col-sm-3">
								<form:input path="applicateEmailId"
									cssClass="form-control input-sm" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" />
							</div>



						</div>



						<div class="inner_wrapper">
							<h2>Official/Residential Address</h2>
							<br>




							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">Address
									line 1<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResAddressLine1"
										cssClass="form-control input-sm" maxlength="50" />


								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Address
									line 2<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<form:input path="applicateResAddressLine2"
										cssClass="form-control input-sm" maxlength="50" />

								</div>


							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
								<div class="col-sm-3">


									<select name="applicantSateId" id="applicantSate"
										onchange="reloadChildDropdown(this)"
										class="form-control dynaselectfld">
										<option value='0'>--Select--</option>
										<c:forEach items="${stateUtList}" var="st">
											<option value='${st.stateUtId }'>${st.stateUtName }</option>
										</c:forEach>
									</select>



								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld"
										name="applicantDistrictId" id="District-applicantSate">
										<option value="0">--Select--</option>

									</select>

								</div>




							</div>






							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Pin
									Code<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResPinCode"
										cssClass="form-control input-sm" maxlength="6" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"/>


								</div>


							</div>


						</div>




						<div class="inner_wrapper">

							<div class="form-group">
								<div class="col-md-12">
									<h2>
										Address for Service of All Notices <span>Same as above</span>
										<input id="applicantCapyAdd" onclick="copyAppResAdd()"
											class="test" type="checkbox" />
									</h2>
								</div>




							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">Address
									line 1<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResSameAsAddressLine1"
										cssClass="form-control input-sm " />


								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Address
									line 2<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<form:input path="applicateResSameAsAddressLine2"
										cssClass="form-control input-sm" />

								</div>


							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
								<div class="col-sm-3">


									<select name="applicantResSameAsSateId" id="resSameAsSate"
										onchange="reloadChildDropdown(this)"
										class="form-control dynaselectfld">
										<option value='0'>--Select--</option>
										<c:forEach items="${stateUtList}" var="st">
											<option value='${st.stateUtId }'>${st.stateUtName }</option>
										</c:forEach>
									</select>



								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld"
										name="resSameAsDistrictId" id="District-resSameAsSate">
										<option value="0">--Select--</option>

									</select>

								</div>




							</div>






							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Pin
									code<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResSameAsPinCode"
										cssClass="form-control input-sm" maxlength="6" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"/>


								</div>


							</div>



						</div>



						<div class="inner_wrapper">

							<h1>
								Details of the <span>Respondent</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Name of Respondent <sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentName"
										cssClass="form-control input-sm" />

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">Telephone
									Number <sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentPhoneNo"
										cssClass="form-control input-sm" maxlength="10" rel="txtTooltip" title="Only 6-10 digits of landline number is allowed." data-toggle="tooltip" data-placement="bottom"/>

								</div>



							</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Mobile Number<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentMobileNo"
										cssClass="form-control input-sm" maxlength="10" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"/>

								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">
									Email Address<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentEmailId"
										cssClass="form-control input-sm" maxlength="50" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" />

								</div>




							</div>

							<div class="inner_wrapper">
								<h2>Official/Residential Address</h2>
								<br>




								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">Address
										line 1<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResAddressLine1"
											cssClass="form-control input-sm" />

									</div>
									<label for="inputEmail3" class="col-sm-2 control-label">Address
										line 2<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="respondentResAddressLine2"
											cssClass="form-control input-sm" />

									</div>


								</div>


								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
									<div class="col-sm-3">


										<select name="respondentSateId" id="respondentSate"
											onchange="reloadChildDropdown(this)"
											class="form-control dynaselectfld">
											<option value='0'>--Select--</option>
											<c:forEach items="${stateUtList}" var="st">
												<option value='${st.stateUtId }'>${st.stateUtName }
												</option>
											</c:forEach>
										</select>



									</div>


									<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
									<div class="col-sm-3">
										<select class="form-control dynaselectfld"
											name="respondentDistrictId" id="District-respondentSate">
											<option value="0">--Select--</option>

										</select>

									</div>




								</div>






								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Pin
										Code<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResPinCode"
											cssClass="form-control input-sm" maxlength="6" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"/>

									</div>


								</div>

							</div>




							<div class="inner_wrapper">

								<div class="form-group">
									<div class="col-md-12">
										<h2>
											Address for Service of All Notices <span>Same as above </span> <input
												type="checkbox" id="respondentCheckAddr"
												onclick="copyResponResAdd()" />
										</h2>
									</div>




								</div>





									<div class="form-group">



										<label for="inputEmail3" class="col-sm-3 control-label">Address
											line 1<sup>*</sup>
										</label>
										<div class="col-sm-3">

											<form:input path="respondentResSameAsAddressLine1"
												cssClass="form-control input-sm" />

										</div>
										<label for="inputEmail3" class="col-sm-2 control-label">Address
											line 2<sup>*</sup>
										</label>
										<div class="col-sm-3">
											<form:input path="respondentResSameAsAddressLine2"
												cssClass="form-control input-sm" />

										</div>


									</div>


									<div class="form-group">



										<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
										<div class="col-sm-3">


											<select name="respondentSameAsSateId"
												id="respondentSameAsSate"
												onchange="reloadChildDropdown(this)"
												class="form-control dynaselectfld">
												<option value='0'>--Select--</option>
												<c:forEach items="${stateUtList}" var="st">
													<option value='${st.stateUtId }'>${st.stateUtName }
													</option>
												</c:forEach>
											</select>



										</div>


										<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
										<div class="col-sm-3">
											<select class="form-control dynaselectfld"
												name="respondentSameAsdistrict"
												id="District-respondentSameAsSate">
												<option value="0">--Select--</option>

											</select>

										</div>




									</div>






									<div class="form-group">

										<label for="inputEmail3" class="col-sm-3 control-label">Pin
											Code<sup>*</sup>
										</label>
										<div class="col-sm-3">

											<form:input path="respondentResSameAsPinCode"
												cssClass="form-control input-sm" maxlength="6" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"/>

										</div>


									</div>





							</div>

							<!-- com -->

							<div class="inner_wrapper">

								<h1>
									Details of the <span>Complaint</span>
								</h1>
								<div class="drop_shadow"></div>
								<div class="clearfix"></div>


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Subject of Complaint<sup>*</sup>
									</label>
									<div class="col-sm-6">

										<form:input path="complaintSubject"
											cssClass="form-control input-sm" maxlength="200" />

									</div>




								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Facts
										of Complaint<sup>*</sup>
									</label>
									<div class="col-sm-6">
										<form:textarea path="complaintSummary" rows="3"
											cssClass="form-control input-sm"></form:textarea>
									</div>

								</div>

								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Relief
										Sought from RERA<sup>*</sup>
									</label>
									<div class="col-sm-6">
										<form:input path="reliefSoughtfromRera"
											cssClass="form-control input-sm" maxlength="50" />
									</div>





								</div>


								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Interim
										Order Required<sup>*</sup>
									</label>
									<div class="col-sm-2">
										<div class="radio ">
											<label> <input type="radio"
												name="interimOrderRequired" id="optionsRadios1" value="YES"
												id="INTRIM_ORDER_YES" onclick="hideShow()"> Yes
											</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
												type="radio" name="interimOrderRequired"
												id="INTRIM_ORDER_NO" value="NO" onclick="hideShow()"> No
											</label>

										</div>
									</div>



									<div class="col-sm-4 hideshow" id="itr">

										<form:input path="interimOrderPrayed"
											cssClass="form-control input-sm" />
									</div>


								</div>




							</div>


							<!--  -->

							<div class="inner_wrapper">

                                  <h1>
									Supporting<span>Documents</span>
								</h1>
								<div class="drop_shadow"></div>


								<div id='pre_project-dv' class='addmoredv'>
									<div class="drop_shadow">
										<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
									</div>

									<div class="form-group">
									<label class="col-sm-3 control-label">Caption:
											</label>
										<div class="col-sm-3">
											<input type="text" id="captions" name="captions" class="form-control" />
										</div>
										<label class="col-sm-2 control-label">Attachment:
											</label>
										<div class="col-sm-3">
											<input type="file" id="supportDoc" name="supportDoc" rel="txtTooltip" class="form-control"
											 title="Only image or pdf file is allowed. file size upto 1 MB" 
					     data-toggle="tooltip" data-placement="bottom" />
										</div>



									</div>
								</div>
							</div>




	<div class="form-group">
									<div class="col-sm-2 pull-right" style="text-align: right;">
										<span class="glyphicon glyphicon-plus-sign theme-clr "
											aria-hidden="true"></span><span class="theme-clr addmore"
											id="pre_project"> Add
											more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

									</div>



								</div>

















							<div class="inner_wrapper">



								<h1>
									Payment<span></span>
								</h1>
								<div class="drop_shadow"></div>




								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Payment Mode<sup>*</sup>
									</label>
									<div class="col-sm-3">



										<select name="paymentmode" id='paymentmode'
											onchange="choosepaymentmethod(this)" class="form-control">
											<option value="0">--Select--</option>
											<option value="Demand Draft">Demand Draft</option>
											<option value="Banker's Cheque">Banker's Cheque</option>
											<option value="Payment Gateway">Payment Gateway</option>

										</select>



									</div>

									<label for="inputEmail3"
										class="col-sm-2 control-label optionfld2"> Bank Name<sup>*</sup>
									</label>
									<div class="col-sm-3 optionfld2">



										<select name="bankName" class="form-control">
											<option value='0'>--Select--</option>
											<c:forEach items="${bankList}" var="obj">
												<option value='${obj.bankId}'>${obj.bankName}</option>
											</c:forEach>
										</select>


									</div>

								</div>


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Amount (INR)<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<input class="form-control input-sm" type="text" name="amount"
											readonly="readonly" value="1000" />

									</div>

									<label for="inputEmail3"
										class="col-sm-2 control-label optionfld2"> Branch<sup>*</sup>
									</label>
									<div class="col-sm-3 optionfld2">
										<input name="bankbranch" class="form-control input-sm " maxlength="50"></input>
									</div>

								</div>

								<div class="form-group optionfld2">
									<label for="inputEmail3" class="col-sm-3 control-label">
										DD/ Cheque No.<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<input type="text" name="ddChequeNo"
											class="form-control  input-sm" maxlength="12"/>
									</div>


									<label class="col-sm-2 control-label"> Attach Scan Copy<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="file" name="attachScanCopy" id="exampleInputFile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" 
					     data-toggle="tooltip" data-placement="bottom">
									</div>
								</div>


								<br>




							</div>






						</div>
						<!--inner container end here-->


						<div class="inner_wrapper">

							<h1>
								<span>Declarations</span>
							</h1>
							<div class="drop_shadow"></div>



							<ul>

								<li><input type="checkbox" name="declaration1"
									id='declaration1' value="Y">&nbsp;&nbsp; I,
									complainant, here by declare that the subject matter of the
									above claim falls within the Jurisdiction of the Authority</li>
								<li><input type="checkbox" name="declaration2"
									id='declaration2' value="Y">&nbsp;&nbsp;I, complainant,
									here by declare that the matter regarding which the complaint
									has been made is not pending before any Court of Law or any
									other Authority or any other Tribunal(s)</li>
								<li><input type="checkbox" name="declaration3"
									id='declaration3' value="Y">&nbsp;&nbsp;I verify that
									the contents of the above sections are true to my personal
									knowledge and belief and I have not suppressed any material
									fact(s)</li>


							</ul>
						</div>



						<div class="button-wrapper">
							<input name="btn1" class="btn-style" value="Submit"
								onclick="submitCompalint()" type="button">
						</div>



					</div>
					<!-- container end here-->

				</div>
			</div>
		</div>
	</form:form>
</body>
</html>