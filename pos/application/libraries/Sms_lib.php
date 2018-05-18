<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * SMS library
 *
 * Library with utilities to send texts via SMS Gateway (requires proxy implementation)
 */

class Sms_lib
{
	private $CI;
	

  	public function __construct()
	{
		$this->CI =& get_instance();
	}

	/*
	 * SMS sending function
	 * Example of use: $response = sendSMS('4477777777', 'My test message');
	 */
	public function sendSMS($phone, $message)
	{
		$response = FALSE;
		//$phone = "9652860754";
		//$message = "This is a test message from the PHP API script.";
		$hash="15464ac5106cf98e09b49d921940084ba36a86b7ee9c283b5985db5e5f643566";
		//$hash = "f6599e09933d1de0dab27b16660e68e6bf9f38ecb0e80e0a79dfcb1d724e949f";
		$username = "sms@saikrupasupermarket.in";
	if(strlen($phone)==11)
			$phone=substr($phone,1,10);
		if(strlen($phone)==10)
			$phone="91".$phone;
		if(strlen($phone)>12)
		   $phone=substr($phone,-12);
		$numbers = $phone;
		//echo $numbers."<br>";
	// Config variables. Consult http://api.textlocal.in/docs for more info.
	$test = "0";
	// Data for text message. This is the text message data.
	$sender = "SAIKRP"; // This is who the message appears to be from.
	$numbers = $phone; // A single number or a comma-seperated list of numbers
	// 612 chars or less
	// A single number or a comma-seperated list of numbers
	$message = urlencode($message);
	$data = "username=".$username."&hash=".$hash."&message=".$message."&sender=".$sender."&numbers=".$numbers."&test=".$test;
	$ch = curl_init('http://api.textlocal.in/send/?');
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$res = curl_exec($ch); // This is the result from the API
	$res = json_decode($res, TRUE);
	if ($res['status']=='success')
		$response=TRUE;
		return $response;
	}
}

?>
