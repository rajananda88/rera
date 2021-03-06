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

			<a href='<%=request.getContextPath()%>/home'>
			<div class="col-md-6 col-sm-6 col-xs-6">
			<div class="logo-sec">&nbsp;</div>
			

			</div></a>
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

						<li><a href="dashboard" style="border-right: 0px;">Dashboard
						</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Project Registration<span class="caret"></span></a>
							<ul class="dropdown-menu">
								
                                <li><a href="projectTasklist">Tasklist(New Project) </a></li>
								<li><a href="projectExtTasklist">Tasklist(Project Extension) </a></li>
								<li><a href="viewAllProjects">View All Projects </a></li>

							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Agent Registration<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="agentTasklist">Tasklist (New Registration) </a></li>
								<li><a href="agentRenewalTasklist">Tasklist (Registration Renewal)</a></li>
								<li><a href="viewAllAgents">View All Agents </a></li>

							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Complaint Registration<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="complaintTasklist">Tasklist </a></li>
								<li><a href="#">View All Complaints </a></li>


							</ul></li>


						<li><a href="#" style="border-right: 0px;">MIS Report</a></li>


						<li><a href="changePasswordForm" style="border-right: 0px;">Change
								Password </a></li>



						<li><a href="<%=request.getContextPath()%>/logout" style="border-right: 0px;">Logout</a></li>









					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>
</div>