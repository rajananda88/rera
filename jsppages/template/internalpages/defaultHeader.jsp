
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">
	<!--Top Bar-->
	<div class="row">
		<div class="col-md-12 colsm-12 col-xs-12">
			 <div class="top-s pull-right">
         
         <ul class="social_icon">
			    <li ><a href="#"><img src="<%=request.getContextPath() %>/resources/images/call-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/head-phone-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/face-book.jpg" width="22" height="22" alt="facebook" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/linkedin.jpg" width="23" height="22" alt="Linkedin" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/twitter-icon.jpg" alt="twitter" width="22" height="22" /></a></li> 
          </ul>
        
			<ul class="lang">
				<li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/hindi-icon.jpg" width="22" height="22" /></a></li> 
        	</ul>
        
        <ul class="font-zoom">
				<li class="suare-icons a-plus icon-plus clsButton " id="btnFontIncrease"><a href="#"><span class="accebilility_icon">A+</span> </a></li> 
				<li class="round-icons a-normal icon-normal clsButton " id="bntFontNormal"><a href="#"><span class="accebilility_icon">A&nbsp;</span> </a></li> 
				<li  class="round-icons a-minus icon-minus clsButton " id="bntFontDecrease"><a href="#"><span class="accebilility_icon">A- </span> </a></li> 
				<li  class="acceblity"><a href="#"><span class="accebilility_icon disabbil">A </span> </a></li> 
        </ul>
        
        
        </div>
		</div>
	</div>
	<!--Logo Header-->
	<div class="row">
		<div class="top-logo">
			<a href='<%=request.getContextPath() %>/home'>		
				<div class="col-md-6 col-sm-6 col-xs-6 ">
			<div class="logo-sec">&nbsp;</div>
				
					</div>
					</a>
			<div class="col-md-6 col-sm-6 col-xs-6 ut_name">
		
		
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--Nav-->
	<div class="row">
		<nav class="navbar navbar-default navbar-static-top">
			<div class=" container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
								
								<li><a href="<%=request.getContextPath() %>/home" >Home</a></li>								
								

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">About Us <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath() %>/aboutUs">What is RERA? </a></li>
								<li><a href="#">Organizational Structure </a></li>
									<li><a href="<%=request.getContextPath()%>/functionsAndServicesPage">Functions And Services </a></li>
											<li><a href="<%=request.getContextPath() %>/contactUsPage">Contact Us </a></li>
				
							</ul></li>




						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Acts & Rules <span class="caret"></span></a>
								<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/Bihar_RERA_Rules_2017" target="_blank">Real Estate Act, 2016 </a></li>
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/Real_Estate_Act.pdf.pdf" target="_blank">Bihar RERA Rules, 2017</a></li>
										
									

									</ul>
									</li>


                        <li><a href="<%=request.getContextPath() %>/resources/staticpage/FAQ.pdf" target="_blank" >FAQ</a></li>
						<li><a href="#contact" >Order/Notice</a></li>
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"> Defaulters <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/viewDefaulterAgents">List Of Agents </a></li>
										<li><a href="<%=request.getContextPath() %>/viewDefaulterProjects">List Of Projects </a></li>
												
																	

									</ul></li>
                             


								<%
								String role=(String)session.getAttribute(ReraConstants.SES_USER_ROLE);
								if(role!=null){
									if(role.equals(ReraConstants.AGENT_USER)){
										%>
										
                     <li  class="dropdown"> <a href="#"  style="border-right: 0px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Profile  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="<%=request.getContextPath() %>/agent/dashboard">Basic Detail </a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/agentDocumentPage">Uploaded Documents</a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/paymentDetailsPage">Payment Details</a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/projectListPage">Project List</a></li>
                   <li><a href="<%=request.getContextPath() %>/agent/openRenewalForm">Registration Renewal </a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/changePasswordForm">Change Password</a></li>
                  
               
                </ul>
              </li>
										
										<li><a href="<%=request.getContextPath() %>/logout" >Logout</a></li>
										
										<%
																
									}else if(role.equals(ReraConstants.PROJECT_USER)){
										%>
										
										
                     <li  class="dropdown"> <a href="#"  style="border-right: 0px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Profile  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                   <li><a href="<%=request.getContextPath() %>/project/dashboard">Promoter Details </a></li>
                  <li><a href="<%=request.getContextPath() %>/project/projectDocumentsPage">Project Documents</a></li>
                    <li><a href="<%=request.getContextPath() %>/project/projectPhotosPage">Project Photos</a></li>
                  
                  <li><a href="<%=request.getContextPath() %>/project/projectDetailsPage">Project Details </a></li>
                     <li><a href="<%=request.getContextPath() %>/project/paymentDetailsPage">Payment Details </a></li>
                  
                  <li><a href="<%=request.getContextPath() %>/project/developmentDetailsPage">Development Details</a></li>
                   <li><a href="<%=request.getContextPath() %>/project/projectVendors">Associated Vendors Details</a></li>
                  <li><a href="<%=request.getContextPath() %>/project/openRegistrationExtForm">Extend Project Registration</a></li>
                  <li><a href="<%=request.getContextPath() %>/project/changePasswordForm">Change Password</a></li>
                
                  
               
                </ul>
              </li>
										<li><a href="<%=request.getContextPath() %>/logout" >Logout</a></li>
										
										<%
																
									}else{
										%>
										
										
									<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Login <span class="caret"></span></a>
									<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/authorityLoginPage">Login as Authority</a></li>
						     		<li><a href="<%=request.getContextPath() %>/loginPage">Login as Agent/Promoter</a></li>
							
									</ul>
									
									
									
									</li>
										
										
										
										<% 
										
									}
								%>
								
								<%}else{ %>
								
						
									<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Login <span class="caret"></span></a>
									<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/authorityLoginPage">Login as Authority</a></li>
						     		<li><a href="<%=request.getContextPath() %>/loginPage">Login as Agent/Promoter</a></li>
							
									</ul>
									
									
									
									</li>
									<%} %>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>
</div>