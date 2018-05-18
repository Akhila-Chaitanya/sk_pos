<?php $this->load->view("partial/header"); ?>

<script type="text/javascript">
	dialog_support.init("a.modal-dlg");
</script>

<h3 class="text-center"><?php echo ("Welcome to SAI KRUPA SUPER MARKET");
//echo $this->lang->line('common_welcome_message'); 
?></h3>
<center>
<div id="home_module_list" >
	<?php
	$x=0;
	foreach($allowed_modules->result() as $module)
	{ $x++;
	?>
		<div class="module_item" title="<?php echo $this->lang->line('module_'.$module->module_id.'_desc');?>">
			<a href="<?php echo site_url("$module->module_id");?>"><img src="<?php echo base_url().'images/menubar/'.$module->module_id.'.png';?>" border="0" alt="Menubar Image" /></a>
			<a href="<?php echo site_url("$module->module_id");?>"><?php echo $this->lang->line("module_".$module->module_id) ?></a>
		</div>
	<?php
	if($x==7)
	{
		echo ("<br><br>");
		$x=0;
	}
	}
	?>
</div>

<?php $this->load->view("partial/footer"); ?>

