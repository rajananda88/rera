<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Task List</div>


<!--News Ticker-->
<div class="container">

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
                <th>PROJECT</th>
                <th>PROMOTER</th>
                <th>PROMOTTER TYPE</th>
                 <th>PROPERTY TYPE</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectList}" var="obj">
            <tr>
                  <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName } </a></td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>
                ${obj.paymentDetailsModel.paymentMode}
               
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
	</div>
