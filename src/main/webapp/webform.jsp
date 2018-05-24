<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style >
.toggle {
  -webkit-appearance: none;
  appearance: none;
  width: 100px;
  height: 32px;
  display: inline-block;
  position: relative;
  border-radius: 50px;
  overflow: hidden;
  outline: none;
  border: none;
  cursor: pointer;
  background-color: #707070;
  transition: background-color ease 0.3s;
}

.toggle:before {
  content: "Espanol English";
  display: block;
  position: absolute;
  z-index: 2;
  width: 28px;
  height: 28px;
  background: #fff;
  left: 2px;
  top: 2px;
  border-radius: 50%;
  font: 10px/28px Helvetica;
  text-transform: uppercase;
  font-weight: bold;
  word-spacing: 37px;
  color: #fff;
  text-shadow: -1px -1px rgba(0,0,0,0.15);
  white-space: nowrap;
  box-shadow: 0 1px 2px rgba(0,0,0,0.2);
  transition: all cubic-bezier(0.3, 1.5, 0.7, 1) 0.3s;
}

.toggle:checked {
  background-color: #4CD964;
}

.toggle:checked:before {
  left: 70px;
}
#idiomToogle:before {
  content: "Espanol English";
  text-indent: -50px;
}
#currencyToogle:before {
  content: "USD COP";
  text-indent: -32px;
  }

</style>
</head>
<body>
<form id="processPayment" method="post" action="" style="max-width:50%; margin-top:50px; box-shadow: 0px 15px 55px 9px rgba(0,0,0,0.75);padding:15px;border-radius:20px;" class="container align-middle">
<table id="espanolForm"style="width:100%">
	<tr>
		<td style="float:left;" colspan="2">
			<ul style="padding-left:0px;">
				<li style="display:inline-block; font-size:2em;"><i class="fab fa-cc-amex"></i></li>
				<li style="display:inline-block; font-size:2em;"><i class="fab fa-cc-diners-club"></i></li>
				<li style="display:inline-block; font-size:2em;"><i class="fab fa-cc-discover"></i></li>
				<li style="display:inline-block; font-size:2em;"><i class="fab fa-cc-mastercard"></i></li>					
				<li style="display:inline-block; font-size:2em;"><i class="fab fa-cc-visa"></i></li>		
			</ul>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="amount" id="lblAmount">Numero de Orden a Pagar</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="form-control" type="text" id="paymentNumOrder" name="paymentNumOrder" onkeyup="checkDec(this);" value="<%=request.getParameter("paymentNumOrder")%>" readonly/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="amount" id="lblAmount">Total a pagar</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="form-control" type="text" id="totalAmount" name="totalAmount" onkeyup="checkDec(this);" value="<%=request.getParameter("totalAmount")%>" readonly/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="name" id="lblName">Nombre como aparece en la tarjeta</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="form-control" type="text" id="name" name="name" value="Cristian Ruiz Gonzalez"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="cardNumber" id="lblCardNumber">Numero de la tarjeta</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="form-control" type="number" id="number" name="number" value="4737029066712895"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="expiry" id="lblExpiry">Fecha de expiracion</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<select style="display:inline-block !important; width: 48% !important;" class="form-control" name='expireMMespanol' id='expireMMespanol'>
				<option value=''>Mes</option>
				<option value='01'>1 -Enero</option>
				<option value='02'>2 -Febrero</option>
				<option value='03'>3 -Marzo</option>
				<option value='04'>4 -Abril</option>
				<option value='05'>5 -Mayo</option>
				<option value='06'>6 -Junio</option>
				<option value='07'>7 -Julio</option>
				<option value='08'>8 -Agosto</option>
				<option value='09'>9 -Septiembre</option>
				<option value='10'>10-Octubre</option>
				<option value='11'>11-Noviembre</option>
				<option value='12'>12-Diciembre</option>
			</select>
			<select class="form-control" name='expireMMenglish' id='expireMMenglish' style="display:none; width: 48% !important;">
				<option value=''>Month</option>
				<option value='01'>1 -January</option>
				<option value='02'>2 -February</option>
				<option value='03'>3 -March</option>
				<option value='04'>4 -April</option>
				<option value='05'>5 -May</option>
				<option value='06'>6 -June</option>
				<option value='07'>7 -July</option>
				<option value='08'>8 -August</option>
				<option value='09'>9 -September</option>
				<option value='10'>10-October</option>
				<option value='11'>11-November</option>
				<option value='12'>12-December</option>
			</select>
			<select style="display:inline-block !important;width:50% !important" class="form-control" name='expireYY' id='expireYY'>
				<option value=''>Año</option>
			</select> 
			<input type="hidden" name="expiry" id="expiry" maxlength="4"/>
			<input type="hidden" name="idiom" id="idiom"/>
			<input type="hidden" name="currency" id="currency"/>
			<input type="hidden" name="expiryMonth" id="expiryMonth" maxlength="4"/>
			<input type="hidden" name="expiryYear" id="expiryYear" maxlength="4"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="cvv" id="lblCVV">Codigo de seguridad (CVV)</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="form-control" type="text" max="999" min="99" id="cvv" name="cvv"/>
		</td>
	</tr>
	<tr><td></td><td></td></tr>
	<tr>
		<td colspan="2" class="text-center">
			<button class="btn btn-lg btn-success" type="button"id="btnSend" onclick="getToken();">Enviar</button>
		</td>
	</tr>
</table>
</form>
<form id="checkout-form" action="processPayment" method="post">
 <input type="hidden" id="kushki-token" name="kushki-token">
 <input type="hidden" id="months" name="months" value="0">
 <input type="hidden" id="totalAmount" name="totalAmount" value="<%=request.getParameter("totalAmount")%>">
 <input type="hidden" id="isTest" name="isTest" value="true">
 <input type="hidden" id="paymentNumOrder" name="paymentNumOrder" value="<%=request.getParameter("paymentNumOrder")%>">
 <input type="hidden" id="currency" name="currency" value="COP"/>
 <input type="hidden" id="idiom" name="idiom" value="es"/>
 <input type="hidden" id="ccname" name="ccname" />
</form>
<script type="text/javascript">

function fillYearsSelect(){
	var currentyear = new Date();
	var yearSelect = document.getElementById("expireYY");
	var option1 = document.createElement("option");
	var option2 = document.createElement("option");
	var option3 = document.createElement("option");
	var option4 = document.createElement("option");
	var option5 = document.createElement("option");
	option1.text = currentyear.getFullYear();
	option1.value = currentyear.getFullYear().toString().substring(2,4);
	currentyear.setFullYear(currentyear.getFullYear()+1);
	option2.text = currentyear.getFullYear();
	option2.value = currentyear.getFullYear().toString().substring(2,4);
	currentyear.setFullYear(currentyear.getFullYear()+1);
	option3.text = currentyear.getFullYear();
	option3.value = currentyear.getFullYear().toString().substring(2,4);
	currentyear.setFullYear(currentyear.getFullYear()+1);
	option4.text = currentyear.getFullYear();
	option4.value = currentyear.getFullYear().toString().substring(2,4);
	currentyear.setFullYear(currentyear.getFullYear()+1);
	option5.text = currentyear.getFullYear();
	option5.value = currentyear.getFullYear().toString().substring(2,4);
	yearSelect.add(option1);
	yearSelect.add(option2);
	yearSelect.add(option3);
	yearSelect.add(option4);
	yearSelect.add(option5);
}

function checkDec(el){
	var ex = /^[0-9]+\.?[0-9]*$/;
	if(ex.test(el.value)==false){
		el.value = el.value.substring(0,el.value.length - 1);
	}
}

function getToken(){
	var month;
	var year = document.getElementById("expireYY");
	document.getElementById("idiom").value = "es";
	month = document.getElementById("expireMMespanol");
	document.getElementById("currency").value = "COP";
	console.log(document.getElementById("currency").value);
	
	document.getElementById("expiryMonth").value = month.options[month.selectedIndex].value;
	document.getElementById("expiryYear").value = year.options[year.selectedIndex].value;
	document.getElementById("expiry").value = month.options[month.selectedIndex].value+""+year.options[year.selectedIndex].value;
	var amount = document.getElementById("totalAmount").value;
	var publicmerchantid= "10000002825331705579151380634343"
	var geturl = "https://api-uat.kushkipagos.com/v1/tokens"
	
	var data = "{\"card\": {\"name\": \""+document.getElementById("name").value+"\",\"number\":\""+ document.getElementById("number").value+"\",\"expiryMonth\":\""+document.getElementById("expiryMonth").value
			+"\",\"expiryYear\":\""+ document.getElementById("expiryYear").value+"\",\"cvv\":\""+document.getElementById("cvv").value+"\"},\"totalAmount\":"+parseFloat(amount.slice(0,-2)+"."+amount.slice(amount.length-2,amount.length)).toFixed(2)
			+",\"currency\": \"COP\"}";
	console.log(data);
		$.ajax({
		    url: geturl,
		    headers: {
		        'Content-Type':'application/json',
		        'Public-Merchant-Id':publicmerchantid
		    },
		    method: 'POST',
		    dataType: 'json',
		    data: data
		  })
		  .always(function(datas){
		    	if(datas.token != undefined){
		    	  document.getElementById("kushki-token").value = datas.token;
		    	  document.getElementById("ccname").value = document.getElementById("name").value;
		    	  alert(datas.token);
		    	  document.getElementById("checkout-form").submit();
		      	}else{
		      		alert(datas.responseJSON.code+"-"+datas.responseJSON.message);
		      	}
		    });
}

fillYearsSelect();
</script>
<script src="https://cdn.kushkipagos.com/kushki.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</body>
</html>