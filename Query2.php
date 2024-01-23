<html>
	<head>
		<title>Php Get Staff who make less then 30k</title>
	</head>	
	<body>
		<h4>SELECT staff.sid, staff.empName, staff.salary  FROM staff WHERE staff.salary <= 30000.00;<h4>
		<table border="1">
			<tr>
                <td><h2>PID</h2></td>
				<td><h2>Employee Name</h2></td>
				<td><h2>Salary</h2></td>
				
			</tr>
			<?php
			// include vars for access to remote database
            include 'vars.php';	
				// main query to show treatment table
				$query = "SELECT staff.sid, staff.empName, staff.salary  FROM staff WHERE staff.salary <= 30000.00";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				// output table results
				while($row = $result->fetch_array())
				{		
					echo "<tr>";
                    echo "<td><h2>" .$row['sid'] . "</h2></td>";
					echo "<td><h2>" .$row['empName'] . "</h2></td>";
					echo "<td><h2>" .$row['salary'] . "</h2></td>";
					//echo "<td><h2><img src=imageBlobs.php?id=".$row['pid']." width=200 height=150/></h2></td>";
                    //echo "<td><h2><img src=http://".$host.$row['scan_path'] . " width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>