<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title><?php echo $this->lang->line('items_generate_barcodes'); ?></title>
	<link rel="stylesheet" rev="stylesheet" href="<?php echo base_url();?>css/barcode_font.css" />
</head>
<body class=<?php echo "font_".$this->barcode_lib->get_font_name($barcode_config['barcode_font']); ?> 
      style="font-size:<?php echo $barcode_config['barcode_font_size']; ?>px">
	
	<table cellspacing=<?php echo $barcode_config['barcode_page_cellspacing']; ?> width='<?php echo $barcode_config['barcode_page_width']."%"; ?>' >
		<tr>
			<?php
			$count = 0;
			//foreach($items as $item)
			//{
				for($i=0;$i<2;$i++){
				if ($count % $barcode_config['barcode_num_in_row'] == 0 and $count != 0)
				{
					echo '</tr><tr>';
				}
				
				echo '<td>' . $this->barcode_lib->display_barcode($items[0], $barcode_config) . '</td>';
				++$count;
				//echo '<td>'.
				}
			//}
			?>
		</tr>
	</table>
<?php //$this->load->helper("vayes_helper"); ?>
			<?//=vdebug($item);?>
</body>

</html>
<script type="text/javascript">
function printdoc2()
{
	// install firefox addon in order to use this plugin
	if (window.jsPrintSetup)
	{
		// set top margins in millimeters
		jsPrintSetup.setOption('marginTop', '0');
		jsPrintSetup.setOption('marginLeft', '0');
		jsPrintSetup.setOption('marginBottom', '0');
		jsPrintSetup.setOption('marginRight', '0');

					// set page header
			jsPrintSetup.setOption('headerStrLeft', '');
			jsPrintSetup.setOption('headerStrCenter', '');
			jsPrintSetup.setOption('headerStrRight', '');
					// set empty page footer
			jsPrintSetup.setOption('footerStrLeft', '');
			jsPrintSetup.setOption('footerStrCenter', '');
			jsPrintSetup.setOption('footerStrRight', '');
			jsPrintSetup.setOption('numCopies', '<?php echo ceil($copies[0]/2);?>');
		
		var printers = jsPrintSetup.getPrintersList().split(',');
		// get right printer here..
		for(var index in printers) {
			var default_ticket_printer = window.localStorage && localStorage['receipt_printer'];
			var selected_printer = printers[index];
			if (selected_printer == default_ticket_printer) {
				// select epson label printer
				jsPrintSetup.setPrinter(selected_printer);
				// clears user preferences always silent print value
				// to enable using 'printSilent' option
				jsPrintSetup.clearSilentPrint();
									// Suppress print dialog (for this context only)
					jsPrintSetup.setOption('printSilent', 1);
								// Do Print
				// When print is submitted it is executed asynchronous and
				// script flow continues after print independently of completetion of print process!
				jsPrintSetup.print();
				//jsPrintSetup.setOption('printSilent', 0);
			}
		}
	}
	else
	{
		window.print();
	}
	<?php 
	array_shift($query);
	array_shift($query);
	if (sizeof($query)>=2){
	$string=implode(":",$query)?>
	$('body').load('<?php echo base_url();?>index.php/items/generate_barcodes/<?php echo $string."');";
		
		//echo "window.location.reload();";
		 }
	else {
	//echo ("return (window.location.href='".base_url()."index.php/receivings/';)");
    //echo ("return false;");?>
	$(".row").html("<h1>Job Done</h1>");<?php
	}
	 ?>
		
	
}
$(document).ready(function(){
	<?php if (sizeof($query)>=0)
		echo "printdoc2();";?>
});

</script>

