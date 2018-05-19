		</div>
	</div>

	<div style="bottom-margin:30px; text-align:center; font-size:11px;">
		<div>
			An OSPOS customization by Akhila Chaitanya under MIT Open Licence<br>
		<?php include("lastsync.php");?><br><br><br><br>
		</div>
		
		<div class="topbar">
			<div class="container">
				<div class="navbar-left">
					<div id="liveclock"><?php echo date($this->config->item('dateformat') . ' ' . $this->config->item('timeformat')) ?></div>
				</div>

				<div class="navbar-right" style="margin:0">
					<?php echo anchor('employees/change_password/'.$user_info->person_id, $user_info->first_name . ' ' . $user_info->last_name, array('class' => 'modal-dlg', 'data-btn-submit' => 'Submit', 'title' => $this->lang->line('employees_change_password'))); ?>
					<?php echo '  |  ' . ($this->input->get('debug') == 'true' ? $this->session->userdata('session_sha1') . '  |  ' : ''); ?>
					<?php echo anchor('home/logout', $this->lang->line('common_logout')); ?>
				</div>
 
			</div>
			<?php //$this->load->helper("vayes_helper"); ?>
			<?//=vdebug($overall_summary_data);?>
			
			</div>
			</div>
	
</body>
</html>
