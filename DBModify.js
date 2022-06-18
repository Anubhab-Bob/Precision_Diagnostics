function post_data_parse(file, data, doSomething) {
	var http = new XMLHttpRequest();
	var url = file;
	var params = data;
	http.open('POST', url, true);
	//Send the proper header information along with the request
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.onreadystatechange = function() {//Call a function when the state changes.
		if(http.readyState == 4 && http.status == 200) {
			doSomething(JSON.parse(http.responseText));
		}
	}
	http.send(params);
}

function post_data_parse_option(file, data, option, doSomething) {
	var http = new XMLHttpRequest();
	var url = file;
	var params = data;
	http.open('POST', url, true);
	//Send the proper header information along with the request
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.onreadystatechange = function() {//Call a function when the state changes.
		if(http.readyState == 4 && http.status == 200) {
			doSomething(JSON.parse(http.responseText), option);
		}
	}
	http.send(params);
}

function post_data(file, data, doSomething) 
{
	var http = new XMLHttpRequest();
	var url = file;
	var params = data;
	http.open('POST', url, true);
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.onreadystatechange = function() 
	{
		if(http.readyState == 4 && http.status == 200) {
			doSomething(http.responseText);
		}
	}
	http.send(params);
}

function populate_dropdown(elname, data, decode_fn) 
{
	var select = document.getElementById(elname);
	//console.log(elname);
	for(var i = 0;i < data.length; i++) 
	{
		var opt = decode_fn(data[i]);
		var el = document.createElement("option");
		el.textContent = opt;
		el.value = opt;
		select.appendChild(el);
	}
	return select;
}

function populate_department() {
	post_data_parse("QueryPage.php", "query=department_name", function(x){
		var select = populate_dropdown("t_dept", x, function (x) {
			return x.dname;
		});
		select = populate_dropdown("e_dept", x, function (x) {
			return x.dname;
		});
		select.selectedIndex = 0;
	});
	var select = populate_availability();
	select.selectedIndex = 0;
}

function populate_test() {
	post_data_parse("QueryPage.php", "query=test_name", function(x){
		var select = populate_dropdown("t_nameAlter", x, function (x) {
			return x.testname;
		});
		select.selectedIndex = 0;
	});
	populate_department();
}

function populate_availability() {
	var select = document.getElementById("t_home");
	var el = document.createElement("option");
	el.textContent = "YES";
	el.value = "YES";
	select.appendChild(el);
	el = document.createElement("option");
	el.textContent = "NO";
	el.value = "NO";
	select.appendChild(el);
	return select;
}


function insert_test() {
	//console.log(document.getElementById("save").value);// = "Hello World";
	var dept = encodeURIComponent(document.getElementById("t_dept").value);
	post_data_parse("QueryPage.php", "query=get_dept_id&dname=" + dept, function (x) {
		console.log(x);
		var testName = document.getElementById("t_name").value;
		var price = encodeURIComponent(document.getElementById("t_price").value);
		var dept = x[0].did;
		var prep = encodeURIComponent(document.getElementById("t_prep").value);
		var home = encodeURIComponent(document.getElementById("t_home").value);
		if (home == 'YES')
			home = 1;
		else
			home = 0;
		
		post_data("QueryPage.php", "query=insert_test&name="+testName+"&price="+price+"&dept="+dept+"&prep="+prep+"&home="+home, function (x) {
			console.log(x);
			alert("Data Saved Successfully!");
			window.location.replace("UserHome.html");
		});
	});
}

function insert_collector() {
	var cName = encodeURIComponent(document.getElementById("c_name").value);
	var addr = encodeURIComponent(document.getElementById("c_addr").value);
	var phone = document.getElementById("c_phone").value;
	var uname = encodeURIComponent(document.getElementById("c_uname").value);
	var pwd = encodeURIComponent(document.getElementById("c_pwd").value);
	post_data("QueryPage.php", "query=insert_collector_user&cName="+cName+"&addr="+addr+"&phone="+phone+"&uname="+uname+"&pwd="+pwd, function (x) {
		post_data_parse("QueryPage.php", "query=get_user_id&name=" + cName + "&phone=" + phone, function (x) {
			console.log(x);
			post_data("QueryPage.php", "query=insert_collector&uid=" + x[0].uid, function (x) {
				console.log(x);
			});
		});
		alert("Data Saved Successfully!");
		window.location.replace("UserHome.html");
	});
}

function alterPrice() {
	var tname = encodeURIComponent(document.getElementById("t_nameAlter").value);
	var price = document.getElementById("t_priceAlter").value;
	post_data("QueryPage.php", "query=update_test&tname=" + tname + "&price=" + price, function (x) {
		console.log(x);
	});
}

function insert_equipment() {
	//console.log(document.getElementById("save").value);// = "Hello World";
	var dept = encodeURIComponent(document.getElementById("e_dept").value);
	post_data_parse("QueryPage.php", "query=get_dept_id&dname=" + dept, function (x) {
		console.log(x);
		var eName = document.getElementById("e_name").value;
		var qty = encodeURIComponent(document.getElementById("e_qty").value);
		var dept = x[0].did;		
		post_data("QueryPage.php", "query=insert_equip&ename="+eName+"&qty="+qty+"&dept="+dept, function (x) {
			console.log(x);
			alert("Data Saved Successfully!");
			//window.location.replace("UserHome.html");
		});
	});
}

window.onload = populate_test;
document.getElementById("t_save").addEventListener("click", insert_test);
document.getElementById("c_save").addEventListener("click", insert_collector);
document.getElementById("e_save").addEventListener("click", insert_equipment);
document.getElementById("t_saveAlter").addEventListener("click", alterPrice);