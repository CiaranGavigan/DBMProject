<html>
	<head>
		<title>Php Get Staff who make less then 30k</title>
	</head>	
	<body>
		<h4>select billing.ownerName, billing.ownerAddress, billing.totalCost from billing WHERE billing.paymentMethod = 'Card';<h4>
		<table border="1">
			<tr>
                <td><h2>Owner Name<h2></td>
				<td><h2>Owner Address</h2></td>
				<td><h2>Total Cost</h2></td>
				
			</tr>
			<?php
			// include vars for access to remote database
            include 'vars.php';	
				// main query to show treatment table
				$query = "select billing.ownerName, billing.ownerAddress, billing.totalCost from billing WHERE billing.paymentMethod = 'Card'";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				// output table results
				while($row = $result->fetch_array())
				{		
					echo "<tr>";
                    echo "<td><h2>" .$row['ownerName'] . "</h2></td>";
					echo "<td><h2>" .$row['ownerAddress'] . "</h2></td>";
					echo "<td><h2>" .$row['totalCost'] . "</h2></td>";
					//echo "<td><h2><img src=imageBlobs.php?id=".$row['pid']." width=200 height=150/></h2></td>";
                    //echo "<td><h2><img src=http://".$host.$row['scan_path'] . " width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>