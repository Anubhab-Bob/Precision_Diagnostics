<?php	
	
	function debug_to_console($data)
	{
		$output = $data;
		if (is_array($output)) {
			$output = implode(',', $output);
		}

		echo "<script>console.log('Debug Objects: " . $output . "' );</script>";
	}
	function run_query($query, $isUpdate)
	{
		$conn = new mysqli('localhost', 'root', '', 'precision');
		/*if($isUpdate == true)
			debug_to_console($query);*/
		if ($conn->connect_error) 
			die('Unable to connect to the database : ' . $conn->connect_error);
		else 
		{
			$result = $conn->query($query);
			if ($isUpdate == false) 
			{
				//echo $result;
				$txt = json_encode(mysqli_fetch_all($result, MYSQLI_ASSOC));
				echo $txt;
			} else 
			{
				echo "{}";
			}
			$conn->close();
		}
	}

	switch ($_POST["query"]) 
	{
		case 'showall':
			run_query("SELECT
						c.custid,
						c.gender,
						c.blood_group,
						u.name,
						u.address,
						u.phone,
						u.uname,
						u.pwd,
						c.email,
						c.pincode,
						c.uid
					FROM
						`customer` c,
						`user` u
					WHERE
						u.uid = c.uid
					AND
						c.uid=".$_POST["uid"], false);
		break;

		case 'update':
			run_query("UPDATE 
						customer 
					SET
						pincode=". $_POST["pin"] .",
						email='". $_POST["email"] ."' 
					WHERE 
						uid=". $_POST["uid"],true);

			run_query("UPDATE
						user
					SET
						name='". $_POST["name"] ."',
						address='". $_POST["address"] ."',
						phone=". $_POST["phone"] .",
						pwd='". $_POST["pwd"] ."'
					WHERE
						uid=". $_POST["uid"],true);
		break;

		case 'collectionData':
			run_query("SELECT
			b.bid,
			t.testname,
			b.sdate,
			u.name,
			u.phone,
			u.address,
			c.pincode
		FROM
			booking b,
			customer c,
			USER u,
			test t
		WHERE
			b.tid = t.tid AND b.custid = c.custid AND c.uid = u.uid AND b.status = 'SCHEDULED' 
		AND 
			b.collection_type = 'HOME'
		AND
			b.bid NOT IN(
		SELECT
			bid
		FROM
			alloted
		)
		ORDER BY
			b.bid", false);
		break;

		case 'collector_name':
			run_query("SELECT name
					FROM
						`user`,
						collector
					WHERE
						user.uid = collector.uid", false);
		break;

		case 'get_collector_id':
			run_query("SELECT
						cid
					FROM
						collector
					WHERE
						uid = (
								SELECT 
									uid
								FROM
									USER
								WHERE 
									name = '".$_POST['cName']."')", false);
		break;

		case 'setAssignment':
			run_query("INSERT INTO alloted(bid, cid, status, cdate)
						VALUES(".$_POST["bid"].", ".$_POST["cid"].", 'SCHEDULED', '".$_POST["sdate"]."')", true);
		break;

		case 'rescheduleData':
			run_query("SELECT
						b.bid,
						t.testname,
						b.sdate,
						u.name,
						u.phone,
						u.address,
						c.pincode
					FROM
						booking b,
						customer c,
						USER u,
						test t,
						alloted a
					WHERE
						b.tid = t.tid AND b.custid = c.custid AND c.uid = u.uid AND b.bid = a.bid AND a.status = 'RESCHEDULE'
					ORDER BY
						b.bid", false);
		break;

		case 'reschedule':
			run_query("UPDATE
						alloted
					SET
						cid = ".$_POST["cid"].",
						status = 'SCHEDULED',
						cdate = '".$_POST["rdate"]."'
					WHERE
						bid = ".$_POST["bid"], true);
		break;

		case 'department_name':
			run_query("SELECT
						dname
					FROM
						department", false);
		break;

		case 'test_name':
			run_query("SELECT
						testname
					FROM
						test", false);
		break;

		case 'insert_test':
			run_query("INSERT INTO test(
						testname,
						did,
						price,
						preparation,
						inhouse
					)
					VALUES(
						'".$_POST["name"]."',
						".$_POST["dept"].",
						".$_POST["price"].",
						'".$_POST["prep"]."',
						".$_POST["home"].")", true);
		break;

		case 'get_dept_id':
			run_query("SELECT
						did
					FROM
						department
					WHERE
						dname = '".$_POST["dname"]."'", false);
		break;

		case 'get_user_id':
			run_query("SELECT
						uid
					FROM
						user
					WHERE
						name = '".$_POST["name"]."'
					AND
						phone = ".$_POST["phone"], false);

		break;

		case 'insert_collector_user':
			run_query("INSERT INTO user(
						name,
						address,
						phone,
						uname,
						pwd,
						type
					)
					VALUES(
						'".$_POST["cName"]."',
						'".$_POST["addr"]."',
						".$_POST["phone"].",
						'".$_POST["uname"]."',
						'".$_POST["pwd"]."',
						'COLLECTOR')", true);
		break;

		case 'insert_collector':
			run_query("INSERT INTO collector(
						uid
					)
					VALUES(
						".$_POST["uid"].")", true);
		break;

		case 'update_test':
			run_query("UPDATE
						test
					SET
						price = ".$_POST["price"]."
					WHERE
						testname = '".$_POST["tname"]."'", true);
		break;

		case 'insert_equip':
			run_query("INSERT INTO equipment(
						ename,
						did,
						quantity,
						working
					)
					VALUES(
						'".$_POST["ename"]."',
						".$_POST["dept"].",
						".$_POST["qty"].",
						".$_POST["qty"].")", true);
		break;
	}
?>