<?php
$mysql_host_l	            = "localhost";
$mysql_username_l           = "root";
$mysql_password_l           = "chaitu";
$mysql_database_l           = "pos";
$mysql_host_r	            = "166.62.28.113";
$mysql_username_r           = "chaitupos1";
$mysql_password_r           = "chaitupos1";
$mysql_database_r           = "akhipos1";
$myid="1";
$tot_clients=3;
$eno=3;
function is_not_null ($var) { return !is_null($var); }
//________________________________________________________________//
//
//********** Giving unique ids for each table entry***************// 
//****************************************************************//
//________________________________________________________________//
//
$con_l =new mysqli($mysql_host_l, $mysql_username_l, $mysql_password_l, $mysql_database_l) or die( mysql_error());
$con_r = new mysqli($mysql_host_r, $mysql_username_r, $mysql_password_r, $mysql_database_r) or die( mysql_error());
$query_r="SET FOREIGN_KEY_CHECKS = 0";
$fchk="SET FOREIGN_KEY_CHECKS = 0;";
$res_r=$con_r->query($query_r) or die();
$query_l="SHOW TABLES FROM pos";
$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
while($output=$res_l->fetch_assoc())
	$tables[]=$output['Tables_in_pos'];
//print_r ($tables);
echo "\n";
$k=0;
$query_r="SELECT * FROM  `ospos_sync_seq` LIMIT 0 , 30";
$res_r=$con_r->query($fchk);
print_r($res_r);
//$res_r=$con_r->query($fchk); $res_r=$con_r->query($fchk); 
$res_r=$con_r->query($query_r);
print_r($res_r);
$sync=0;
while($output=$res_r->fetch_assoc())
{
	if($output['loc_id']==$myid)
	{
		$timestamp=strtotime($output['time']);
		$query_r="SELECT CURRENT_TIMESTAMP();";
		$res_r=$con_r->query($fchk);
		$result=$con_r->query($query_r);
		$result2=$result->fetch_assoc();
		$time_now=strtotime($result2['CURRENT_TIMESTAMP()']);
		echo("Timestamp: ".$timestamp."\n\rPresent server time:".$time_now);
		if ($time_now<$timestamp+60){
			$sync=1;
			$query_r="UPDATE `ospos_sync_seq` SET `act`='1'";
			$result=$con_r->query($query_r);
		}
		else{
			$sync=0;
			$loc=$myid+1;
			if($loc>$tot_clients)
				$loc=1;
			$query_r="UPDATE `ospos_sync_seq` SET `act`='0', `loc_id`='".$loc."'";
			$result=$con_r->query($query_r);
			echo"\n\rpass";
			//echo $query_r;
		}
		}
	else{
		$loc_id=$output['loc_id'];
		if($loc_id<$myid)
			$distance=$myid-$loc_id;
		else
		$distance=($tot_clients-$loc_id)+$myid;
		$timestamp=strtotime($output['time']);
		$query_r="SELECT CURRENT_TIMESTAMP();";
		$result=$con_r->query($query_r);
		$result2=$result->fetch_assoc();
		$time_now=strtotime($result2['CURRENT_TIMESTAMP()']);
		echo("Timestamp: ".$timestamp."\n\rPresent server time:".$time_now."\n\rTime difference: ".($time_now-$timestamp)/60);
		if ($time_now>$timestamp+(1000*$distance)){
			$sync=1;
			$query_r="UPDATE `ospos_sync_seq` SET `act`='1', `loc_id`='".$myid."'";
			$result=$con_r->query($query_r);
		}
		else echo("\n\rwaiting.....for Client:".$output['loc_id']."\n\r");
	}
	break;
}
if($sync)
//if(date('i', time())%5==$myid)
{
for($k=0;$k<sizeof($tables);$k++)
{
	
if ($k!=0 && $k!=14 && $k!=2 && $k!=15 && $k!=26 && $tables[$k]!='ospos_sync' && $tables[$k]!='ospos_sync_seq')
{
	echo ("\n for:     ".$tables[$k]."\n");
$query_r="SHOW TABLE STATUS LIKE '".$tables[$k]."'";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
while($output=$res_r->fetch_assoc())
$auto_incr=$output['Auto_increment'];
$query_l="SELECT * FROM ".$tables[$k]." WHERE `slid`='".$myid."' ORDER BY `seno` DESC LIMIT 1";
$echo="SELECT * FROM ".$tables[$k]." WHERE `slid`='".$myid."' ORDER BY `seno` DESC LIMIT 1";
$res_l=$con_l->query($fchk);$res_l=$con_l->query($query_l);
$output=$res_l->fetch_assoc();
$maxeno=$output['seno'];
$query_l="SELECT * FROM ".$tables[$k]." WHERE `slid`='".$myid."' AND `seno`=0";
$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
$i=1;
while($output=$res_l->fetch_assoc())
{
	$nxt_eno=$maxeno+$i;
	echo "\nUPDATE ".$tables[$k]." SET `seno`='".$nxt_eno."' WHERE `slid`='".$myid."' AND `seno`='0' LIMIT 1";
	$query_l="UPDATE ".$tables[$k]." SET `seno`='".$nxt_eno."' WHERE `slid`='".$myid."' AND `seno`='0' LIMIT 1";
	$res_temp=$con_l->query($query_l);
	$i++;
	echo "\n";
}
if($myid=="1"){
$query_r="SELECT * FROM ".$tables[$k]." WHERE `slid`='0' ORDER BY `seno` DESC LIMIT 1";
$echo="SELECT * FROM ".$tables[$k]." WHERE `slid`='0' ORDER BY `seno` DESC LIMIT 1";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
$output=$res_r->fetch_assoc();
$maxeno=$output['seno'];
$query_r="SELECT * FROM ".$tables[$k]." WHERE `slid`='0' AND `seno`=0";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
$i=1;
while($output=$res_r->fetch_assoc())
{
	$nxt_eno=$maxeno+$i;
	echo "\nUPDATE ".$tables[$k]." SET `seno`='".$nxt_eno."' WHERE `slid`='0' AND `seno`='0' LIMIT 1";
	$query_r="UPDATE ".$tables[$k]." SET `seno`='".$nxt_eno."' WHERE `slid`='0' AND `seno`='0' LIMIT 1";
	$res_temp=$con_r->query($query_r);
	$i++;
	echo "\n";
}}

//************************************************************************
//
//Updating old entries  and Inserting new entries with server
//
//************************************************************************

for($id=0;$id<4;$id++){
$query_r=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$id."' ORDER BY `sts` DESC LIMIT 1");
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
$last_sync="n";
while($output=$res_r->fetch_assoc())
$last_sync=$output['sts'];
if($last_sync!="n"){
	$query_r=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$id."' ORDER BY `seno` DESC LIMIT 1");
	$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
	while($output=$res_r->fetch_assoc())
	$last_eno=$output['seno'];
	$query_l=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$id."' AND `sts`>'".$last_sync."' AND `seno`<='".$last_eno."'");
	$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
	while($output=$res_l->fetch_assoc())
	{
		echo ("\nupdate Server\n");
		$output=array_filter($output, 'is_not_null');
		$keys=array_keys($output);
		$update_string="";
		for($i=0;$i<sizeof($keys);$i++)
		{
	   $key=$keys[$i];
	   $value=$output[$key];
	   if ($i>0)
	   $update_string=$update_string.", ";
	   $update_string=$update_string."`".$key."`='".$value."'";
		}
     echo ("UPDATE ".$tables[$k]." SET ".$update_string. " WHERE `slid`='".$output['slid']."'");
	  $query_r= ("UPDATE `".$tables[$k]."` SET ".$update_string. " WHERE `slid`='".$output['slid']."' AND `seno`='".$output['seno']."'");		
	  $res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
	}
	$query_l=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$id."' AND `seno`>'".$last_eno."'");
	$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
	while($output=$res_l->fetch_assoc())
	{
		echo ("\nInsert into server regular\n");
	$output=array_filter($output, 'is_not_null');	
	$keys=array_keys($output);
	for($i=0;$i<sizeof($keys);$i++)
		
	   $key=$keys[$i];
	   
	
	$implodeArray_keys = implode(',',array_map(function($item) { return "`".mysqli_real_escape_string($GLOBALS['con_l'],$item)."`"; },$keys));
	$implodeArray_values = implode(',',array_map(function($item) { return "'".mysqli_real_escape_string($GLOBALS['con_l'],$item)."'"; },$output));
   
   echo("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
   $query_r= ("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
   $res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
	}
}
else 
{
	
	$query_l=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$id."'");
	$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
	while($output=$res_l->fetch_assoc())
	{
		// Insert into server
		echo ("\nInsert into server First time\n");
		$output=array_filter($output, 'is_not_null');
	$keys=array_keys($output);
	for($i=0;$i<sizeof($keys);$i++)
		
	   $key=$keys[$i];
	   //$value=$output[$key];
	   	
	
	$implodeArray_keys = implode(',',array_map(function($item) { return "`".mysqli_real_escape_string($GLOBALS['con_l'],$item)."`"; },$keys));
	$implodeArray_values = implode(',',array_map(function($item) { return "'".mysqli_real_escape_string($GLOBALS['con_l'],$item)."'"; },$output));
   
    echo("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
	$query_r= ("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
	$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
	if(!$res_r)
	echo"Query failed\n";
	}
}
//echo ("ALTER TABLE ".$tables[$k]." AUTO_INCREMENT='".$auto_incr."'");
$query_r="ALTER TABLE ".$tables[$k]." AUTO_INCREMENT='".$auto_incr."'";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
}
}
$query_r="SET FOREIGN_KEY_CHECKS = 1";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);}
echo("\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n");

//*****************************************************************************
//
//Downloading changes made from other clients or server
//
//****************************************************************************
$query_l="SET FOREIGN_KEY_CHECKS = 0";
$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
for ($srid=0;$srid<4;$srid++)
{
	
	
		for($k=0;$k<sizeof($tables);$k++)
		{
			echo ("\n for:     ".$tables[$k]."\n");
			if ($k!=0 && $k!=14 && $k!=2 && $k!=15 && $k!=26 && $tables[$k]!='ospos_sync' && $tables[$k]!='ospos_sync_seq')
		{
	  	 $query_l=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$srid."' ORDER BY `sts` DESC LIMIT 1");
		 $res_l = $con_l->query($query_l);
		 if($res_l->num_rows==0)
		 {
		 $query_r=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$srid."' AND `seno`!='0'" );
		 $res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
         while($output=$res_r->fetch_assoc())	
			{
		// Insert into localhost for remotehost first time
			echo ("\nInsert into Local host for remote host: ".$srid." for first time\n");
			$output=array_filter($output, 'is_not_null');
			$keys=array_keys($output);
			for($i=0;$i<sizeof($keys);$i++)
		
			$key=$keys[$i];
	   //$value=$output[$key];
	   	
	
			$implodeArray_keys = implode(',',array_map(function($item) { return "`".mysqli_real_escape_string($GLOBALS['con_l'],$item)."`"; },$keys));
			$implodeArray_values = implode(',',array_map(function($item) { return "'".mysqli_real_escape_string($GLOBALS['con_l'],$item)."'"; },$output));
   
			echo("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
			$query_l= ("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
			$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
		}
		} 
		// 
		else
		{
		while($output=$res_l->fetch_assoc())
		$latest_ts=$output['sts'];
		$query_l=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$srid."' ORDER BY `seno` DESC LIMIT 1");
		 $res_l = $con_l->query($query_l);
		 while($output=$res_l->fetch_assoc())
			$last_eno=$output['seno'];
		    //echo ("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$srid."' AND `sts`>'".$latest_ts."'");
			$query_r=("SELECT * FROM ".$tables[$k]." WHERE `slid`='".$srid."' AND `sts`>'".$latest_ts."' AND `seno`!='0'");
			$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
        while($output=$res_r->fetch_assoc())
		{
			if($output['seno']>$last_eno)
			{
				echo ("\nInsert into Local host for remote host: ".$srid." for second time onwards\n");
			$output=array_filter($output, 'is_not_null');
			$keys=array_keys($output);
			for($i=0;$i<sizeof($keys);$i++)
		
			$key=$keys[$i];
	   //$value=$output[$key];
	   	
	
			$implodeArray_keys = implode(',',array_map(function($item) { return "`".mysqli_real_escape_string($GLOBALS['con_l'],$item)."`"; },$keys));
			$implodeArray_values = implode(',',array_map(function($item) { return "'".mysqli_real_escape_string($GLOBALS['con_l'],$item)."'"; },$output));
   
			echo("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
			$query_l= ("INSERT INTO `".$tables[$k]."` (".$implodeArray_keys.") VALUES (".$implodeArray_values.")");
			$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
			}
			
			else{
				
				echo ("\nupdate local host for all remote hosts\n");
				echo $latest_ts."\n";
				$output=array_filter($output, 'is_not_null');
				$keys=array_keys($output);
				$update_string="";
				for($i=0;$i<sizeof($keys);$i++)
				{
				$key=$keys[$i];
				$value=$output[$key];
				if ($i>0)
				$update_string=$update_string.", ";
				$update_string=$update_string."`".$key."`='".$value."'";
				}
				echo ("UPDATE ".$tables[$k]." SET ".$update_string. " WHERE `slid`='".$output['slid']."' AND `seno`='".$output['seno']."'");
				$query_l= ("UPDATE `".$tables[$k]."` SET ".$update_string. " WHERE `slid`='".$output['slid']."' AND `seno`='".$output['seno']."'");		
				$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
				}
		}
		}
		}
	}
}


$eno=(time() % 86400);
$query_l="UPDATE `ospos_sync` SET `eno`='".$eno."'";
$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
date_default_timezone_set("Asia/Kolkata");
$time=date("d-F-Y");
$time=$time." at ";
$time=$time.date("h:i:s A");
$query_r="UPDATE `ospos_sync` SET `eno`='".$eno."', `time`='".$time."'  WHERE `slid`='".$myid."'";
$res_r=$con_r->query($fchk); $res_r=$con_r->query($query_r);
//update stock quantities modified from remote hosts
$query_l="SELECT * FROM `ospos_xreq` WHERE `ack`=0";
$res_l=$con_l->query($fchk); $res_l=$con_l->query($query_l);
while($output=$res_l->fetch_assoc())
{
	if($output['loc_id']==$myid)
	{
		//get present quantity of the item from database
		$query_l="SELECT * FROM `ospos_item_quantities` WHERE `location_id`='".$myid."' AND `item_id`='".$output['item_id']."'";
		$res2=$con_l->query($query_l);
		while ($row=$res2->fetch_assoc())
		$qty=$row['quantity'];
		$qty=$qty+$output['count'];
	    $query_l="UPDATE `ospos_item_quantities` SET `quantity` = '".$qty."' WHERE `location_id`='".$myid."' AND `item_id`='".$output['item_id']."'";
	    $res3=$con_l->query($query_l);
		$query_l="UPDATE `ospos_xreq` SET `ack`='1' WHERE `slid`='".$output['slid']."' AND `seno`='".$output['seno']."'";
		$res4=$con_l->query($query_l);
		echo ("updated quantity of '".$output['item_id']."' for remote request\n\r");
	}
}
$nxt_client=$myid+1;
if($nxt_client>$tot_clients)
	$nxt_client=1;

$query_r="UPDATE `ospos_sync_seq` SET `act`='0', `loc_id`='".$nxt_client."'";
$result=$con_r->query($query_r);
if($result)
	echo "Control Passed on to next client";
$query_l="SET FOREIGN_KEY_CHECKS = 1";
$res_l=$con_l->query($query_l);
}
else sleep(1);
?>