<html>
	<head>
		<title>Php David Burkes patients</title>
	</head>	
	<body>
		<h4>SELECT o.pets, a.appointmentType, an.speciesName FROM Owners o INNER JOIN Animals an ON o.pets = an.petName INNER JOIN Appointment a ON o.ownerName = a.ownerName WHERE a.vetName = 'David Burke';
		<table border="1">
			<tr>
                <td><h2>Pets</h2></td>
				<td><h2>Appointment Type</h2></td>
				<td><h2>Species</h2></td>
				
			</tr>
			<?php
			// include vars for access to remote database
            include 'vars.php';	
				// main query to show treatment table
				$query = "SELECT o.pets, a.appointmentType, an.speciesName FROM Owners o INNER JOIN Animals an ON o.pets = an.petName INNER JOIN Appointment a ON o.ownerName = a.ownerName WHERE a.vetName = 'David Burke'";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				// output table results
				while($row = $result->fetch_array())
				{		
					echo "<tr>";
                    echo "<td><h2>" .$row['pets'] . "</h2></td>";
					echo "<td><h2>" .$row['appointmentType'] . "</h2></td>";
					echo "<td><h2>" .$row['speciesName'] . "</h2></td>";
					//echo "<td><h2><img src=imageBlobs.php?id=".$row['pid']." width=200 height=150/></h2></td>";
                    //echo "<td><h2><img src=http://".$host.$row['scan_path'] . " width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>