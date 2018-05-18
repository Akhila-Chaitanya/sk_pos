<?php
$mysql_host_l	            = "localhost";
$mysql_username_l           = "root";
$mysql_password_l           = "chaitu";
$mysql_database_l           = "pos";
$con_l =new mysqli($mysql_host_l, $mysql_username_l, $mysql_password_l, $mysql_database_l) or die( mysql_error());
$query_l="SELECT * FROM `ospos_sync` LIMIT 1";
$res=$con_l->query($query_l);
while($output=$res->fetch_assoc())
{
	
	echo("Last Server Sync time : ");
	echo date('M-j-Y ', strtotime($output['time']));
	echo(" at ");
	echo date('g:i A', strtotime($output['time']));
}
?>