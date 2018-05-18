<?php
$mysql_host_l	            = "localhost";
$mysql_username_l           = "root";
$mysql_password_l           = "chaitu";
$mysql_database_l           = "pos";
$mysql_host_r	            = "50.62.209.198:3306";
$mysql_username_r           = "ph17577root";
$mysql_password_r           = "ph17577555906_POS";
$mysql_database_r           = "Chaitu@21";

$mysqli = new mysqli($mysql_host_l, $mysql_username_l, $mysql_password_l) or die( mysql_error());

/*  Begin Transaction   */
$mysqli->autocommit(FALSE); 


/*  Insert data from db1 to db2 */
$query  =  "    INSERT INTO $mysql_database1.table1";

$a  =   $mysqli->query($query); 

$query  =  "    INSERT INTO $mysql_database1.table2
            SELECT 
                *
            FROM $mysql_database2.table2
            WHERE NOT EXISTS(SELECT * from $mysql_database1.table2)     
";
$d  =   $mysqli->query($query); 


if ($a and $b) 
{
    $mysqli->commit();      
    echo "Data synched successfully.";
} else {        

    $mysqli->rollback();        
    echo "Data failed to synch.";
}
?>