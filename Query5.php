<html>
	<head>
		<title>Php Treatment Length</title>
	</head>	
	<body>
		<h4>select ap.ownerName, ap.petName, an.Scan from Appointment ap inner join Animals an on ap.ownerName = an.ownerName where ap.appointmentType = "Farm Visit"; </h4>
		<table border="1">
			<tr>
                <td><h2>pid</h2></td>
				<td><h2>Owner Name</h2></td>
				<td><h2>Pet Name</h2></td>
				<td><h2>Scan</h2></td>
			</tr>
			<?php
			// include vars for access to remote database
            include 'vars.php';	
				// main query to show treatment table
				$query = "select an.pid, ap.ownerName, ap.petName, an.scan_path from Appointment ap inner join Animals an on ap.ownerName = an.ownerName where ap.appointmentType ='Farm Visit'";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				// output table results
				while($row = $result->fetch_array())
				{		
					echo "<tr>";
                    echo "<td><h2>" .$row['pid'] . "</h2></td>";
					echo "<td><h2>" .$row['ownerName'] . "</h2></td>";
					echo "<td><h2>" .$row['petName'] . "</h2></td>";
					//echo "<td><h2><img src=imageBlobs.php?id=".$row['pid']." width=200 height=150/></h2></td>";
                    echo "<td><h2><img src=http://".$host.$row['scan_path'] . " width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>
