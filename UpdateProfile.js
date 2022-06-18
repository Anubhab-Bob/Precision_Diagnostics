
function post_data_parse(file, data, doSomething) {
	var http = new XMLHttpRequest();
	var url = file;
	var params = data;
	http.open('POST', url, true);
	//Send the proper header information along with the request
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {
			//console.log(JSON.parse(http.responseText));
			doSomething(JSON.parse(http.responseText));
		}
	}
	http.send(params);
}

//For updation queries the result is either true or false. 
//So there is no need for parsing. This function calls the updation functions without any decoding
function post_data(file, data, doSomething) 
{
	var http = new XMLHttpRequest();
	var url = file;
	var params = data;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

	http.onreadystatechange = function() 
	{
		//Call a function when the state changes.
		//HTTP has 4 states where state 4 is when data,response is downloaded correctly
		//HTTP response status = 200 means all okay
		if(http.readyState == 4 && http.status == 200) 
		{
			//The function is called without any encoding as no table is being generated which needs to be parsed
			doSomething(http.responseText);
		}
	}
	http.send(params);
}

function populate(elname, data, decode_fn) {
	
	if (elname == "name")
	{
		let element = document.getElementById("f_name");
		element.value = decode_fn(data).split(" ")[0];	
		element = document.getElementById("l_name");
		element.value = decode_fn(data).split(" ")[1];
	}
	else
	{
		let element = document.getElementById(elname);
		element.value = decode_fn(data);
		if (elname == "gen")
		{
			if (element.value == 'M')
				element.value = "Male";
			else
				element.value = "Female";
		}
	}
}

function populate_data() {
	//document.getElementById("save").addEventListener("click", update, false);
	var uid = document.getElementById("uid").innerText;
	post_data_parse("QueryPage.php", "query=showall&uid="+uid, function (x) {
		console.log(x);
		populate("name", x, function (x) {
			return x[0].name;
		});
		populate("bgrp", x, function (x) {
			return x[0].blood_group;
		});
		populate("gen", x, function (x) {
			return x[0].gender;
		});
		populate("uname", x, function (x) {
			return x[0].uname;
		});
		populate("pwd", x, function (x) {
			return x[0].pwd;
		});
		populate("address", x, function (x) {
			return x[0].address;
		});
		populate("phone", x, function (x) {
			return x[0].phone;
		});
		populate("email", x, function (x) {
			return x[0].email;
		});
		populate("pincode", x, function (x) {
			return x[0].pincode;
		});
	});
}

function update() {
	//console.log(document.getElementById("save").value);// = "Hello World";
	var uid = document.getElementById("uid").innerText;
	var name = encodeURIComponent(document.getElementById("f_name").value + " " + document.getElementById("l_name").value);
	var uname = encodeURIComponent(document.getElementById("uname").value);
	var pwd = encodeURIComponent(document.getElementById("pwd").value);
	var email = encodeURIComponent(document.getElementById("email").value);
	var phone = document.getElementById("phone").value;
	var address = encodeURIComponent(document.getElementById("address").value);
	var pin = document.getElementById("pincode").value;
	//console.log(uid+name+uname+pwd+email+phone+address+pin);
	post_data("QueryPage.php", "query=update&uid="+uid+"&name="+name+"&pwd="+pwd+"&email="+email+"&phone="+phone+"&address="+address+"&pin="+pin, function (x) {
		console.log(x);
		alert("Data Saved Successfully!");
		window.location.replace("UserHome.html");
	});
}


window.onload = populate_data;
document.getElementById("cancel").addEventListener("click", function () {
	window.location.replace("UserHome.html");
});
document.getElementById("save").addEventListener("click", update);