<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>





<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><tiles:getAsString name="title" /></title>
	
<!-- Bootstrap -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>

<!--<link href="<%=request.getContextPath()%>/resources/js/DatePicker/jquery.datepick.css" rel="stylesheet"/> -->
<link href="<%=request.getContextPath()%>/resources/js/DatePicker/flora.datepick.css" rel="stylesheet"/>

<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/DatePicker/jquery.datepick.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/news-ticker.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>    
    <script src="<%=request.getContextPath() %>/resources/js/commdropdown.js"></script> 
      <script src="<%=request.getContextPath() %>/resources/js/morris.min.js"></script>  
       <script src="<%=request.getContextPath() %>/resources/js/raphael-min.js"></script> 
   
     <script src="<%=request.getContextPath() %>/resources/js/validation.js"></script> 
	
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
<%if(!request.getContextPath().equals("/")){%>
_ctxpath='<%=request.getContextPath()%>/';
<%}%>
</script>
</head>
<body>
<header>
<tiles:insertAttribute name="header" />
</header>

<!--Banner-->
<div class="container-fluid">
  <div class="row"><img src="<%=request.getContextPath() %>/resources/images/inner_banner.jpg" width="1366" height="153" class="img-responsive"  alt=""/> </div>
</div>





<!--News Ticker-->
<div class="container">


   
   
 
    
<div class="col-md-12 col-sm-12 ">
			

  <tiles:insertAttribute name="body" />


			
		</div>
	
	


<!-- container end here-->

</div>
	</div>

<footer>

  <tiles:insertAttribute name="bfooter" />



</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/news-ticker.js"></script>

 





</body>
</html>