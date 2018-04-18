<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<script src="<%=request.getContextPath() %>/resources/projectjs/projectJs.js"></script>

</head>
<body>
	<form:form method="POST" modelAttribute="projectRegistrationModel" action="invOrComProjectRegForm" id="trxForm">


		<div class="breadcrumb">Home / Real Estate Project Registration</div>


		<!--News Ticker-->
		<div class="container">

			<!--main container start here-->
			<div class="Main_containner">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">

                 

					<h1>
						Registration <span> Form</span>
					</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>


					<form class="form-horizontal">
						<br> <label class="col-sm-2 control-label">Promoter
							Type</label>
						<div class="radio ">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios1" value="option1" checked  onclick="changeLabelText('#emailIdLabel','Email ID','projectRegInvForm')"/> 
								Individual
								
								
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
								type="radio" name="optionsRadios" onclick="changeLabelText('#emailIdLabel','Business Email ID','projectRegComForm')" id="optionsRadios1"
								value="option1" /> Societies / Company/Partnership firm /competent authority / Limited Liability Partnership/ Trust 
								<input type="hidden" name="nextForm" id="nextForm" value='projectRegInvForm'>
							</label>
                            
						</div>
						<br>


						<div class="form-group">
							<label class="col-sm-2 control-label" id="emailIdLabel">Email ID<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="email" class="form-control input-sm emailValFld requiredValFld"
									id="emailId" placeholder="" name="emailId">
									<span class='requiredValFldMsg'> Please enter Email Id.</span>
							</div>


						</div>




					</form>


					<br> <br>



				</div>
				<!--inner container end here-->


				<div class="button-wrapper">
					<input name="btn1" class="btn-style" value="Next" type="button" onclick="projectForm()"/>
				</div>

				<br>



			</div>
			<!-- container end here-->


		</div>


	</form:form>

</body>
</html>