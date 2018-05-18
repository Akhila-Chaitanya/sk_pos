<?php

$label = '
/***************************************************
	Database Backup for - Godown (Aswapuram) 
****************************************************/
';
$site="Godown (Aswapuram): ";
							

/***************************************************
	Database settings
****************************************************/
	$db_server			= 'localhost';				// Database server, usually "localhost", 
	                                                // on (mt) servers something like internal-db.s12345.gridserver.com
 	$db_name 			= 'pos';				// Database name, leave empty for 'all databases'
	$db_user 		    = 'root';				// Database username
	$db_pass 		    = 'chaitu';				// Database password



/***************************************************
	E-mail settings
****************************************************/
 	$website            = 'saikrupasupermarket.in';		    // Your site's domain (without www. part)
	$send_to 		    = 'admin@saikrupasupermarket.in';		        // backup file will be sent to?
	$from 		        = 'sales@' . $website;	// some hosting providers won’t let you send backups from invalid e-mail address



/***************************************************
    Misc options
****************************************************/

    $full_path      = 'C:\wamp\www\pos\pos'; 
    // Full path to folder where you are running the script, usually "/home/username/public_html"
    // (mt) servers have something like "/nfs/c01/h01/mnt/12345/domains/yourdomain.mobi/html/tools/backup2mail"

 	
 	$delete_backup	= true;							
 	// delete gziped database from server after sending?

    $send_log       = true;							
    // send follow-up report?
 	// - true = send log file to an e-mail after each backup transfer
 	// - false = don't send log file, just leave it on the server



/***************************************************
	If everything goes well, you shouldn't
	modify anything below.
****************************************************/

error_reporting(E_ALL);

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Backup2mail status [' . $website . ']</title>
		<style type="text/css">body { background: #000; color: #0f0; font-family: \'Courier New\', Courier; }</style>
	</head>
	<body>';

function date_stamp() {
	global $html_output;
	$backup_date = date('Y-m-d-H-i');
	echo 'Database backup date: ' . $backup_date . '<br />';
	return $backup_date;
}

function backup_filename() {
    global $db_name, $date_stamp, $html_output;
	$db_backup_filename = ($db_name == '' ? 'all_databases' : $db_name) . '_' . $date_stamp . '.sql';
	echo 'Database backup file: ' . $db_backup_filename . '<br />';
	return $db_backup_filename;
}

function db_dump() {
	global $db_server, $db_name, $db_user, $db_pass, $backup_filename, $html_output, $full_path;
	$cmd = 'C:\wamp\bin\mysql\mysql5.7.11\bin\mysqldump -u ' . $db_user . ' -h ' . $db_server . ' --password=' . $db_pass . ' ' . ($db_name == '' ? '--all-databases' : $db_name) . ' > '.$full_path.'\\'.$backup_filename;
	$dump_status = (passthru($cmd) === false) ? 'No' : 'Yes';
	echo 'Command: ' . $cmd . '<br />';
	echo 'Command executed? ' . $dump_status . '<br />';
	return $dump_status;
}

function send_attachment($file, $file_is_db = true) {
	global $send_to, $from, $website, $delete_backup, $html_output;

	$sent       = 'No';

	$subject    = 'MySQL backup - ' . ($file_is_db ? 'db dump' : 'report') . ' [' . $website . ']';
    $message ="Mail From Backup Script, Please find the attachment";
$content = file_get_contents( $file);
$content = chunk_split(base64_encode($content));
$uid = md5(uniqid(time()));
$name = basename($file);

// header
$header = "From: Backup"." <".$from.">\r\n";
$header .= "Reply-To: ".$from."\r\n";
$header .= "MIME-Version: 1.0\r\n";
$header .= "Content-Type: multipart/mixed; boundary=\"".$uid."\"\r\n\r\n";

// message & attachment
$nmessage = "--".$uid."\r\n";
$nmessage .= "Content-type:text/plain; charset=iso-8859-1\r\n";
$nmessage .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
$nmessage .= $message."\r\n\r\n";
$nmessage .= "--".$uid."\r\n";
$nmessage .= "Content-Type: application/octet-stream; name=\"".$file."\"\r\n";
$nmessage .= "Content-Transfer-Encoding: base64\r\n";
$nmessage .= "Content-Disposition: attachment; filename=\"".$file."\"\r\n\r\n";
$nmessage .= $content."\r\n\r\n";
$nmessage .= "--".$uid."--";

	if (mail($send_to, $subject, $nmessage, $header)) {
		$sent = 'Yes';	
			//echo "Body is: ".$body;
		echo ($file_is_db ? 'Backup file' : 'Report') . ' sent to ' . $send_to . '.<br />';
		if ($file_is_db) {
			if ($delete_backup) {
	            unlink($file);
				echo 'Backup file REMOVED from disk.<br />';
			} else {
				echo 'Backup file LEFT on disk.<br />';
			}
		}
	} else {
		echo '<span style="color: #f00;">' . ($file_is_db ? 'Database' : 'Report') . ' not sent! Please check your mail settings.</span><br />';
	}
	
	echo 'Sent? ' . $sent;
	
	return $sent;
}

function write_log() {
    global $backup_filename, $date_stamp, $send_log, $label, $full_path;

    $log_file = $full_path . '/backup_log.txt';
    if (!$handle = fopen($log_file, 'a+')) exit;
	if (chmod($log_file, 0644) && is_writable($log_file)) {

    	echo '<h2>Mysqldump...</h2>';
		$dumped         = db_dump();

		echo '<h2>Sending db...</h2>';
	    $log_content    = "\n" . $date_stamp . "\t\t\t" . $dumped . "\t\t\t" . send_attachment($backup_filename);

        echo '<h2>Writing log...</h2>';
        
        $log_header = '';
        if (filesize($log_file) == '0') {
			$log_header .= $label . "\n\n";
			$log_header .= 'Backup log' . "\n";
			$log_header .= '----------------------------------------------' . "\n";
			$log_header .= 'DATESTAMP:					DUMPED		MAILED' . "\n";
			$log_header .= '----------------------------------------------';
			
			if (fwrite($handle, $log_header) === false) exit;
		}
        
        echo 'Log header written: ';
		if (fwrite($handle, $log_header) === false) {
		    echo 'no<br />' . "\n";
		    exit;
		} else {
		    echo 'yes<br />' . "\n";
		}
		                            
		echo 'Log status written: ';    
	    if (fwrite($handle, $log_content) === false) {
		    echo 'no<br />' . "\n";
		    exit;
		} else {
		    echo 'yes<br />' . "\n";
		}

	}

	fclose($handle);
	
	if ($send_log) {
	    echo '<h2>Sending log...</h2>';
		send_attachment($log_file, false);
	}
}



echo '<h2>Setup</h2>';
$date_stamp         = date_stamp();
$backup_filename    = backup_filename();
$init               = write_log();

echo '<br /><br />...<br /><br />If all letters are green and you received the files, you\'re good to go!<br />Remove '#' from this folder’s .htaccess file NOW.</body></html>';

?>