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

function showhideflds(sel){
	var val=$(sel).val();
	if(val=='Delayed'){
		$('#delayedfldId').show();
	}else{
		$('#delayedfldId').hide();
	}
}




function getAgentDetails(spn) {
	
	var sid=$(spn).attr('id');
	var agentRegNo=$('#fldno'+sid).val();
	
	$.ajax({
		type : "GET",
		url : "getAgentDetailforProjectReg",
		data : "agentRegNo=" + agentRegNo+"&SID="+sid,
		success : function(response){
			
			var st=response.split("~");
			var iddd=st[0];
			if(st.length==2){
				
				$('#result'+iddd).text('Agent Not Found.');
				$('#result'+iddd).css('color','red');
			}else if(st.length==4){
				
				$('#fldnameno'+iddd).val(st[2]);
				$('#fldaddressno'+iddd).val(st[3]);
				$('#result'+iddd).text('Added Sucessfuly');
				$('#result'+iddd).css('color','green');
			}
		},

		error : function(e) {alert('Error: ' + e);}

	});

}

</script>
</head>
<body>
	<div class="breadcrumb">Home / Real Estate Project Registration ${projextNameArr}</div>
 
	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel ">


				<div class="stepwizard-step fill">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>

				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-success btn-circle">2</a>
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
					Project <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>


				<form:form class="form-horizontal" action="saveProjectDetails" modelAttribute="projectRegistrationModel" id="trxForm" method="post" >




                    <!-- PROJECT DETAILS START -->


					<div class="form-group">
						<form:hidden path="projectRegId" />
						<label class="col-sm-3 control-label">Project Name<sup>*</sup></label> <input
							type="hidden" id="nextForm" name="nextForm" value="docUploadFrom" />

						<div class="col-sm-3">
							<form:input path="projectDetailsModel.projectName"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Project Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Description<sup>*</sup></label>
						<div class="col-sm-3">

							<form:textarea path="projectDetailsModel.projectDescription"
								row="3" id="currentProjectDesc" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Project Description.</span>
						</div>


					</div>





					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project	Type <sup>*</sup></label>
						<div class="col-sm-3">

							<form:select path="projectDetailsModel.projectType"
								class="form-control requiredValFld">
								<form:option value="0" label="Select" />
								<form:option value="Residential/Group Housing" label="Residential/Group Housing" />
								<form:option value="Commercial" label="Commercial" />
								<form:option value="Mixed Development" label="Mixed Development" />
								<form:option value="Plotted Development" label="Plotted Development" />
								

							</form:select>
								<span class='requiredValFldMsg'> Please select Project Type.</span>

						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Status<sup>*</sup></label>
						<div class="col-sm-3">
                                <form:select path="projectDetailsModel.projectStatus" onchange="showhideflds(this)"
								cssClass="form-control requiredValFld">
								<form:option value="0" label=" --Select-- " />
								<form:option value="New Project Launch" label="New Project Launch" />
								<form:option value="Delayed" label="Delayed" />
								<form:option value="Ongoing" label="Ongoing" />
								<form:option value="Completed" label="Completed" />

							</form:select>
								<span class='requiredValFldMsg'> Please select Project Status.</span>
								
						</div>

					</div>
<div id='delayedfldId' style="display:none;">
                      <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Reason For Delayed<sup>*</sup></label>
						<div class="col-sm-3">
							
                              <form:input path="projectDetailsModel.reasonForDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									 <span class='requiredValFldMsg'> Please enter reason for delayed.</span>

						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">No of Month (Delayed)<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group ">
								<form:input path="projectDetailsModel.noOfMonthDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									<span class='requiredValFldMsg'> Please enter no. of month delayed.</span>
								

							</div>

						</div>
                         </div>
					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Start Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group">

								<form:input path="projectDetailsModel.startDate" readonly="true"
									cssClass="form-control input-sm augCalCssClass requiredValFld" />
									<span class='requiredValFldMsg'> Please enter Start Date.</span>
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>


						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project End Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group ">
								<form:input path="projectDetailsModel.completionDate"
									readonly="true" cssClass="form-control input-sm augCalCssClass requiredValFld" />
									<span class='requiredValFldMsg'> Please enter End Date.</span>
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>

						</div>

					</div>




					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Area Of Land (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">

							<form:input path="projectDetailsModel.totalAreaOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Land.</span>
						</div>
					</div>



					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Open Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalOpenArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Open Area.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">Total
							Covered Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalCoverdArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Covered Area.</span>
						</div>




					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine1"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine2"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
						</div>
					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select class="form-control requiredValFld" name='projectDistrictId' id="projectDist" onChange="reloadSubDistrict(this)">
						
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.districtModelSet}" var="dst">
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select District.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub
							District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="subDistrictId" class="form-control requiredValFld" id="SubDistrict-projectDist">
							
							</select>
							<span class='requiredValFldMsg'> Please select Tehsil/Sub District.</span>
						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Khesra No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.khesraNo" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Khesra No.</span>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Latitude of End point of the plot<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.latitudeEndPt" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Latitude of End point of the plot.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">Longitude of End point of the plot(Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.longitudeEndPt" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Longitude of End point of the plot(Sq Mtr).</span>
						</div>


					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No.
							of Garages Available for Sale<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfGarageForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No of Garages Available For Sale.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Total Area of Garages (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfGarageForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Area Of Garages.</span>
						</div>


					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No.
							of Open Parking<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No Of Open Parking.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Total Area Of Open Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Open Parking.</span>
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No.
							of Covered Parking<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No Of Covered Parking.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Total Area Of Covered Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" rel="txtTooltip" title="Only digits allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm   requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Covered Parking.</span>
						</div>


					</div>

					
					
					
		          <!-- PROJECT DETAILS END -->
		          
					
					<br>

					<div class="inner_wrapper">


						<h1>
							Development <span>Details</span>
						</h1>


                     <div class="" id='developmentSection-dv' class='addmoredv'>
						<div class="drop_shadow">  <span onClick="deloptdv(this);" style='float: right;'>DELETE</span> </div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Type of flats/shops/inventory (2 BHK, 3 BHK, Shops etc.)<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="typeOfInventory"
									class="form-control input-sm requiredValFld" id="typeOfInventory" name="typeOfInventory" />
									<span class='requiredValFldMsg'> Please enter Type Of flats/shops etc in this category.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">No. of Flats/Shops etc. in this Category<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=noOfInventory rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm numericValFld requiredValFld" id="noOfInventory" />
									<span class='requiredValFldMsg'> Please enter No. of Flats/Shops etc. in this Category</span>
							</div>
						</div>	
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Permissible FAR<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="proposedFar"
									class="form-control input-sm requiredValFld" id="proposedFar" name="proposedFar" />
									<span class='requiredValFldMsg'> Please enter Permissible FAR.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned FAR<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=sanctionedFar rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm  requiredValFld" id="sanctionedFar" />
									<span class='requiredValFldMsg'> Please enter Sanctioned FAR.</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Proposed No of Building(s) or Wing(s)<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="proposedBldgNo"
									class="form-control input-sm requiredValFld" id="proposedBldgNo" name="proposedBldgNo" />
									<span class='requiredValFldMsg'> Please enter Proposed No of Building(s) or Wing(s).</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned No of Building(s) or Wing(s)<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=sanctionedBldgNo rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm  requiredValFld" id="sanctionedBldgNo" />
									<span class='requiredValFldMsg'> Please enter Sanctioned No of Building(s) or Wing(s).</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Proposed No of Floors<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="proposedFloors"
									class="form-control input-sm requiredValFld" id="proposedFloors" name="proposedFloors" />
									<span class='requiredValFldMsg'> Please enter Proposed No of Floors.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned No of Floors<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=sanctionedFloors rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm requiredValFld" id="sanctionedFloors" />
									<span class='requiredValFldMsg'> Please enter Sanctioned No of Floors.</span>
							</div>
						</div>		
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Aggregate area of the recreational open space<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="recreationalOpenSpace"
									class="form-control input-sm requiredValFld" id="recreationalOpenSpace" name="recreationalOpenSpace" />
									<span class='requiredValFldMsg'> Please enter Aggregate area of the recreational open space.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Architecture/Design standards used<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=archDesignStandard  
									class="form-control input-sm requiredValFld" id="archDesignStandard" />
									<span class='requiredValFldMsg'> Please enter Architecture/Design standards used.</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Type of construction technology<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="typeOfConstruction"
									class="form-control input-sm requiredValFld" id="typeOfConstruction" />
									<span class='requiredValFldMsg'> Please enter Type of construction technology.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Earthquake resistant measures adopted for building and common areas<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=earthquakeResistant  
									class="form-control input-sm  requiredValFld" id="earthquakeResistant" />
									<span class='requiredValFldMsg'> Please enter Earthquake resistant measures.</span>
							</div>
						</div>



						


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Carpet
								Area (Sq ft)<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=carpetArea class="form-control input-sm   requiredValFld" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									id="carpetArea" />
									<span class='requiredValFldMsg'> Please enter Carpet Area.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Area
								of exclusive balcony/verandah (Sq ft)<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=areaOfExclusive rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm   requiredValFld" id="areaOfExclusive" />
									<span class='requiredValFldMsg'> Please enter Area Of Exclusive Balcony/Verandah.</span>
							</div>



						</div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Area
								of exclusive open terrace if any (Sq ft)</label>
							<div class="col-sm-3 ">
								<input type="text" name=areaOfExclusiveOpenTerrace rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm   " id="areaOfExclusiveOpenTerrace" />
									
							</div>

						</div>

					</div>
</div>

					<div class="form-group">

						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span>
								<span class="theme-clr addmore" id="developmentSection"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>
					</div>

					<div class="inner_wrapper">



						<h1>
							External Development <span>Work</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Road System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.roadSysetmDevBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
									<span class='requiredValFldMsg'> Please select Road System.</span>

							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Water
								Supply<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.waterSupplyBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Water Supply.</span>
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Sewage
								and Drainage System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />
								</form:select>
								<span class='requiredValFldMsg'> Please select Sewage and Drainage System.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Electricity
								Supply Transformer And Sub Station<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.electricityAndTrasfomerSupply"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Electricity Supply Transfer And Sub Station.</span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Solid
								Waste Management And Disposal<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select id="solidWasteSupplyBy" class="form-control requiredValFld" path="externalDevelopmentWorkModel.solidWasteSupplyBy">
									<option value="0">Select</option>
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Solid Waste Management And Disposal.</span>
							</div>


						</div>

	<div class="inner_wrapper">


						<DIV ID="other_dev_work-dv" class="addmoredv">
							<div class="drop_shadow">
								<span onClick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Work
									Description</label>
								<div class="col-sm-3">
									<input type="text" name="extDevWorkDesc" class="form-control requiredValFld" />
									<span class='requiredValFldMsg'> Please enter work Description.</span>
	                                
						
								</div>



								<div class="col-sm-3">
									<select name="developeBy" class="form-control requiredValFld">
										<option value="0">Select</option>
										<option value="Local Authority">Local Authority</option>
										<option value="Self Development">Self Development</option>

									</select>
									<span class='requiredValFldMsg'> Please select One.</span>

								</div>


							</div>
						</DIV>
	</div>

						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span>
								<span class="theme-clr addmore" id="other_dev_work"> Add
								more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>
						
						
						

					</div>


					<br>


					<div class="inner_wrapper">



						<h1>
							Project Bank <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Bank
								Name<sup>*</sup></label>
							<div class="col-sm-3">
								
								<select name="projectBankId" class="form-control requiredValFld">
								      <option value="0"> --Select-- </option>
						        
								     <c:forEach  items="${bankList}" var="b">
								  <option value='${b.bankId}'> ${b.bankName } </option>
						        </c:forEach>
						       
								</select>	
									<span class='requiredValFldMsg'> Please select Bank Name.</span>
									
									
									
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">
								Branch Name<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.bankBranch"
									cssClass="form-control input-sm requiredValFld" />
									<span class='requiredValFldMsg'> Please enter Branch Name.</span>
							</div>


						</div>



						<div class="form-group">


							<label for="inputEmail3" class="col-sm-3 control-label">Account
								No.<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.accountNumber" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
									cssClass="form-control input-sm numericValFld requiredValFld" maxlength="17"/>
									<span class='requiredValFldMsg'> Please enter Account Number.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">IFSC
								Code<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.ifscCode"
									cssClass="form-control input-sm alphanumericValFld requiredValFld" />
									<span class='requiredValFldMsg'> Please enter IFSC Code.</span>

							</div>
						</div>

	                                          <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="bankStateUtId" id="banktSate"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control requiredValFld" name="bankDistrictId"  id="District-banktSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								










					</div>

                    <!-- Agent start -->

					<div class="inner_wrapper">
						<h1>
							Associated Vendor <span>Details</span>
						</h1>

						<div class="inner_wrapper">
							<h1>
								Project <span>Agent</span>
							</h1>

							<div id='project-agent-dv' class='addmoredv'>

								<div class="drop_shadow">
									<span onClick="deloptdv(this);" style='float: right;'>DELETE</span>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="fldnogetagent" name="agentRegNo" class="form-control  dynaselectfld alphanumericValFld requiredValFld" >
											<span class='requiredValFldMsg'> Please enter Agent Registration Number.</span>
												 <label class="input-group-addon btn"
												    for="testdate" >
												
												 <span id='getagent' class="glyphicon glyphicon-search dynaselectfld" onClick="getAgentDetails(this)"> </span>
											</label>
										</div>
									</div>

                                    <label for="inputEmail3" id='resultgetagent' class="col-sm-2 control-label dynaselectfld"> </label>
									<div class="col-sm-3">
									</div>
								</div>



								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld requiredValFld" id='fldnamenogetagent' disabled name="agentName" />
										
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent' disabled name="agentAddress" />
									</div>


								</div>

							</div>
							</div>

						
						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span>
									<span id='project-agent' class="theme-clr addmore"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						<!-- agent end -->

						<br>


                       <!--Project  Architects start-->

						<div class="inner_wrapper">
							<h1>
								Project <span>Architects</span>
							</h1>


                           <DIV id="projectArc-dv" class ="addmoredv">
							
							<div class="drop_shadow">
								<span onClick="deloptdv(this);" style='float: right;'>DELETE</span></div>
							
							
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Architect
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" type="text"
										name="architectName"  />
										<span class='requiredValFldMsg'> Please enter Architect Name.</span>

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" name="arctEmailId" rel="txtTooltip" title="Only valid eamilId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine1"
											id="arctAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine2"
											id="arctAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="arctSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="arctProjDistrictId"  id="District-arctSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="arctPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="arctPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctYearOfEst"
											id="arctYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" />
											<span class='requiredValFldMsg'> Please enter Key projects completed .</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
								

                           </DIV>

                       </div>

	                  
						
						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span>
									<span class="theme-clr addmore" id="projectArc"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						


                      <!--Project  Architects end-->

						<br>



                         <!--Structural Engineers start -->

						<div class="inner_wrapper">
							<h1>
								Structural <span>Engineers</span>
							</h1>
                            <DIV id="structuralEng-dv" class="addmoredv">
							<div class="drop_shadow"> <span onClick="deloptdv(this);" style='float: right;'>DELETE</span>   </div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Engineer
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" name="engineerName"
										id="engineerName" />
										<span class='requiredValFldMsg'> Please enter Engineer Name.</span>
								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" id="strcEmailId" name="strcEmailId"
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine1"
											id="strcAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine2"
											id="strcAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="strcStateUtId" id="strcSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
										<span class='requiredValFldMsg'>Please select State.</span>	
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="strcProjDistrictId"  id="District-strcSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'>Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="strcPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="strcPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcYearOfEst"
											id="strcYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" />
											<span class='requiredValFldMsg'> Key projects completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
																					
							</DIV>
							

						</div>

						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span>
									<span class="theme-clr addmore" id="structuralEng" > Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						
						
						<!--Structural Engineers end -->
						
						<br>

                         <!--Project Engineers Contractors -->
						
						<div class="inner_wrapper">
							<h1>
								Project <span>Contractors</span>
							</h1>
                            
                            <DIV id="projectContractors-dv" class="addmoredv">

							<div class="drop_shadow"> <span onClick="deloptdv(this);" style='float: right;'>DELETE</span> </div>


                             


							<div class="form-group">
             

								<label for="inputEmail3" class="col-sm-3 control-label">Contractor
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" name="contractorName"
										id="contractorName">
										<span class='requiredValFldMsg'> Key projects Contractor Name.</span>
								</div>

								
								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" id="cntrEmailId" name="cntrEmailId" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Key projects Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine1"
											id="cntrAddressLine1" />
											<span class='requiredValFldMsg'> Key projects Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine2"
											id="cntrAddressLine2" />
											<span class='requiredValFldMsg'> Key projects Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="cntrStateUtId" id="cntrSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'>Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="cntrProjDistrictId"  id="District-cntrSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'>Please select District.</span>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="cntrPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"
											id="cntrPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrYearOfEst"
											id="cntrYearOfEst" />
											<span class='requiredValFldMsg'>Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrKeyProjectCompleted" id="cntrKeyProjectCompleted" />
										<span class='requiredValFldMsg'>Please enter Key Projects Completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
             
             
             
             
                    	</DIV>
                    	</div>

						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore" id="projectContractors"> Add	More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
                     <!--Project Engineers Contractors end-->
						

					</div>
				</form:form>
			</div>

			<div class="button-wrapper">
			<c:choose>
			<c:when  test="${projectRegistrationModel.registrationType=='INDVISUAL_REG' }">
				<input name="btn1" class="btn-style" value="Previous" type="button"	onclick="pervForm('editRegInvForm')" /> 
				</c:when>
				<c:otherwise>
				<input name="btn1" class="btn-style" value="Previous" type="button"	onclick="pervForm('editPromoterComDels')" />
				</c:otherwise>
			</c:choose>		
					
					<input name="btn1"	class="btn-style" value="Next" type="button" onClick="saveOrUpdateProjectDetailsForm()" />
			</div>
			<!-- 
			
			<div class="button-wrapper">
				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editRegInvForm')" /> <input name="btn1"
					class="btn-style" value="Next" type="button"
					onclick="saveOrUpdateProjectDetailsForm()" />
			</div>
			
			 -->

			<br>



		</div>
	</div>

</body>
</html>