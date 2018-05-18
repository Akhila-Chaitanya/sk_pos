<?php $this->load->view("partial/header"); ?>






<?php $this->load->view('partial/print_receipt', array('print_after_sale'=>$print_after_sale, 'selected_printer'=>'receipt_printer')); ?>

<div class="print_hide" id="control_buttons" style="text-align:right">
	<a href="javascript:printdoc();"><div class="btn btn-info btn-sm", id="show_print_button"><?php echo '<span class="glyphicon glyphicon-print">&nbsp</span>' . $this->lang->line('common_print'); ?></div></a>
	<?php /* this line will allow to print and go back to sales automatically.... echo anchor("sales", '<span class="glyphicon glyphicon-print">&nbsp</span>' . $this->lang->line('common_print'), array('class'=>'btn btn-info btn-sm', 'id'=>'show_print_button', 'onclick'=>'window.print();')); */ ?>
	<?php echo anchor("items", '<span class="glyphicon glyphicon-tag">&nbsp</span>' . "Items", array('class'=>'btn btn-info btn-sm', 'id'=>'show_sales_button')); ?>
	
</div>

<?php $this->load->view("barcodes/barcode_sheet"); ?>
<?php //echo ("<center> Thank You For Shopping With US<br> Please Visit Again </center>"); 
//$this->load->view("partial/footer"); ?>


