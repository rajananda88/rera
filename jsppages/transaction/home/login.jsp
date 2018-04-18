<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!--News Ticker-->
<div class="container mar_top_20">




	
	
	
<div class="col-md-6 col-md-offset-3">	
	

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Agent/Promoter  <span>Login</span></h1>
<div class="drop_shadow"></div>

${ERROR_MSG}

<form:form class="form-horizontal login" method="post" action="userLogin" name="loginForm">
  <div class="form-group  has-feedback ">
    <label for="inputEmail3" class="col-sm-3 control-label">Registration No.</label>
  <div class="col-sm-9">
      <span class="glyphicon glyphicon-user form-control-feedback"></span>
      <input type="text" class="form-control" name="loginId" id="loginId" placeholder="Please Enter Your Registration No">
     
    </div>
  </div>
  <div class="form-group has-feedback">
    <label for="inputPassword3" class="col-sm-3 control-label">Password </label>
    <div class="col-sm-9">
     <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      <input type="password" class="form-control" name="password" id="password" placeholder="Please Enter Your Password">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <input name="btn1" class="btn-style" value="Login" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;    <a href="forgetPasswordBForm">Forgot your password?</a>
    </div>
  </div>
</form:form>
<br>
<br>



	<div class="clearfix"></div>
<!--search list main end here-->	
</div>

</div>


<!--inner container end here-->
	</div>


	</div>

<!-- container end here-->
