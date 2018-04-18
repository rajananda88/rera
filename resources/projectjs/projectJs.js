function changeLabelText(id, text, val) {
	$(id).text(text);
	$('#nextForm').val(val);

}

function moveSelectedTrends() {
	var trends = document.getElementById('trends'), trend, i;

	for (i = 0; i < trends.length; i++) {
		trend = trends[i];
		if (trend.selected) {
			alert(trend.value);
		}
	}
}


function validateDate(stDate, endDate, msg) {
	var dt = stDate.value;
	var dt2 = endDate.value;

	var splitDt = dt.split('/');
	var splitDt2 = dt2.split('/');
	var DtDate = parseInt(splitDt[0]);
	var DtMo = parseInt(splitDt[1]);
	var DtYr = parseInt(splitDt[2]);
	var Dt2Date = parseInt(splitDt2[0]);
	var Dt2Mo = parseInt(splitDt2[1]);
	var Dt2Yr = parseInt(splitDt2[2]);
	if (DtYr < Dt2Yr) {
		return true;
	}
	if (Dt2Yr == DtYr && DtMo < Dt2Mo) {
		return true;
	}
	if (Dt2Yr == DtYr && Dt2Mo == DtMo && DtDate < Dt2Date) {
		return true;
	}
	alert(msg);
	endDate.focus();
	return false;
}


function projectForm() {
	
	  var frm= $("#trxForm");
	 // alert(frm.size());
	  
	   if(validateForm(frm)){

		$(frm).submit();
	   }
	

	
}

function nextProjectDetailsForm() {

   var frm= $("#trxForm");
   if(validateForm(frm)){

	$(frm).submit();
   }

}

function saveOrUpdateCompanyPromoter() {

	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }

}

function editSaveOrUpdateCompanyPromoter() {
	
	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }
}


function nextProjectPaymentForm() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }
}

function saveOrUpdatePayment() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }}

function saveOrUpdateProjectDetailsForm() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }
}


function saveOrUpdateProjectDetailsForm() {

	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		$(frm).submit();
	   }
}


function getAgentDetails() {

	var agentRegNo = $('#agentRegNo').val();
	//alert(agentRegNo);
	if(agentRegNo.trim()==''){
		alert('Enter the agent registration');
		return false;
	}
	
	$.ajax({
		type : "GET",
		url : "getAgentDetailforProjectReg",
		data : "agentRegNo=" + agentRegNo,
		success : function(response) {
			alert('call---'+response+"ID--"+Obj.name);
			
		},

		error : function(e) {
        
		}

	});

}

function pervForm(url) {

	$(document).on("click", function(e) {
		// e.preventDefault();
		$('#trxForm').attr('action', url).submit();
	});

}




function checkOldPassword(){
	var currentPass=  $('#password').val();
	var oldPassword=  $('#oldPassword').val();
	
	 
	
	var newpassword=$('#newpassword').val();
	var conFirmPassword=$('#conFirmPassword').val();
	
	if(oldPassword.trim()==''){
		alert("Please enter your oldPassword");
		$('#oldPassword').focus();
	    return false;
	}
 
	if(oldPassword.trim()!=currentPass){
		alert("Please enter your valid old Password");
		$('#oldPassword').focus();
		return false;
	}
 
	if(newpassword.trim()==''){
		alert("Please enter your new  Password");
		$('#newpassword').focus();
		return false;
	}
	
	if(conFirmPassword.trim()==''){
		alert("Please enter your new  confirm password");
		$('#conFirmPassword').focus();
		return false;
	}
	if(newpassword!=conFirmPassword){
		alert("Entered password does not match");
		return false;
		
	}
	$('#changePass').submit();
	
	
 
}
