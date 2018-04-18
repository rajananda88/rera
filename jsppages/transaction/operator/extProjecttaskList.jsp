<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Task List</div>



<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>Task <span>List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Pending Requests : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>REGISTRATION NO.</th>
                 <th>REGISTRATION VALIDITY</th>
                <th>EXTEND DATE</th>
                 <th>PROJECT</th>
                <th>PROMOTER</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectExtList}" var="obj">
            <tr>
                  <td> <a href="projectExtDetails?PROJECT_ID=${obj.projectExtId}"> ${obj.projectRegistration.projectRegistrationNo } </a></td>
             
                <td>${obj.projectRegistration.approvedOn.time } To ${obj.projectRegistration.expireDate.time }</td>
                <td>${obj.extendToDate.time }</td>
                  <td>${obj.projectRegistration.projectDetailsModel.projectName }</td>
                <td>${obj.projectRegistration.promoterDetailsModel.promoterName }</td>
                 <td>${obj.paymentDetailsModel.amount }</td>
                <td>${obj.paymentDetailsModel.paymentMode}</td>
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
	</div>
