<?php $this->load->view("partial/header"); ?>

<?php
if (isset($error_message))
{
	echo "<div class='alert alert-dismissible alert-danger'>".$error_message."</div>";
	exit;
}
?>

<?php $this->load->view('partial/print_receipt', array('print_after_sale', $print_after_sale, 'selected_printer'=>'receipt_printer')); ?>

<div class="print_hide" id="control_buttons" style="text-align:right">
	<a href="javascript:printdoc();"><div class="btn btn-info btn-sm", id="show_print_button"><?php echo '<span class="glyphicon glyphicon-print">&nbsp</span>' . $this->lang->line('common_print'); ?></div></a>
	<?php echo anchor("receivings", '<span class="glyphicon glyphicon-save">&nbsp</span>' . $this->lang->line('receivings_register'), array('class'=>'btn btn-info btn-sm', 'id'=>'show_sales_button')); ?>
</div>

<div id="receipt_wrapper">
	<div id="receipt_header">
		<?php
		if ($this->config->item('company_logo') != '') 
		{ 
		?>
			<div id="company_name"><img id="image" src="<?php echo base_url('uploads/' . $this->config->item('company_logo')); ?>" alt="company_logo" /></div>
		<?php
		}
		?>

		<?php
		if ($this->config->item('receipt_show_company_name')) 
		{ 
		?>
			<div id="company_name"><?php echo $this->config->item('company'); ?></div>
		<?php
		}
		?>

		<div id="company_address"><?php echo nl2br($this->config->item('address')); ?></div>
		<div id="company_phone"><?php echo $this->config->item('phone'); ?></div>
		<div id="sale_receipt"><?php echo $receipt_title; 
		if ($mode=='requisition') echo" (Requisition)";?></div>
		<div id="sale_time"><?php echo $transaction_time ?></div>
	</div>

	<div id="receipt_general_info">
		<?php
		if(isset($supplier))
		{
		?>
			<div id="customer"><?php echo $this->lang->line('suppliers_supplier').": ".$supplier; ?></div>
		<?php
		}
		?>
		<div id="sale_id"><?php echo $this->lang->line('receivings_id').": ".$receiving_id; ?></div>
		<?php 
		if (!empty($reference))
		{
		?>
			<div id="reference"><?php echo $this->lang->line('receivings_reference').": ".$reference; ?></div>	
		<?php 
		}
		?>
		<div id="employee"><?php echo $this->lang->line('employees_employee').": ".$employee; ?></div>
	</div>

	<table id="receipt_items">
		<tr style="border-top:2px solid #000000; border-bottom:2px solid #000000; ">
			<th style="width:5%"><?php echo "SI No"?></th>
			<th style="width:35%;"><?php echo $this->lang->line('items_item'); ?></th>
			<th style="width:15%;"><?php echo $this->lang->line('sales_quantity'); ?></th>
			<th style="width:10%;">Cost</th>
			<th style="width:15%;">Total Cost</th>
			<th style="width:10%;">Value</th>
			<th style="width:15%;text-align:right">Total<br> Value</th>
			
			
		</tr>

		<?php
		$lineno=1;
		$lineno2=0;
		$total_value=0;
		$total_cost=0;
		$qty=0;
		foreach(array_reverse($cart, TRUE) as $line=>$item)
		{
			if(($mode=='requisition'||($receipt=='yes'))&&$item['quantity']<0)
			{$lineno++;	
			continue;}
			$lineno2++;
			$total_value=$total_value+$item['total_sale_price'];
			$qty=$qty+$item['quantity'];
			$total_cost=$total_cost+($item['price']*$item['quantity']);
				
				
		?>
			<tr>
				<td><?php echo $lineno2;?></td>
				<td><?php echo $item['name']; ?></td>
				<td><?php echo to_quantity_decimals($item['quantity']) . " " . ($show_stock_locations ? " [" . $item['stock_name'] . "]" : ""); 
				?>&nbsp;&nbsp;&nbsp;x <?php echo $item['receiving_quantity'] != 0 ? to_quantity_decimals($item['receiving_quantity']) : 1; ?></td>
				
				<td><?php echo to_currency($item['price']); ?></td>
				<td><?php echo to_currency($item['total']*$item['receiving_quantity']); ?></td>
				<td><?php echo to_currency($item['sale_price']);?></td>
				<td><div class="total-value"><?php echo to_currency($item['total_sale_price']);?></div></td>
			</tr>
			<tr>
				<td ><?php echo $item['serialnumber']; ?></td>
			</tr>
			<?php
			if ($item['discount'] > 0 )
			{
			?>
				<tr>
					<td colspan="3" style="font-weight: bold;"> <?php echo number_format($item['discount'], 0) . " " . $this->lang->line("sales_discount_included")?> </td>
				</tr>
			<?php
			}
			?>
		<?php
		}
		?>	
		
		
			<tr style='border-top:2px solid #000000;  border-bottom:2px solid #000000;'>
			<td colspan="2"><?php echo"Total Items: ".$lineno2.";  Total Qty: ".$qty;?></td>
			<td colspan="2" style="text-align:right"><?php echo"Total Cost: "?></td>
			<td><?php echo to_currency($total_cost);?></td>
			<td colspan="1" style='text-align:right;border-top:2px solid #000000;'>Total Value</td>
			<td><div class="total-value"><?php echo to_currency($total_value); ?></div></td>
		   </tr>
		   <?php 
		if($mode!='requisition')
		{
		?>
			<tr>
				<td colspan="6" style='text-align:right;'><?php echo $this->lang->line('sales_payment'); ?></td>
				<td><div class="total-value"><?php echo $payment_type; ?></div></td>
			</tr>

			<?php if(isset($amount_change))
			{
			?>
				<tr>
					<td colspan="6" style='text-align:right;'><?php echo $this->lang->line('sales_amount_tendered'); ?></td>
					<td><div class="total-value"><?php echo to_currency($amount_tendered); ?></div></td>
				</tr>

				<tr>
					<td colspan="6" style='text-align:right;'><?php echo $this->lang->line('sales_change_due'); ?></td>
					<td><div class="total-value"><?php echo $amount_change; ?></div></td>
				</tr>
			<?php
			}
			?>
			
		<?php 
		}
		
			?>
		</table>	<center>
			<?php echo "<h5>Purchase Cost:"; ?>
			<?php echo to_currency($total_cost)." &nbsp &nbsp &nbsp &nbsp";?>
			<?php echo "Sale Cost:"; ?>
			<?php echo to_currency($total_value)."</h5> &nbsp &nbsp &nbsp &nbsp";?>
			<table style='width:100%'>
			<tr style='border-bottom:2px solid #000000; width:100%'>
			<td colspan="6" style='text-align:right;'><?php echo "Signature of Reciever:"; ?></td>
			</tr>
	
		
	</table>

	<div id="sale_return_policy">
		<?php //echo nl2br($this->config->item('return_policy')); ?>
	</div>

	<div id='barcode'>
		<img src='data:image/png;base64,<?php echo $barcode; ?>' /><br>
		<?php echo $receiving_id; ?>
	</div>
</div>

<?php $receipt=="no";//$this->load->view("partial/footer"); ?>
