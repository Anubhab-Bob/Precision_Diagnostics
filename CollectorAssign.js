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

function populate_collector_names(elname) {
	post_data_parse("QueryPage.php", "query=collector_name", function(x){
		var select = populate_dropdown(elname, x, function (x) {
			//console.log(x);
			return x.name;
		})
		select.selectedIndex = 0;
	});

}

function initializeTable(x) {
	//console.log(x);
	var tbl = document.getElementById("populate");
	for(var i = 0; i < x.length; i++) {
		var r = x[i];
	   // console.log(r);
		var row = document.createElement("tr");
		var cell1 = document.createElement("td");
		cell1.setAttribute("id", "bid_"+i);
		var cell2 = document.createElement("td");
		var cell3 = document.createElement("td");
		cell3.setAttribute("id", "sdate_" + i);
		var cell4 = document.createElement("td");
		var cell5 = document.createElement("td");
		var cell6 = document.createElement("td");
		var cell7 = document.createElement("td");
		var cell8 = document.createElement("td");

		var textnode1 = document.createTextNode(r.bid);
		var textnode2 = document.createTextNode(r.testname);
		var textnode3 = document.createTextNode(r.sdate);
		var textnode4 = document.createTextNode(r.name);
		var textnode5 = document.createTextNode(r.phone);
		var textnode6 = document.createTextNode(r.address);
		var textnode7 = document.createTextNode(r.pincode);
		var selectnode = document.createElement("select");
		selectnode.setAttribute("id","select_"+i);
		populate_collector_names("select_"+i);

		cell1.appendChild(textnode1);
		cell1.setAttribute("data-original", r.bid);
		cell2.appendChild(textnode2);
		cell2.setAttribute("data-original", r.testname);
		cell3.appendChild(textnode3);
		cell3.setAttribute("data-original", r.sdate);
		cell4.appendChild(textnode4);
		cell4.setAttribute("data-original", r.name);
		cell5.appendChild(textnode5);
		cell5.setAttribute("data-original", r.phone);
		cell6.appendChild(textnode6);
		cell6.setAttribute("data-original", r.address);
		cell7.appendChild(textnode7);
		cell7.setAttribute("data-original", r.pincode);
		cell8.appendChild(selectnode);

		row.appendChild(cell1);
		row.appendChild(cell2);
		row.appendChild(cell3);
		row.appendChild(cell4);
		row.appendChild(cell5);
		row.appendChild(cell6);
		row.appendChild(cell7);
		row.appendChild(cell8);
		row.style.display = "";
		tbl.appendChild(row);
	}
}

function setCollector() {
	var tbl = document.getElementById("populate");
	if (tbl.rows.length == 1)
		alert("Nothing to assign!");
	else {
		for (var i = 0; i < tbl.rows.length - 1; i++) {
			var item = document.getElementById("select_" + i);
			post_data_parse_option("QueryPage.php", "query=get_collector_id&cName=" + item.value, i, function (x, i) {
				var bid = document.getElementById("bid_" + i).innerText;
				var sdate = document.getElementById("sdate_" + i).innerText;
				post_data("QueryPage.php", "query=setAssignment&bid=" + bid + "&cid=" + x[0].cid + "&sdate=" + sdate, function (x) {
					//alert("Collectors Assigned Successfully!");
					console.log(x);
				})
				//globalThis.option = x[0].cid;
				//var r = tbl.rows[i + 1];
				//console.log(tbl.rows[i]);
				//var c = r.cells[0];
				//console.log(c.getAttribute("data-original"));
				//return x[0].cid;
			});
		}
		alert("New Bookings Alloted!");
	}
	window.location.replace("AdminHome.html");
}

function populate_all() {
	post_data_parse("QueryPage.php", "query=collectionData", function (x) {
		console.log(x);
		initializeTable(x);
	});
}

window.onload = populate_all;
document.getElementById("assign").addEventListener("click", setCollector);