<%@page import="in.gov.rera.common.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<style>

.dash_detail_grid .table-responsive {margin-top:25px;width:750px; left:50px; text-align:center; font-size:16px !important;
 position: relative;  }
.dash_detail_grid table th{ background-color:#b3b3b3;border-color:#992400; border: 2px !important; text-align: center;
font-size: 16px; padding: 8px; 
font-weight:600; text-transform: uppercase; color: #676767;}
.dash_detail_grid table td{ border-color:#992400; border-width:2px; color:#676767; font-size: 14px; 
background-color:#fff; padding: 8px; }
</style>
</head>
<body>

	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1 ">
			<div class="stepwizard-row setup-panel">


				<div class="stepwizard-step fill">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step fill">
					<a href="#step-2" type="button" class="btn btn-success btn-circle">2</a>
					<p>Project Detail</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-success btn-circle">3</a>
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
			<div class="inner_wrapper upload">



				<h1>
					Upload <span> Documents</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>


				<form class="form-horizontal" id="trxForm" action="saveUploadProjectDoc" enctype="multipart/form-data" method="post">

                     <input type="hidden" name="projectDocModel.docId" value="0"/>
                     <br/>
					<div class="drop_shadow">
						
						</div>
                  					<table class="table table-responsive table-bordered"> 
					     <tr>
					        <th>Year</th>
					        <th><%=DateUtil.getYearBack(1) %></th>
					        <th><%=DateUtil.getYearBack(2) %></th>
					        <th><%=DateUtil.getYearBack(3) %></th>
					        
					       
					     </tr>
					  <tr>
					  
					     <td>Balance Sheet<sup>*</sup></td>
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited ProfitLoss Statement<sup>*</sup></td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report<sup>*</sup></td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement<sup>*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
							</td>
					  
					  </tr>
					  
					  
					</table>
					
					<br/><br/><br/>
					<div class="drop_shadow">
						
						</div>
					   
					<div class="form-group">
						<label class="col-sm-3 control-label">PAN Card<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label"> Encumbrance Certificate<sup>*</sup>
							</label>
						<div class="col-sm-3">
						<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
			
						
					    </div>


					</div>
					
					
					

					<div class="form-group">
						<label class="col-sm-3 control-label">Notice of Commencement</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Commencement Certificate.</span-->
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved
							Sanctioned Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Sanctioned Plan.</span>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
						</div>


					</div>


					<div class="form-group">
						<label class="col-sm-3 control-label">Approved Layout Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Approved layout Plan.</span-->
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma for Sale of Agreement <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma for Sale of Agreement.</span>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Land documents &
							Location<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Documents & Location.</span>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned
							Layout Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Sanctioned Layout Plan.</span-->
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Area Development
							Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Area Development Plan.</span-->
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma
							of Allotment Letter<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Brochure of Current
							Project</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<!--  >span class='requiredValFldMsg'> Please select Brochure og Current Project.</span-->
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Related Documents<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectRelatedDocumentsFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Related Documents.</span>
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Declaration (Form B).</span>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
						</div>


                      
						<label for="inputEmail3" class="col-sm-2 control-label">Land Deed Agreement<sup>*</sup></label>
						<div class="col-sm-3">
                           
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Deed Agreement.</span>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>

						</div>


					</div>
					
					
					




					<div class="inner_wrapper">
                         <div id='pre_project-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectPhotoFile" name="projectPhotoFile"/>
								<span class='requiredValFldMsg'> Please select Photo.</span>
							</div>



						</div>



					</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">
                  	<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span><span class="theme-clr addmore" id="pre_project"> Add
								more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>



					</div>








				</form>





			</div>
			<!--inner container end here-->


			<div class="button-wrapper">


				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editProjectDetailsForm')" /> <input
					name="btn1" class="btn-style" value="Next" onclick="nextProjectPaymentForm()" type="button">
			</div>

			<br>



		</div>
		<!-- container end here-->


	</div>

</body>
</html>