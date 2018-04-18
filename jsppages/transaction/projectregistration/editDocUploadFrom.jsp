<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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


		<form:form cssClass="form-horizontal" id="trxForm" action="updateUploadProjectDoc" modelAttribute="projectRegistrationModel"
		 enctype="multipart/form-data" method="post">

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
                   <form:hidden path="projectDocModel.docId"/>
				      <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         
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
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" 
					     data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
					     <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					     
					     <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.documentId}">${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" 
					     data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
					     <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					         <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.fileName}
							</a>
					
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.documentId}">
							 <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited ProfitLoss Statement<sup>*</sup></td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report<sup>*</sup></td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement<sup>*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					</table>
					
					<br/><br/><br/>
					<div class="drop_shadow">
						
						</div>
					   
					<div class="form-group">
						<label class="col-sm-3 control-label">PAN Card<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB"
							 data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							 <span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label"> Encumbrance Certificate
							<sup>*</sup></label>
						<div class="col-sm-3">
						<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
						
					    </div>


					</div>
					
					
					

					<div class="form-group">
						<label class="col-sm-3 control-label">Notice of Commencement
							</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Commencement Certificate.</span-->
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved
							Sanctioned Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Sanctioned Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
						</div>


					</div>


					<div class="form-group">
						<label class="col-sm-3 control-label">Approved Layout Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Approved layout Plan.</span-->
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma for Sale of Agreement <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							<span class='requiredValFldMsg'> Please select Proforma for Sale of Agreement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Land documents &
							Location<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Documents & Location.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned
							Layout Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Sanctioned Layout Plan.</span-->
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Area Development
							Plan</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Area Development Plan.</span-->
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma
							of Allotment Letter<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
								<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Brochure of Current
							Project</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							<!-- >span class='requiredValFldMsg'> Please select Brochure og Current Project.</span-->
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Related Documents<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectRelatedDocumentsFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
							<span class='requiredValFldMsg'> Please select Project Related Documents.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectRelatedDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectRelatedDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							<span class='requiredValFldMsg'> Please select Declaration (Form B).</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</div>


                      
						<label for="inputEmail3" class="col-sm-2 control-label">Land Deed Agreement<sup>*</sup></label>
						<div class="col-sm-3">
                           
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Deed Agreement.</span>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>

						</div>


					</div>
				


					<div class="inner_wrapper">
					<c:choose>
					<c:when test="${projectPhotoFlag=='NO' }">
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
					</c:when>
					
					<c:otherwise>
					
					<% int pp=0; %>
					<c:forEach items="${projectRegistrationModel.projectPhotoDetailSet }" var="photo">
					<input type="hidden" name="photoId" value="${photo.documentId}" />
					<%if(pp==0){ %>
                         <div id='pre_project-dv' class='addmoredv'>
                         <%}else{ %>
                           <div  class='addmoredv'>
                         <%} pp++; %>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo</label>
							<div class="col-sm-3">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectPhotoFile" name="projectPhotoFile"/>
							<span class='requiredValFldMsg'> Please select Photo.</span>
							<a href="download?DOC_ID=${photo.documentId}">
					         ${photo.fileName}
							</a>
							
							</div>



						</div>



					</div>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</div>

					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">
                  	<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span><span class="theme-clr addmore" id="pre_project"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>



					</div>








			




			</div>
			<!--inner container end here-->


			<div class="button-wrapper">


				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editProjectDetailsForm')" /> 
					<input	name="btn1" class="btn-style" value="Next"  type="submit">
			</div>

			<br>



		</div>
		<!-- container end here-->


	</div>
	</form:form>
