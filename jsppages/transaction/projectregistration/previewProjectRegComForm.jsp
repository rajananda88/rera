<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script type="text/javascript">

function printDiv() {
    /*var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;*/
	window.print();
}
function PrintMe(DivID) {
	var disp_setting="toolbar=yes,location=no,";
	disp_setting+="directories=yes,menubar=yes,";
	disp_setting+="scrollbars=yes,width=650, height=600, left=100, top=25";
	   var content_vlue = document.getElementById(DivID).innerHTML;
	   var docprint=window.open("","",disp_setting);
	   docprint.document.open();
	   docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
	   docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
	   docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
	   docprint.document.write('<head><title>My Title</title>');
	   docprint.document.write('<style type="text/css">body{ margin:0px;');
	   docprint.document.write('font-family:verdana,Arial;color:#000;');
	   docprint.document.write('font-family:Verdana, Geneva, sans-serif; font-size:12px;}');
	   docprint.document.write('a{color:#000;text-decoration:none;} </style>');
	   docprint.document.write('</head><body onLoad="self.print()"><left>');
	   docprint.document.write(content_vlue);
	   docprint.document.write('</center></body></html>');
	   docprint.document.close();
	   docprint.focus();
	}
	
</script>
	<style>

.table-responsive {margin-top:15px;}
table th{ background-color:#eaeaea; border: 0px !important; text-align: left;font-size: 12px; font-weight:600; text-transform: uppercase; color: #676767;}
table td{ color:#676767; font-size: 13px; }
</style>
						<div class="button-wrapper">
			<input name="btn1" class="btn-style" align="right" value="Print" onclick="PrintMe('div1')" type="button">
		</div>

		<br>	
				<form:form class="form-horizontal"
					action="#"
					modelAttribute="projectRegistrationModel" method="post" id="previewtrxForm" >

<div class="container" id="div1">


			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">

<table  width="900px">

				<h1>
					Promoter <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



					<tr class="form-group">
						<td class="col-sm-3 control-label">Type of Promoter</td>
						<td class="col-sm-3">
						
						   <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					        <form:hidden path="projectRegId"/>
					        <form:hidden path="projectDocModel.docId"/>
					        
					       
					   

						<form:select path="promoterDetailsModel.typeOfPromoter" disabled="true"
								cssClass="form-control" onchange="choosePromoterType(this)">
								<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
								<form:option value="Competent Authority">Competent Authority</form:option>
								<form:option value="Limited Liability Partnership"> Limited Liability Partnership</form:option>
								<form:option value="Trust">Trust</form:option>
								<form:option value="Firm">Firm</form:option>
								<form:option value="Other">Other</form:option>

							</form:select>


						</td>
						<td for="inputEmail3" class="col-sm-2 control-label">Name<sup>*</sup>
						</td>
						<td class="col-sm-3">

							<form:input path="promoterDetailsModel.promoterName" disabled="true" 
								cssClass="form-control input-sm" />

						</td>


					</td>



					<tr class="form-group">
					<c:choose>
					<c:when test="${projectRegistrationModel.promoterDetailsModel.typeOfPromoter=='Other' }">
						<tr>
						<td for="inputEmail3" class="col-sm-3 control-label optionfld2" > </td>
						<td class="col-sm-3 optionfld2">
							<form:input path="promoterDetailsModel.ifOther" disabled="true"
								cssClass="form-control input-sm" readonly="true" />

						</td>
						</c:when>
						<c:otherwise>
						<td for="inputEmail3" class="col-sm-3 control-label optionfld2" style="display:none;"> </td>
						<td class="col-sm-3 optionfld2" style="display:none;" >
							<form:input path="promoterDetailsModel.ifOther"
								cssClass="form-control input-sm" readonly="true" />

						</td>
						</c:otherwise>
						</c:choose>
						<td for="inputEmail3" class="col-sm-3 control-label">
							PAN Number <sup>*</sup>
						</td>
						<td class="col-sm-3">

							<form:input path="promoterDetailsModel.panNo" disabled="true"
								cssClass="form-control input-sm" />

						</td>

					</td>




					<tr class="form-group">
						<td for="inputEmail3" class="col-sm-3 control-label">E-mail<sup>*</sup></td>
						<td class="col-sm-3">
							<form:input path="promoterDetailsModel.emailId" disabled="true"
								cssClass="form-control input-sm" />
						</td>
						<td for="inputEmail3" class="col-sm-2 control-label">Mobile
							No. <sup>*</sup>
						</td>
						<td class="col-sm-3">

							<form:input path="promoterDetailsModel.mobileNo" disabled="true"
								cssClass="form-control input-sm" />


						</td>

					</tr>


					<tr class="form-group">

						<td for="inputEmail3" class="col-sm-3 control-label">Address
							Line 1<sup>*</sup>
						</td>
						<td class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine1" disabled="true"
								cssClass="form-control input-sm" />
						</td>

						<td for="inputEmail3" class="col-sm-2 control-label">Address
							Line 2 <sup>*</sup>
						</td>
						<td class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine2" disabled="true"
								cssClass="form-control input-sm" />
						</td>




					</tr>



					<tr class="form-group">

						<td for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup>
						</td>
						<td class="col-sm-3">

							<select name="stateUtId" id="invSate" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						         </c:choose>
						           </c:forEach>
						
						        
						        
						        
						        
						       </select>
						


						</td>

						<td for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup>
						</td>
						<td class="col-sm-3">

							<select class="form-control" name="permDistrictId" disabled="disabled"  id="District-invSate" >
									<option value="0"> --Select-- </option>
							
								<c:forEach  items="${projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.promoterDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
																		
							</select>
                            

						</td>




					</tr>

					<tr class="form-group">


						<td for="inputEmail3" class="col-sm-3 control-label">Company
							Registration Number<sup>*</sup>
						</td>
						<td class="col-sm-3">
							<form:input  cssClass="form-control input-sm" disabled="true" path="promoterDetailsModel.comRegistrationNo"
								id="inputEmail3" placeholder="" />
						</td>


						<td for="inputEmail3" class="col-sm-2 control-label">PIN
							Code<sup>*</sup>
						</td>
						<td class="col-sm-3">
							<form:input  cssClass="form-control input-sm" disabled="true" maxlength="6" path="promoterDetailsModel.pinCode"
								id="inputEmail3" placeholder="" />
						</td>
					</tr>







					<tr class="form-group">
						<td for="inputEmail3" class="col-sm-3 control-label">Registration
							Certificate<sup>*</sup>
						</td>
						<td class="col-sm-3">
							<input type="file" id="regCertificateFile" name="regCertificateFile" disabled="disabled"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.document.fileName}</a>
							
						</td>

					</tr>

</table>
</div>
					<br>




					<div class="inner_wrapper">

<table  width="900px">

						<h1>
							Project Chairman <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<tr class="form-group">
						
							<td for="inputEmail3" class="col-sm-3 control-label">Chairman
								Name <sup>*</sup>
							</td>
							<td class="col-sm-3">
								  <form:input path="promoterDetailsModel.projectChairmanModel.chairmanName" disabled="true" cssClass="form-control input-sm"/>
					
								
							</td>

							<td for="inputEmail3" class="col-sm-2 control-label">
								Mobile No <sup>*</sup>
							</td>
							<td class="col-sm-3">
								
								<form:input path="promoterDetailsModel.projectChairmanModel.mobileNo" disabled="true" cssClass="form-control input-sm"/>
					
									
							</td>




						</tr>


						<tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">Email
								Address<sup>*</sup>
							</td>
							<td class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.emailId" disabled="true" cssClass="form-control input-sm"/>
					
							</td>


							<td for="inputEmail3" class="col-sm-2 control-label">Address Line1<sup>*</sup>
							</td>
							<td class="col-sm-3">
								
							<form:input path="promoterDetailsModel.projectChairmanModel.addressLine1" disabled="true" cssClass="form-control input-sm"/>
					
							</td>



						</tr>


	<tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">Address Line2<sup>*</sup>
							</td>
							<td class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.addressLine2" disabled="true" cssClass="form-control input-sm"/>
					
							</td>


							<td for="inputEmail3" class="col-sm-2 control-label">State<sup>*</sup>
							</td>
							<td class="col-sm-3">
							<select name="chStateUtId" id="chState"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						         </c:choose>
						           </c:forEach>
						
						        
						        
						        
						        
						       </select>
						
							</td>



						</tr>
						
						
						
							<tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup>
							</td>
							<td class="col-sm-3">
<select class="form-control" name="chairManDistrictId"  id="District-chState"  disabled="disabled">
									<option value="0"> --Select-- </option>
							
								<c:forEach  items="${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
																		
							</select>
							
					
							</td>


					

							<td for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></td>
							<td class="col-sm-3 ">
								<input type="file" id="chairManPhoto" name="chairManPhoto" disabled="disabled"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.fileName}</a>
							 
							</td>
                             


						</tr>



</table>
					</div>


					<div class="inner_wrapper">

<table  width="900px">
						<h1>
							Project Member <span>Details</span>
						</h1>
						
						
                       <% int yy=0; %>
						<c:forEach items="${projectMemberSet}" var="obj">
						<%if(yy>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="member-dls-dv" class="addmoredv">
							<%}
						yy++;%>
							<div class="drop_shadow">
								
						</div>
					
						

						
						
							<tr class="form-group">
								<td for="inputEmail3" class="col-sm-3 control-label">Member
									Name<sup>*</sup>
								</td>
								<td class="col-sm-3 ">
									<input class="form-control input-sm" name="memberName" disabled="disabled" value="${obj.memberName}"/>
									<input type="hidden" name="prjMemberChId" value="${obj.prjMemberChId}"/>
					
								</td>

								<td for="inputEmail3" class="col-sm-2 control-label" >
									Member Type<sup>*</sup>
								</td>
								<td class="col-sm-3">
									
									
									<select class="form-control" name="memberType" disabled="disabled">
									<option value="0"> --Select-- </option>
									<c:choose>
									<c:when test="${obj.memberType=='Director' }">
									<option value="Director" selected="selected">Director</option>
									<option value="Board Member">Board Member</option>
									</c:when>
									<c:when test="${obj.memberType=='Board Member' }">
									<option value="Director" >Director</option>
									<option value="Board Member" selected="selected">Board Member</option>
									</c:when>
									<c:otherwise>
									<option value="Director" >Director</option>
									<option value="Board Member" >Board Member</option>
									</c:otherwise>
									</c:choose>
									</select>
									
									
								</td>
							</tr>



							<tr class="form-group">

								<td for="inputEmail3" class="col-sm-3 control-label">Mobile
									No<sup>*</sup>
								</td>
								<td class="col-sm-3 ">
									<input class="form-control input-sm" name="memberMobileNo" disabled="disabled" value="${obj.mobileNo}"/>
								</td>
								<td for="inputEmail3" class="col-sm-2 control-label">Email
									Address<sup>*</sup>
								</td>
								<td class="col-sm-3">
									<input class="form-control input-sm" name="memberEmailId" disabled="disabled" value="${obj.emailId}"/>
								</td>
							</tr>



                            <tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">Address Line1<sup>*</sup></td>
							<td class="col-sm-3 ">
								<input type="text" class="form-control input-sm"  name="memberAddressLine1" disabled="disabled" value="${obj.addressLine1}"/>
							</td>
							<td for="inputEmail3" class="col-sm-2 control-label">Address Line2<sup>*</sup></td>
							<td class="col-sm-3">
								<input type="text" name="memberAddressLine2" id="memberAddressLine2" disabled="disabled" value="${obj.addressLine2}"/>
							</td>
							
							</tr>
							
							
							     <tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></td>
							<td class="col-sm-3 ">
									<select name="chStateUtId" id="prMemberState<%=yy %>" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						          <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
							</td>
							<td for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></td>
							<td class="col-sm-3">
								
								    <select class="form-control dynaselectfld" name="memberDistrictId" disabled="disabled" id="District-prMemberState<%=yy %>" >
									<option value="0"> --Select-- </option>
										<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
						<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>											
								</select>
							</td>
							
							</tr>
							
							
							
							
							<tr class="form-group">

							<td for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></td>
							<td class="col-sm-3 ">
								<input type="text" class="form-control input-sm" maxlength="6"  name="memberPinCode" disabled="disabled" value="${obj.pinCode}"/>
							</td>
							<td for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></td>
							<td class="col-sm-3">
								<input type="file" name="memberPhotoFile" id="memberPhotoFile" disabled="disabled"/>
						       <a href="download?DOC_ID=${obj.momberPhotoDoc.documentId}"> ${obj.momberPhotoDoc.fileName}</a>
							 
							</td>
							
							</tr>
							
							
							
						</div>
						</DIV>
						</c:forEach>
						    <!-- add more -->
						    
						   
		</table>				
						</div>


		<div class="inner_wrapper">
					<table  width="900px"> 
						<h1>
							 RERA Registration Details with any <span>other State/UTs</span>
						</h1>
						
						
						<c:choose>
						<c:when test="${promoterBlackListSetFlag!='NO' }">
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


								<label for="inputEmail3" class="col-sm-3 control-label" >Have your said registration been revoked?</label>
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


								<label for="inputEmail3" class="col-sm-2 control-label" id='LblisBalckList' style='display:none;' id='LblisBalckList'>
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
						
						
						
						</c:when>
						
						</c:choose>
						</table>
					</div>
					<br>








				<div class="inner_wrapper">

						<h1>
							Previous Project <span>Details</span><span
								style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
								(Last 5 years only)</span>
						</h1>
                    <!-- loop -->
                    <% int xx=0; %>
						<c:forEach items="${projectRegistrationModel.previousProjectDetailsSet}" var="obj">
						
						
						<%if(xx>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="perv-dels-dv" class="addmoredv">
							<%}
						xx++;%>
							<div class="drop_shadow">
								
						</div>
							
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Project Name 
								
								
								</label>
								
							<div class="col-sm-3">
							<input type="hidden" name='pervProjectRegId' value="${obj.pervProjectRegId}"/>
								<input type="text" class="form-control input-sm" disabled="disabled"
									id="pervProjectName" name="pervProjectName" value="${obj.projectName}">
									
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 control-label">
								Project Description</label>
							<div class="col-sm-2">
								<textarea class="form-control input-sm" name="pervProjectDescription" disabled="disabled" id="pervProjectDescription" rows="3" >
							    <c:out value='${obj.projectDescription}'/>	
							    </textarea>
							</div>




						</div>


						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus<%=xx %>'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
									
								<div class="col-sm-3">
										<select class="form-control dynaselectfld" name="projectCurrentStatus" disabled="disabled"
										id='projectCurrentStatus<%=xx %>' onchange="ocCurrentStatus(this)" >
								
										<option value="1">Select </option>
									    
									    
									    <c:choose>
											<c:when test="${obj.projectCurrentStatus == 'Completed'}">
												 <option value="Completed" selected="selected">Completed </option>
												  <option value="Ongoing">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Ongoing'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing"  selected="selected">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Delay'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing">Ongoing</option>
									            <option value="Delay" selected="selected">Delay</option>
									            
											</c:when>
											
											
											
											
										</c:choose>
									 </select>
								</div>


							
						    <c:choose>
							<c:when test="${obj.projectCurrentStatus == 'Completed'}">
<fmt:formatDate var="fmtDate1" value="${obj.completionDate}" pattern="dd/MM/yyyy"/>
							<div class='completionDate' >
								<label for="inputEmail3" class="col-sm-2 control-label">
									Date of Completion </label>
								<div class="col-sm-2">
									
										<input type="text" name="completionDate" class="form-control input-sm augCalCssClass requiredValFld" value="${fmtDate1}"readonly="readonly">
										 <span class='requiredValFldMsg'> Please enter Date of Completion.</span>
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
							</div>							    
							     <div class='completionDocId'>
	                           		<label for="inputEmail3" class="col-sm-3 control-label">
									Project Completion Cretificate</label>
								   <div class="col-sm-3 ">
							        <input type="file" name="completionDocId" disabled="disabled"/>
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.completionDocId.documentId}'>${obj.completionDocId.fileName }</a>
	                              </div>
                                 </div>                            
							     <div class='occupancyDocId'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Occupancy Certificate</label>
								   <div class="col-sm-2 ">
							        <input type="file" name="completionDocId" class="form-control "/>
							        
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.occupancyDocId.documentId}'>${obj.occupancyDocId.fileName }</a>
	                              </div>
                                 </div>								
								<div class='noOfMonthDelayed'  style='display:none;'>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
									 No of Months Delayed  </label>
								<div class="col-sm-3">
									<input class="form-control" disabled="disabled" name="noOfMonthDelayed" />
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass">
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							  
							 
							 <c:when test="${obj.projectCurrentStatus == 'Delay'}">
							    <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file" name="completionDocId" disabled="disabled"/>
							      
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed' >
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-2">
									<input class="form-control"  name="noOfMonthDelayed" disabled="disabled" value="${obj.noOfMonthDelayed}"/>
								</div>
                              </div>
                              
                           
                              <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass" />
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							 
							 
							 
							 <c:otherwise>
					
                              <div class='completionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="completionDate" disabled="disabled" class="form-control input-sm augCalCssClass" />
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>	
								</div>						 
							     <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file"  name="completionDocId" disabled="disabled"/>
	                            </div>
                                   	</div>                            
							     <div class='occupancyDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project occupancy Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file"  name="occupancyDocId" disabled="disabled"/>
	                            </div>
                                   	</div>								
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control"  name="noOfMonthDelayed" disabled="disabled" />
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate' >

<fmt:formatDate var="fmtDate2" value="${obj.expectedCompletionDate}" pattern="dd/MM/yyyy"/>

								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-2">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass" value="${fmtDate2}">
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		
							
							   </c:otherwise>
							   </c:choose>

							


							</div>


							<div class="form-group">
							
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type
									of Occupancy </label>
								<div class="col-sm-3">
									<select class="form-control" name="typeOfLand" disabled="disabled">
										<option value="0">Select</option>
										
										  <c:choose>
											<c:when test="${obj.typeOfLand == 'Residential'}">
												<option value="Residential" selected="selected">Residential</option>
										        <option value="Commercial">Commercial</option>
										        <option value="Mixed Development">Mixed Development</option>
										<option value="Others">Others</option>
											</c:when>
											<c:when test="${obj.typeOfLand == 'Commercial'}">
											   <option value="Residential">Residential</option>
										       <option value="Commercial" selected="selected">Commercial</option>
										       <option value="Mixed Development">Mixed Development</option>
										<option value="Others">Others</option>
											</c:when>
											<c:when test="${obj.typeOfLand == 'Mixed Development'}">
											   <option value="Residential">Residential</option>
										       <option value="Commercial" >Commercial</option>
										       <option value="Mixed Development" selected="selected">Mixed Development</option>
												<option value="Others">Others</option>
											</c:when>	
											<c:when test="${obj.typeOfLand == 'Others'}">
											   <option value="Residential">Residential</option>
										       <option value="Commercial" >Commercial</option>
										       <option value="Mixed Development">Mixed Development</option>
												<option value="Others"  selected="selected">Others</option>
											</c:when>																						
											<c:otherwise>
											 <option value="Residential">Residential</option>
										       <option value="Commercial" >Commercial</option>
										       <option value="Mixed Development" selected="selected">Mixed Development</option>
												<option value="Others">Others</option>										       
											</c:otherwise>
										</c:choose>
										</select>
								</div>
							    <div class='othersOccupancy' >
							
								<label for="inputEmail3" class="col-sm-2 control-label">
									 If Others, Please Enter here  </label>
								<div class="col-sm-2">
									<input class="form-control requiredValFld" rel="txtTooltip"  data-toggle="tooltip" data-placement="bottom" name="othersOccupancy"  value="${obj.othersOccupancy}"/>

									<span class='requiredValFldMsg'> Please enter Others remark.</span>
								</div>
                              </div>								
								
							</div>
	                            
	                            
								
							



							<c:choose>
								<c:when test="${obj.isCasesPending=='YES' }">

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Is
									there any legal case pending</label>
								<div class="col-sm-3 ">
								
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='YES' class='dynaselectfld'>
									&nbsp&nbspYes&nbsp&nbsp
									<input type="radio"	name="isCasesPending<%=xx %>" disabled="disabled" id="isCasesPending<%=xx %>" value="YES" checked="checked" class='dynaselectfld' onclick='showrelatedfld(this)'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" name="isCasesPending<%=xx %>  "id="isCasesPending<%=xx %>"  value="NO"   onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<span class='requiredValFldMsg'> Please select Yes Or No.</span>
								</div>
								<div>
								<label id="LblisCasesPending<%=xx %>" for="inputEmail3" class="col-sm-2 control-label dynaselectfld requiredValFld" >
									 Case No</label>
									 	<div class="col-sm-2">
									<input type="text" value="${obj.caseNo}" disabled="disabled" id="FldisCasesPending<%=xx %>"  name="caseNo" class="form-control dynaselectfld" />
									
									</div>
								</div>
								</div>
								<div class="form-group">
									 <label id="Lbl1isCasesPending<%=xx %>" for="inputEmail3" class="col-sm-3 control-label dynaselectfld requiredValFld" >
									 Case Details (Type, Location, Authority etc.)</label>
									 <div class="col-sm-3">
									<input type="text" name="caseDetails" disabled="disabled" id="PdtisCasesPending<%=xx %>" value="${obj.caseDetails}">	
									</div>
									<label id="Lbl2isCasesPending<%=xx %>" for="inputEmail3" class="col-sm-2 control-label dynaselectfld requiredValFld" >
                                  	Case Status</label>
									<div class="col-sm-2">
									<input type="text" value="${obj.caseStatus}" disabled="disabled" id="RdlisCasesPending<%=xx %>"  name="caseStatus" class="form-control dynaselectfld" />
									</div>
								</div>
                                </c:when>
                                <c:otherwise>
                                <input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='NO' class='dynaselectfld'>
                                	&nbsp&nbspYes&nbsp&nbsp
									<input type="radio" d	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" onclick='showrelatedfld(this)' class='dynaselectfld'>
									
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" disabled="disabled" name="isCasesPending"id="isCasesPending<%=xx %>"  value="NO"   checked="checked"  onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" id="FldisCasesPending<%=xx %>" name="caseNo" class="form-control dynaselectfld" disabled="disabled" value="${obj.caseNo}" style='display:none;' />
									<input type="text" id="PdtisCasesPending" name="caseDetails" class="form-control input-sm " readonly="readonly" style='display:none;'>
									<input type="text" id="RdlisCasesPending<%=xx %>" name="caseStatus" class="form-control dynaselectfld" disabled="disabled" value="${obj.caseStatus}" style='display:none;' />
                                </c:otherwise>
                                   </c:choose>
                                   
                                   
								<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3">
									<div class="col-md-6 input-group">
									<c:choose>
									<c:when test="${obj.isPaymentPending=='YES' }">
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='YES' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio" disabled="disabled"	name="isPaymentPending<%=xx %>" checked="checked" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" disabled="disabled" id="isPaymentPending<%=xx %>"   name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" disabled="disabled" name="pendingAmount"  id="FldisPaymentPending<%=xx %>"  value="${obj.pendingAmount}"class="form-control dynaselectfld" />
										</c:when>	
										<c:otherwise>
										<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='NO' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio" disabled="disabled"	name="isPaymentPending<%=xx %>" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" disabled="disabled" id="isPaymentPending<%=xx %>"  checked="checked"  name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" disabled="disabled"  id="FldisPaymentPending<%=xx %>" style='display:none;' value="${obj.pendingAmount}"class="form-control dynaselectfld" />
		
										
										</c:otherwise>
											
										</c:choose>	
											
									</div>
								</div>


							</div>

							

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-3 ">
								<textarea class="form-control input-sm" name="projectAddress" disabled="disabled" id="" rows="3">${obj.projectAddress}</textarea>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-3">
							<select name="stateUtId" id="pervSate<%=xx %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						        
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
						        
						       </select>
				
							</div>
							
							
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District</label>
							<div class="col-sm-3 ">
                        		<select class="form-control dynaselectfld" name="pervProjDistrictId" disabled="disabled" id="District-pervSate<%=xx %>" >
									<option value="0"> --Select-- </option>
						<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
						<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
							
																		
								</select>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm" name="projectAddrPinCode" disabled="disabled" id="projectAddrPinCode" value="${obj.projectAddrPinCode}" maxlength="6"/>
							</div>
						</div>
						</div>
						 </c:forEach>
					</div>	
					









					
					
						
						  
					
					
		
				
				
				<!-- project Details -->




				
				
				
				
				
				
				
				
				
				
							<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">

<table  width="900px"> 

				<h1>
					Project <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



                    <!-- PROJECT DETAILS START -->


    <tr class="form-group">
    <td >	Project Name<sup>*</sup>						
</td>
    <td >  <input
							type="hidden" id="nextForm" name="nextForm" value="docUploadFrom" />


</td>
    <td >				
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Description<sup>*</sup></label>				
</td>
    <td>
    <form:textarea path="projectDetailsModel.projectDescription" disabled="true"
								row="3" id="currentProjectDesc" cssClass="form-control input-sm" />
</td>
    </tr>   
    
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Type<sup>*</sup></label>
						</td>
    <td >
    <form:select path="projectDetailsModel.projectType" disabled="true"
								class="form-control">
								<form:option value="Residential/Group Housing" label="Residential/Group Housing" />
								<form:option value="Commercial" label="Commercial" />
								<form:option value="Mixed Development" label="Mixed Development" />
								<form:option value="Plotted Development" label="Plotted Development" />

							</form:select>
        &nbsp;</td>
    <td >				
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Status<sup>*</sup></label>
						</td>
    <td>
    <form:select path="projectDetailsModel.projectStatus" disabled="true"
								class="form-control">
								<form:option value="0" label="Select" />
								<form:option value="Ongoing" label="Ongoing" />
								<form:option value="Complete" label="Complete" />

							</form:select>
        &nbsp;</td>
    </tr>       
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Start Date<sup>*</sup></label></td>
    <td >
    <form:input path="projectDetailsModel.startDate" readonly="true" disabled="true"
									cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass">
        &nbsp;</td>
    <td >				
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							End Date<sup>*</sup></label></td>
    <td>
    <form:input path="projectDetailsModel.completionDate" disabled="true"
									readonly="true" cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass">
        &nbsp;</td>
    </tr>       
    <tr class="form-group">
    <td >							

						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Area Of Land (Sq Mtr)<sup>*</sup></label>
						</td>
    <td >
    	<form:input path="projectDetailsModel.totalAreaOfLand" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    <td >				


						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Open Area (Sq Mtr)<sup>*</sup></label></td>
    <td>
    <form:input path="projectDetailsModel.totalOpenArea" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    </tr>       
    <tr class="form-group">
    <td >							


						<label for="inputEmail3" class="col-sm-2 control-label">Total
							Coverd Area (Sq Mtr)<sup>*</sup></label></td>
    <td >
    <form:input path="projectDetailsModel.totalCoverdArea" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    <td >				
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Address Line 1<sup>*</sup></label>
						</td>
    <td>
    <form:input path="projectDetailsModel.addressLine1" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    </tr>       
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Address Line 2<sup>*</sup></label>
						</td>
    <td >
    <form:input path="projectDetailsModel.addressLine2" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    <td >				
						<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup></label></td>
    <td>
							<select class="form-control" name='projectDistrictId' disabled="disabled" id="projectDist" onchange="reloadSubDistrict(this)">
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.districtModelSet}" var="dst">
						<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected" > ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						
						</select></td>
    </tr>      
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub District<sup>*</sup></label></td>
    <td >
							<select  name="subDistrictId" id="SubDistrict-projectDist"	class="form-control" disabled="disabled">
						
						<option value='0'> --Select-- </option>
						
						<c:forEach items="${projectRegistrationModel.projectDetailsModel.districtModel.subDistrictModelSet}" var="sub">
						<c:choose>
						<c:when test="${sub.subDistrictId==projectRegistrationModel.projectDetailsModel.subDistrictModel.subDistrictId}">
						<option value='${sub.subDistrictId }' selected="selected" > ${sub.subDistrictName } </option>
						</c:when>
						<c:otherwise>
						<option value='${sub.subDistrictId }'> ${sub.subDistrictName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>

							</select></td>
    <td >				
						<label for="inputEmail3" class="col-sm-3 control-label">Khesra No.<sup>*</sup></label></td>
    <td>
    <fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${projectRegistrationModel.projectDetailsModel.khesraNo}" />
							<form:input path="projectDetailsModel.khesraNo" disabled="true" cssClass="form-control input-sm" />
        &nbsp;</td>
    </tr> 
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">Latitude of End point of the plot<sup>*</sup></label>
						</td>
    <td >
    <fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${projectRegistrationModel.projectDetailsModel.latitudeEndPt}" />
							<form:input path="projectDetailsModel.latitudeEndPt" disabled="true" cssClass="form-control input-sm"/>
        &nbsp;</td>
    <td >				

						<label for="inputEmail3" class="col-sm-2 control-label">Longitude of End point of the plot(Sq Mtr)<sup>*</sup></label>
						</td>
    <td>
    <fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${projectRegistrationModel.projectDetailsModel.longitudeEndPt}" />
							<form:input path="projectDetailsModel.longitudeEndPt" disabled="true" cssClass="form-control input-sm"/>
        &nbsp;</td>
    </tr> 
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">No of Garage<sup>*</sup></label>
						</td>
    <td >
    <form:input path="projectDetailsModel.noOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    <td >				

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area of Garage (Sq Mtr)<sup>*</sup></label></td>
    <td>
    <form:input path="projectDetailsModel.areaOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    </tr> 
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">No of 
        Open Parking <sup>*</sup></label></td>
    <td >
        <form:input path="projectDetailsModel.noOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" /></td>
    <td >				

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Open Parking (Sq Mtr)<sup>*</sup></label></td>
    <td>
        <form:input path="projectDetailsModel.areaOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" /></td>
    </tr> 
    <tr class="form-group">
    <td >							
						<label for="inputEmail3" class="col-sm-3 control-label">No
							of Covered Parking  <sup>*</sup></label></td>
    <td >
    <form:input path="projectDetailsModel.noOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    <td >				

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Covered Parking (Sq Mtr)<sup>*</sup></label></td>
    <td>
    <form:input path="projectDetailsModel.areaOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
        &nbsp;</td>
    </tr>  
      
       
    
    </table></div>
										
					
		          <!-- PROJECT DETAILS END -->
		          					<br>

					<div class="inner_wrapper">

<table  width="900px"> 

						<h1>
							Development <span>Details</span>
						</h1>
						<% int dd=0;%>
						<c:forEach items="${developmentSet}" var="obj">
<% if(dd==0){%>
	<div id="dev_work-dv" class='addmoredv'>
	<%}else{ %>
	<div  class='addmoredv'>
	<%} dd++; %>
						<div class="drop_shadow">  </div>
						
						
    <tr class="form-group">
    <td >	
									<label for="inputEmail3" class="col-sm-3 control-label">Type
										of Inventory<sup>*</sup></label>
        </td>
    <td >  


											 <input type="text"
											name="typeOfInventory" class="form-control input-sm" disabled="disabled"
											id="typeOfInventory" value="${obj.typeOfInventory}" /></td>
<td >				

									<label for="inputEmail3" class="col-sm-2 control-label">No
										of Inventory<sup>*</sup></label></td>
    <td>
    
										<input type="text" name=noOfInventory disabled="disabled"
											class="form-control input-sm" id="noOfInventory"
											value="${obj.noOfInventory}" /></td>
    </tr>       
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Proposed FAR<sup>*</sup></label>
							</td>
    <td >  


								<input type="text" name="proposedFar" disabled="disabled" class="form-control input-sm" id="proposedFar" value="${obj.proposedFar}" /></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned FAR<sup>*</sup></label></td>
    <td>
    
								<input type="text" name="sanctionedFar" disabled="disabled" class="form-control input-sm" id="sanctionedFar" value="${obj.sanctionedFar}" /></td>
    </tr>   
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Proposed 
        No of Building(s) or Wing(s)<sup>*</sup></label></td>
    <td >  


								<input type="text" name="proposedBldgNo" disabled="disabled" class="form-control input-sm" id="proposedBldgNo" value="${obj.proposedBldgNo}" /></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned No of Building(s) or Wing(s)<sup>*</sup></label></td>
    <td>
    
								<input type="text" name="sanctionedBldgNo" disabled="disabled" class="form-control input-sm" id="sanctionedBldgNo" value="${obj.sanctionedBldgNo}" /></td>
    </tr>       
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Proposed No of Floors<sup>*</sup></label>
							</td>
    <td >  


								<input type="text" name="proposedFloors" disabled="disabled" class="form-control input-sm" id="proposedFloors" value="${obj.proposedFloors}" /></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Sanctioned No of Floors<sup>*</sup></label></td>
    <td>
    
								<input type="text" name="sanctionedFloors" disabled="disabled" class="form-control input-sm" id="sanctionedFloors" value="${obj.sanctionedFloors}" /></td>
    </tr>   
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Aggregate area of the recreational open space<sup>*</sup></label>
							</td>
    <td >  


								<input type="text" name="recreationalOpenSpace" disabled="disabled" class="form-control input-sm" id="recreationalOpenSpace" value="${obj.recreationalOpenSpace}" /></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Architecture/Design standards used<sup>*</sup></label></td>
    <td>
    
								<input type="text" name="archDesignStandard" disabled="disabled" class="form-control input-sm" id="archDesignStandard" value="${obj.archDesignStandard}" /></td>
    </tr>       
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Type of construction technology<sup>*</sup></label>
							</td>
    <td >  


								<input type="text" name="typeOfConstruction" disabled="disabled" class="form-control input-sm" id="typeOfConstruction" value="${obj.typeOfConstruction}" /></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Earthquake resistant measures adopted for building and common areas<sup>*</sup></label></td>
    <td>
    
								<input type="text" name="earthquakeResistant" disabled="disabled" class="form-control input-sm" id="earthquakeResistant" value="${obj.earthquakeResistant}" /></td>
    </tr>       
    <tr class="form-group">
    <td >	

									<label for="inputEmail3" class="col-sm-3 control-label">Carpet
										Area (Sq Mtr)<sup>*</sup></label></td>
    <td >  


										<input type="text" name=carpetArea disabled="disabled"
											class="form-control input-sm" id="carpetArea"
											value="${obj.carpetArea}" /></td>
<td >				


									<label for="inputEmail3" class="col-sm-2 control-label">Area
										of exclusive balcony/verandah (Sq Mtr)<sup>*</sup></label>
									</td>
    <td>
    

										<input type="text" name=areaOfExclusive disabled="disabled"
											class="form-control input-sm" id="areaOfExclusive"
											value="${obj.areaOfExclusive}" onclick="return areaOfExclusive_onclick()" /></td>
    </tr>       
    <tr class="form-group">
    <td >	
    
									<label for="inputEmail3" class="col-sm-3 control-label">Area
										of exclusive open terrace if any (Sq Mtr)</label></td>
    <td >  


										<input type="text" name=areaOfExclusiveOpenTerrace disabled="disabled"
											class="form-control input-sm" id="areaOfExclusiveOpenTerrace"
											value="${obj.areaOfExclusiveOpenTerrace}" /></td>
<td >&nbsp;				
    </td>
    <td>&nbsp;
    
									</td>
     
       
    
</tr>
   

						</c:forEach>

	
 </table>
</div>


						

					<div class="inner_wrapper">

<table  width="900px"> 
						<h1>
							External Development <span>Work</span>
						</h1>

						<div class="drop_shadow"></div>

						
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Road System<sup>*</sup></label>	
									</td>
    <td >  
    <form:select path="externalDevelopmentWorkModel.roadSysetmDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>

											</td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Water
								Supply<sup>*</sup></label>				

									</td>
    <td>
    <form:select path="externalDevelopmentWorkModel.waterSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
</td>
    </tr>       
     
         
       
    
    <tr class="form-group">
    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Sewege
								and Drainage System<sup>*</sup></label></td>
    <td >  


											<form:select
									path="externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">Electricity
								Supply Transfomer And Sub Station<sup>*</sup></label></td>
    <td>
    
       <form:select
									path="externalDevelopmentWorkModel.electricityAndTrasfomerSupply" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select></td>
    </tr>       
     
         
       
    
			    <tr class="form-group">
			    <td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Solid
								Waste Management And Disposal</label></td>
    			<td >  
    				<form:select
									path="externalDevelopmentWorkModel.solidWasteSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

							</form:select></td>
				</tr>				


					
							
						
					
                    <!-- loop -->
                    <%  int xp=0; %>
						<c:forEach items="${extOtherDevSet}" var="obj">
						<%if(xp>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="other_dev_work-dv" class="addmoredv">
							<%}
						   xp++;%>
							<div class="drop_shadow">
								
						   </div>
						
						
    					
							<tr class="form-group"><label for="inputEmail3" class="col-sm-3 control-label">
							Other External Development Works</label>
    						<td >	
    						<input type="hidden" name="extOtherDevId" value="${obj.extOtherDevId}"/>
								<label for="inputEmail3" class="col-sm-3 control-label">Work
									Description</label></td>
								<td class="col-sm-3">
									<input type="text" name="extDevWorkDesc" class="form-control" disabled="disabled" value="${obj.workDesc}"/>
	        
								</td>

								<td class="col-sm-3">
									<select name="developeBy" class="form-control">
										<option value="0">Select</option>
										<c:choose>
											<c:when test="${obj.developeBy == 'Local Authority'}">
												<option value="Local Authority" selected="selected">Local Authority</option>
												<option value="Self Development">Self Development</option>
											</c:when>
											<c:otherwise>
												<option value="Local Authority">Local Authority</option>
												<option value="Self Development" selected="selected">Self Development</option>

											</c:otherwise>
										</c:choose>

									</select></td>
									</tr>
                         </div>
</c:forEach>
	   			
		
							
		</table>	
		</DIV>
							

		


					<br>


					<div class="inner_wrapper">

<table width="900px">


						<h1>
							Project Bank <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

    <tr class="form-group">
							<td><label for="inputEmail3" class="col-sm-3 control-label">Bank
								Name<sup>*</sup></label></td>
							<td class="col-sm-3">
							
								<select  name="projectBankId" class="form-control" disabled="disabled">
								   
						         <option value='0'> --Select-- </option>
						          <c:forEach  items="${bankList}" var="b">
						              <c:choose>
						                <c:when test="${b.bankId==projectRegistrationModel.projectBankDetailsModel.bankModel.bankId}">
						                 <option value='${b.bankId }' selected="selected"> ${b.bankName} </option>
						                </c:when>
						                  <c:otherwise>
						                    <option value='${b.bankId}'> ${b.bankName } </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						         
						         
						       
								</select></td>	
							<td>
							<label for="inputEmail3" class="col-sm-2 control-label">Branch
								Name<sup>*</sup></label></td>
							<td class="col-sm-3">
								<form:input path="projectBankDetailsModel.bankBranch" disabled="true"
									cssClass="form-control input-sm" />
							</td>
						



						<tr class="form-group"><td >	
							<label for="inputEmail3" class="col-sm-3 control-label">Account
								No.<sup>*</sup></label></td>
    <td >     
        <form:input path="projectBankDetailsModel.accountNumber" disabled="true"
									cssClass="form-control input-sm" maxlength="17"/></td>
<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">IFSC
								Code<sup>*</sup></label></td>
    <td>
    
        <form:input path="projectBankDetailsModel.ifscCode" disabled="true"
									cssClass="form-control input-sm" /></td>
						</tr>


						<tr class="form-group">
						<td >	
							<label for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup></label>
							</td>
						    <td >     
						        <select
									name="bankStateUtId" disabled="disabled"
									class="form-control">
									

                                      <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
								</select></td>
<tr>
	<td >				

							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							</td>
    <td>
    
								<select
									name="bankDistrictId" disabled="disabled"
									class="form-control">
									<option value="0" > --Select-- </option>
									

                          <c:forEach  items="${projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectBankDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							


								</select></td>
								<td></td>
								<td></td>
    </tr>  

							</table>
					</div>



					<!-- Agent start -->

					<div class="inner_wrapper">
					<table  width="900px"> 
						<h1>
							Associated Vendor <span>Details</span>
						</h1>

						<div class="inner_wrapper">
					
							<h1>
								Project <span>Agent</span>
							</h1>

<c:choose>
<c:when test="{agentStatus!='NO'}">

                  <% int agnt=0; %>
                  <c:forEach items="${ agentSet}" var="agent">
                  <%if(agnt==0){ %>

							<div id='project-agent-dv' class='addmoredv'>
<%}else{ %>
<div class='addmoredv'>

<%} agnt++; %>

								<div class="drop_shadow">
									
								</div>

								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Registration No.</label></td>
									<td class="col-sm-3">
										
											<input type="text" id="" name="agentRegNo" disabled="disabled" class="form-control"	value="${agent.agent.agentRegistrationNo }"></td>
											<td> 
												<label class="input-group-addon btn"
												for="testdate" onclick="getAgentDetails();">
												 <span	class="glyphicon glyphicon-search dynaselectfld" id='getagent<%=agnt %>'  onclick="getAgentDetails(this)"></span>
											</label></td>
										
									<td>
									<label for="inputEmail3" id='resultgetagent<%=agnt %>' class="col-sm-2 control-label dynaselectfld"> </label></td>


								</tr>



								
								<tr class="form-group">

								<td>
									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm dynaselectfld"  id='fldnamenogetagent<%=agnt %>' disabled name="agentName" />
									</td>
									<td>
									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent<%=agnt %>' disabled name="agentAddress" />
									</td>


								</tr>


							</div>
</c:forEach>
</c:when>


</c:choose>
				
						</div>
						
						</table>
						</div>
						<!-- agent end -->

						<br>




						<!--Project  Architects start-->

						<div class="inner_wrapper">
						<table  width="900px"> 
							<h1>
								Project <span>Architects${arcSet}</span>
							</h1>


							 <% int xx10=0; %>
						         <c:forEach items="${architectSet}" var="obj">
						       
							
						        <%if(xx10>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectArc-dv" class="addmoredv">
							      <%}
						           xx10++;%>
						           
							    <div class="drop_shadow">
								   
						       </div>

    <tr class="form-group">
    <td >	
									<label for="inputEmail3" class="col-sm-3 control-label">
										Architect Name<sup>*</sup></label>	
									</td>
    <td >     
										<input class="form-control input-sm" type="text" disabled="disabled"
											name="architectName"  value="${obj.architectName}"/></td>
			<td>				
			<label for="inputEmail3" class="col-sm-2 control-label">
										 Email ID<sup>*</sup></label>
										 </td>		
    <td>       
										<input class="form-control input-sm" name="arctEmailId" disabled="disabled"
											 value='${obj.emailId}' /></td>
    </tr >
    
    
    
    
    
    <tr class="form-group">
    <td >	

    
	
									
    
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>

    
	
									
    
									</td>
    <td >     
										<input class="form-control input-sm" name="arctAddressLine1" disabled="disabled"
											id="arctAddressLine1" value="${obj.addressLine1}" /></td>
<td >				


									
									

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label></td>
    <td>       
										<input class="form-control input-sm" name="arctAddressLine2" disabled="disabled"
											id="arctAddressLine2" value="${obj.addressLine2}"/></td>
    </tr>
    
    
    
    
    
    <tr class="form-group">
    <td >	
    
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
    
									</td>
    <td>     
										
					          <select name="arctStateUtId" id="arctSate<%=xx10 %>" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld" onclick="return arctSate<%=xx10 %>_onclick()">
						      <option value='0'> --Select-- </option>
						         <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						                  </c:choose>
						           </c:forEach>
						       </select></td>
<td >				
									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									</td>
    <td>       
								
								  <select class="form-control dynaselectfld" name="arctProjDistrictId" disabled="disabled"  id="District-arctSate<%=xx10 %>" >
										<option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
									
																		
								</select></td>
    </tr>
    
    <tr class="form-group">
    <td >	
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									</td>
    <td >     
										<input class="form-control input-sm" name="arctPineCode" disabled="disabled"
											id="arctPineCode" value='${obj.pinCode}'/></td>
<td >				
									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label></td>
    <td>       
										<input class="form-control input-sm" name="arctYearOfEst" disabled="disabled"
											id="arctYearOfEst" value='${obj.yearOfEstablishment}'/></td>
    </tr>
    
    
    
    
    
    <tr class="form-group">
    <td >	

    
	
									
    
									<label for="inputEmail3" class="col-sm-3 control-label">Key Projects completed<sup>*</sup></label>
									</td>
    <td >     
										<input class="form-control input-sm"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" disabled="disabled" value='${obj.keyProject}' /></td>

    </tr>
    
    
    
    
    
    						
								</div>

                              </DIV>

						    
							  </c:forEach>
						
						</table>
	  				                    
					</div>
						

						<!--Project  Architects end-->

						<br>



						<!--Structural Engineers start -->

						<div class="inner_wrapper">
						<table width="900px">
							<h1>
								Structural <span>Engineers</span>
							</h1>
							 
							<% int xx2=0; %>
						         <c:forEach items="${stcEngSet}" var="obj">
							
						        <%if(xx2>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="structuralEng-dv" class="addmoredv">
							      <%}
						           xx2++;%>
							
								<div class="drop_shadow">
									
								</div>

								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">
										Engineer Name<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="engineerName" disabled="disabled"  value="${obj.engineerName}"
											id="engineerName" />
											<input type="hidden" name="strcStcEngId" disabled="disabled" value="${obj.projStcEngId}"/>
									</td>
<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label></td>
								<td class="col-sm-3">
									<input class="form-control input-sm" id="strcEmailId" disabled="disabled" name="strcEmailId"
										value='${obj.emailId}' />
								</td>



							</tr>

                             <tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="strcAddressLine1" disabled="disabled"
											id="strcAddressLine1" value='${obj.addressLine1}'/>
									</td>
									<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="strcAddressLine2" disabled="disabled"
											id="strcAddressLine2" value='${obj.addressLine2}' />
									</td>

								</tr>
								
								
								
								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										
					          <select name="strcStateUtId" id="strcSate<%=xx2 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						          <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select></td>
											
									<td>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label></td>
									<td class="col-sm-3">
								
								  <select class="form-control dynaselectfld" name="strcProjDistrictId" disabled="disabled" id="District-strcSate<%=xx2 %>" >
										<option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select></td>
											
									</tr>

								
								
								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="strcPineCode" disabled="disabled"
										
											id="strcPineCode" value="${obj.pinCode}" />
									</td>
									<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="strcYearOfEst" disabled="disabled"
											id="strcYearOfEst" value="${obj.yearOfEstablishment}" />
									</td>

								</tr>
								


								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" disabled="disabled" value="${obj.keyProject}" />
									</td>
<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
										</label></td>
									<td class="col-sm-3">
										
									</td>

								</tr>
								

								
</DIV>
							</DIV>
							</c:forEach>
						</table>	
							
					  </div>
                        
						

                       
						<!--Structural Engineers end -->
						<br>


						<!--Project  Contractors -->

						<div class="inner_wrapper">
						<table  width="900px"> 
							<h1>
								Project <span>Contractors</span>
							</h1>

                              <% int xx3=0; %>
						         <c:forEach items="${projContratorSet}" var="obj">
							     
											
						        <%if(xx3>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectContractors-dv" class="addmoredv">
							      <%}
						           xx3++;%>


						
                                 <div class="drop_shadow">
 									
								</div>



							

								<tr class="form-group">
								<td>
									<label for="inputEmail3" class="col-sm-3 control-label">Contractor Name<sup>*</sup></label>
									<td class="col-sm-3">
									   <input type="hidden" name="projectCntrId" value="${obj.projectCntrId}"/> 
										<input class="form-control input-sm" name="contractorName" disabled="disabled"
											 value="${obj.contractorName}" />
											 
									</td>
								<td>
	                            <label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label></td>
								<td class="col-sm-3">
									<input class="form-control input-sm"  id="cntrEmailId" name="cntrEmailId" disabled="disabled" value="${obj.emailId}" />
								</td>
							</tr>

                             <tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="cntrAddressLine1" disabled="disabled"
											id="cntrAddressLine1" value="${obj.addressLine1}"/>
									</td>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="cntrAddressLine2" disabled="disabled"
											id="cntrAddressLine2" value="${obj.addressLine2}"/>
									</td>

								</tr>
								
								
								
								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										
					          <select name="cntrStateUtId" id="cntrSate<%=xx3 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select></td>
											
									

									<td for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></td>
									<td class="col-sm-3">
								
								  <select class="form-control dynaselectfld" name="cntrProjDistrictId" disabled="disabled" id="District-cntrSate<%=xx3 %>" >
								  <option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											
									</td>

								
								
								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="cntrPineCode" disabled="disabled"
											id="cntrPineCode" value="${obj.pinCode}"/>
									</td>
									<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="cntrYearOfEst" disabled="disabled"
											id="cntrYearOfEst" value="${obj.yearOfEstablishment}"/>
									</td>

								</tr>
								


								<tr class="form-group"><td>
									<label for="inputEmail3" class="col-sm-3 control-label">Key Projects completed<sup>*</sup></label></td>
									<td class="col-sm-3">
										<input class="form-control input-sm" name="cntrKeyProjectCompleted" disabled="disabled" id="cntrKeyProjectCompleted"  value="${obj.keyProject}" />
									</td>
<td>
									<label for="inputEmail3" class="col-sm-2 control-label">
										</label></td>
									<td class="col-sm-3">
										
									</td>

								</tr>
</DIV>

							  </DIV>
							 </c:forEach>
						
					</table>
						</div>
						
						<!--Project  Contractors end-->


					
                 			





		<!-- PROJECT DOCUMENT DETAILS START  -->
		
		
		
		
		
		
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
					  
					     <td>Balance Sheet</td>
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled" />
					     
					     <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.documentId}">${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
					         <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.fileName}
							</a>
					
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited ProfitLoss Statement</td>
					      
					     <td>
					     <input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report</td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement </td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					</table>
					
					<br/><br/><br/>
					<div class="drop_shadow">
						
						</div>
					 <table class="table table-responsive table-bordered">
					   
					<tr>
					
						<td>PAN Card<sup>*</sup></td>
						<td>
							<input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
							</td>
			
						
						
						<td>Encumbrance Certificate
							</td>
						<td>
						<input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
						</td>
					    


					</tr>
					
					
					

					<tr><td>
						Commencement
							Certificate<sup>*</sup></td>
						<td>
							<input type="file"   id="commencementCertFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
						</td>
						<td>Approved
							Sanctioned Plan<sup>*</sup></td>
						<td>
							<input type="file"   id="approvedSanctionPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
						</td>


					</tr>


					<tr><td>Approved Layout Plan<sup>*</sup></td>
						<td>
							<input type="file"   id="approvedLayoutPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
							
						</td>
						<td>Proforma for Sale of Agreement <sup>*</sup></td>
						<td>
							<input type="file"   id="performaForSaleOfAgreement" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
						</td>


					</tr>



					<tr>
						<td>Land documents &
							Location<sup>*</sup></td>
						<td>
							<input type="file"   id="landDocumentsFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
						</td>
						<td>Sanctioned
							Layout Plan<sup>*</sup></td>
						<td>
							<input type="file"   id="sanctionedLayoutPlan" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
							</td>
						</tr>

					
					<tr>
						<td>Area Development
							Plan<sup>*</sup></td>
						<td>
							<input type="file"  id="areaDevelopmentPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
						</td>
						<td>Proforma
							of Allotment Letter<sup>*</sup></td>
						<td>
							<input type="file"   id="performaOfAllotmentLetterFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
							</td>
						</tr>

					<tr>
						<td>Brochure of Current
							Project<sup>*</sup></td>
						<td>
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
						</td>
						<td>
						Project
							Related Documents<sup>*</sup></td>
						<td>
							<input type="file"   id="projectRelatedDocumentsFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectRelatedDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectRelatedDoc.fileName}
							</a>
						</td>


					</tr>



					
					<tr>
						<td>Land Deed Agreement<sup>*</sup></td>
						<td>
							<input type="file"  id="declarationFormb" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>
						</td>
					
						<td>Declaration (Form B)<sup>*</sup></td>
						<td>
							<input type="file"   id="declarationFormb" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</td>


                      
					</tr>
					
					</table>


</div>

				<div class="inner_wrapper">
					<table  width="900px">
					<% int pp=0; %>
					<c:forEach items="${projectRegistrationModel.projectPhotoDetailSet }" var="photo">
					<input type="hidden" name="photoId" value="${photo.documentId}" />
					<%if(pp==0){ %>
                         <div id='pre_project-dv' class='addmoredv'>
                         <%}else{ %>
                           <div  class='addmoredv'>
                         <%} pp++; %>
						<div class="drop_shadow">
						
						</div>

						<tr class="form-group">
							<td class="col-sm-3 control-label">Project Photo</td>
							<td class="col-sm-3">
								<input type="file"   id="projectPhotoFile" name="projectPhotoFile" disabled="disabled"/>
							</td><td>
							<a href="download?DOC_ID=${photo.documentId}">
					         ${photo.fileName}
							</a></td>
							
						</tr>


</c:forEach>
</table>
</div>

<table width="900px">
<tr class="form-group">
    <td><b>I hereby declare that all the above mentioned information is correct to the best of my knowledge. If any information is found incorrect, RERA Authority will take punitive action as per RERA Act and Bihar RERA Rules.</b></font></td>
    <td ></td>  
</tr>

<br/>
<br/>
<br/>
<p></p>
<tr></tr>
</table>
<tr></tr>
<table width="900px">
<tr class="form-group" height="20">
<td> Date................... </td>
<td align="right">
</td></tr>
<br/>
<br/>
<tr class="form-group">

<td align="Left"> Place...................
</td>
<td align="right">Signature</td>
</tr>
</table>

</div>
<!-- PROJECT DOCUMENT DETAILS END -->

	</form:form>
		<div class="button-wrapper">
			<input name="btn1" class="btn-style" value="Print" onclick="PrintMe('div1')" type="button">
		</div>

		<br>	
