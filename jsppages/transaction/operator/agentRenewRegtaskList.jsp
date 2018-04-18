<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Agent Renewal Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1> Agent Renewal <span>Task List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Pending Requests : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>Registration No.</th>
                <th>Agent Name</th>
                 <th>Registration Validity</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${agentRenwalList}" var="obj">
            <tr>
               <td><a href="agentRenewalDetails?AGENTREQ_ID=${obj.agentRegLogId}"> ${obj.agentRegistration.agentRegistrationNo}</a></td>
                  
                  <c:choose>
                  <c:when test="${obj.agentRegistration.registrationType=='INDVISUAL_REG' }">
                  <td>${obj.agentRegistration.agentDetailsModel.agentName } </td>
              
                  </c:when>
                  <c:otherwise>
                  <td>${obj.agentRegistration.agentDetailsModel.firmName } </td>
               
                  </c:otherwise>
                  </c:choose>
                    <td>${obj.agentRegistration.approvedOn.time } To ${obj.agentRegistration.expireDate.time } </td>
               
                <td>${obj.regPaymentDetailsModel.amount }</td>
                <td>${obj.regPaymentDetailsModel.paymentMode}
              
               </td>
                 <td>${obj.createdOn.time }</td>
            </tr>
           </c:forEach>
        </tbody>
    </table>
			</div>

	

<!--search list main end here-->	
</div>

    


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>
