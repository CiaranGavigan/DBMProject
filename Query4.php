<html>
	<head>
		<title>Display table patients whos have treatment times of more than 7 days</title>
	</head>	
	<body>
		<h4>select m.ownerName, o.pets, m.duration from medication m inner join Owners o on m.ownerName = o.ownerName where m.duration > 7<h4>
		<table border="1">
			<tr>
                <td><h2>Owner Name<h2></td>
				<td><h2>Pet Name</h2></td>
				<td><h2>Days Treatment</h2></td>
				
			</tr>
			<?php
			// include vars for access to remote database
            include 'vars.php';	
				// main query to show treatment table
				$query ="select m.ownerName, o.pets, m.duration from medication m inner join Owners o on m.ownerName = o.ownerName where m.duration > 7";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				// output table results
				while($row = $result->fetch_array())
				{		
					echo "<tr>";
                    echo "<td><h2>" .$row['ownerName'] . "</h2></td>";
					echo "<td><h2>" .$row['pets'] . "</h2></td>";
					echo "<td><h2>" .$row['duration'] . "</h2></td>";
					//echo "<td><h2><img src=imageBlobs.php?id=".$row['pid']." width=200 height=150/></h2></td>";
                    //echo "<td><h2><img src=http://".$host.$row['scan_path'] . " width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>