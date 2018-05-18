<?php //C:\wamp\www\pos\pos\application\views\sales?>
<div id="receipt_wrapper" style="font-size:<?php echo $this->config->item('receipt_font_size');?>px">
	<div id="receipt_header">
		<?php
		if($this->config->item('company_logo') != '')
		{
		?>
			<div id="company_name">
				<img id="image" src="<?php echo base_url('uploads/' . $this->config->item('company_logo')); ?>" alt="company_logo" />
			</div>
		<?php
		}
		?>

		<?php
		if($this->config->item('receipt_show_company_name'))
		{
		?>
			<div id="company_name"><?php echo $this->config->item('company'); ?></div>
		<?php
		}
		?>

		<div id="company_address"><?php echo nl2br($this->config->item('address')); ?></div>
		<div id="company_phone"><?php echo $this->config->item('phone'); ?></div>
		<div id="sale_receipt"><?php echo $receipt_title; ?></div>
		<div id="sale_time"><?php echo $transaction_time ?></div>
	</div>

	<div id="receipt_general_info">
		<?php
		if(isset($customer))
		{
		?>
			<div id="customer"><?php echo $this->lang->line('customers_customer').": ".$customer; ?></div>
		<?php
		}
		?>

		<div id="sale_id"><?php echo $this->lang->line('sales_id').": ".$sale_id; ?></div>

		<?php
		if(!empty($invoice_number))
		{
		?>
			<div id="invoice_number"><?php echo $this->lang->line('sales_invoice_number').": ".$invoice_number; ?></div>
		<?php
		}
		?>

		<div id="employee"><?php echo $this->lang->line('employees_employee').": ".$employee; ?></div>
	</div>

	<table id="receipt_items">
		<tr style="border-top: solid 2px; border-bottom: solid 2px">
			<th style="width:5%;"><?php echo "S.No" ?></th>
			<th style="width:35%;"><?php echo "Item Name"; ?></th>
			<th style="width:10%;"><?php echo $this->lang->line('sales_quantity'); ?></th>
			<th style="width:15%;"><?php echo"MRP"; ?>
			<th style="width:15%"><?php echo "Special<br>Price";?>
			<th style="text-align:right; width:20%" class="total-value"><?php echo "Amount";?></th>
		</tr>
		<?php
		$sno=0;
		$total_qty=0;
		$total_mrp=0;
		$total_profit=0;
		foreach($cart as $line=>$item)
		{
			$total_qty=$total_qty+$item['quantity'];
			$total_mrp=$total_mrp+($item['MRP']*$item['quantity']);
			$total_profit=$total_profit+$item['profit'];
		?>
			<tr>
			    <td><?php $sno++;
				echo $sno;
				?></td>
				<td><?php echo ucfirst($item['name']); ?></td>
				<td><?php echo to_quantity_decimals($item['quantity']); ?></td>
				<td><?php echo (to_currency($item['MRP'])); ?></td>
				<td><?php
				if($item['discount'] > 0)
				{
				echo to_currency($item['discounted_total']/$item['quantity']);	
				}
				else
					echo to_currency($item['price']);
				?></td>
				<td class="total-value"><?php  
				if($item['discount'] > 0)
				{
					echo(to_currency($item['discounted_total']));
					
				}
				else
					echo(to_currency($item['total']));
				
				?></td>
			</tr>
			<tr>
				<?php
				if($this->config->item('receipt_show_description'))
				{
				?>
					<td colspan="2"><?php echo $item['description']; ?></td>
				<?php
				}
				?>
				<?php
				if($this->config->item('receipt_show_serialnumber'))
				{
				?>
					<td><?php echo $item['serialnumber']; ?></td>
				<?php
				}
				?>
			</tr>
			
		<?php
		}
		?>

		
			<tr style='border-top:2px solid #000000;'>
				<td colspan="3" style='text-align:left;'><?php echo "Total Items: ".$sno; ?></td>
				<td colspan="3"style='text-align:right;border-top:2px solid #000000;'><?php echo "Total: ".to_currency($total); ?></td>
			</tr>
			<tr style='border-bottom:2px solid #000000;'>
				<td colspan="3" style='text-align:left; border-bottom:2px solid #000000;'><?php echo "Total Qty: ".$total_qty; ?></td>
				<td colspan="3"style='text-align:right; border-bottom:2px solid #000000;'><?php echo "Total Discount: ".to_currency($total_mrp-$total); ?></td>
			</tr>
				

		<?php $border = (!$this->config->item('receipt_show_taxes') && !($this->config->item('receipt_show_total_discount') && $discount > 0)); ?>
		<tr style='border-top:2px solid #000000;'>
			<td colspan="3" style="text-align:right;<?php echo $border? 'border-top: 2px solid black;' :''; ?>"> <h3>Net Amount:</h3> </td>
			<td style="text-align:right;<?php //echo $border? 'border-top: 2px solid black;' :''; ?>"><h3><?php echo to_currency($total); ?></h3></td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:right;<?php //echo $border? 'border-top: 2px solid black;' :''; ?>"> <h3>Your Savings:</h3> </td>
			<td style="text-align:right;<?php //echo $border? 'border-top: 2px solid black;' :''; ?>"><h3><?php echo to_currency($total_mrp-$total); ?></h3></td>
		</tr>


		<tr style="border-bottom: 2px solid">
			<td colspan="6">&nbsp;</td>
		</tr>

		<?php
		$only_sale_check = FALSE;
		$show_giftcard_remainder = FALSE;
		foreach($payments as $payment_id=>$payment)
		{
			$only_sale_check |= $payment['payment_type'] == $this->lang->line('sales_check');
			$splitpayment = explode(':', $payment['payment_type']);
			$show_giftcard_remainder |= $splitpayment[0] == $this->lang->line('sales_giftcard');
		?>
			<tr>
				<td colspan="5" style="text-align:right;"><?php echo $splitpayment[0]; ?> </td>
				<td class="total-value"><?php echo to_currency( $payment['payment_amount'] ); ?></td>
			</tr>
		<?php
		}
		?>

		

		<?php
		if(isset($cur_giftcard_value) && $show_giftcard_remainder)
		{
		?>
		<tr>
			<td colspan="5" style="text-align:right;"><?php echo $this->lang->line('sales_giftcard_balance'); ?></td>
			<td class="total-value"><?php echo to_currency($cur_giftcard_value); ?></td>
		</tr>
		<?php
		}
		?>
		<tr>
			<td colspan="5" style="text-align:right;"> <?php echo "Balance: ";//echo $this->lang->line($amount_change >= 0 ? ($only_sale_check ? 'sales_check_balance' : 'sales_change_due') : 'sales_amount_due') ; ?> </td>
			<td class="total-value"><?php echo to_currency($amount_change); ?></td>
		</tr>
		<?php
		if(isset($customer)){
			?>
			<tr>
			<td colspan="5" style="text-align:right;"> <?php echo "Points Earned: </td><td class='total-value'>".round(($total_profit*$customer_rewards['percent']/100),0);//echo $this->lang->line($amount_change >= 0 ? ($only_sale_check ? 'sales_check_balance' : 'sales_change_due') : 'sales_amount_due') ; ?> </td>
			</tr>
			<tr>
			<td colspan="5" style="text-align:right;"> <?php echo "Total Points: </td><td class='total-value'>".$customer_rewards['points'];//echo $this->lang->line($amount_change >= 0 ? ($only_sale_check ? 'sales_check_balance' : 'sales_change_due') : 'sales_amount_due') ; ?> </td>
			</tr>
		<?php } ?>
	</table>

	<div id="sale_return_policy">
		<?php echo nl2br($this->config->item('return_policy')); ?>
	</div>

	<div id="barcode">
		<img src='data:image/png;base64,<?php echo $barcode; ?>' /><br>
		<?php echo $sale_id; ?>
	</div>
</div>
