<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE tiles-definitions PUBLIC "-//Apache Software Foundation//DTD Tiles Configuration 2.1//EN" "http://tiles.apache.org/dtds/tiles-config_2_1.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><tiles:getAsString name="title" /></title>
	
<!-- Bootstrap -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.ticker.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/site.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script> 
<script src="<%=request.getContextPath() %>/resources/js/commdropdown.js"></script> 

       <script src="<%=request.getContextPath() %>/resources/js/validation.js"></script>  
      <script src="<%=request.getContextPath() %>/resources/js/raphael-min.js"></script> 
     <script src="<%=request.getContextPath() %>/resources/js/morris.min.js"></script>  
	
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
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
	
		<section id="sidemenu">
			<tiles:insertAttribute name="menu" />
		</section>
			
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>

		
		
			<footer id="bfooter">
			<tiles:insertAttribute name="bfooter" />
		</footer>
</body>
</html>