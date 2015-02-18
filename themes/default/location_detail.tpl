<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<table class="list">
		<tr>
			<td><?php echo $this->lang->label_location_name; ?>:</td>
			<td><input class="required" type="text" name="req_name" value="<?php if (isset($_GET['id'])) echo $this->location['name']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->lang->label_location_address; ?>:</td>
			<td><input class="required" type="text" name="req_address" value="<?php if (isset($_GET['id'])) echo $this->location['address']; ?>" /></td>
		</tr>
				<tr>
			<td><?php echo $this->lang->label_location_zip; ?>:</td>
			<td><input class="required" type="text" name="req_postcode" value="<?php if (isset($_GET['id'])) echo $this->location['postcode']; ?>" /></td>
		</tr>
				<tr>
			<td><?php echo $this->lang->label_location_city; ?>:</td>
			<td><input class="required" type="text" name="req_plaats" value="<?php if (isset($_GET['id'])) echo $this->location['plaats']; ?>" /></td>
		</tr>
				<tr>
			<td><?php echo $this->lang->label_location_country; ?>:</td>
			<td><input class="required" type="text" name="req_land" value="<?php if (isset($_GET['id'])) echo $this->location['land']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->lang->label_location_rate; ?>:</td>
			<td><input class="required" type="text" name="reqnum_rate" value="<?php if (isset($_GET['id'])) echo $this->location['rate']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->lang->label_location_capacity; ?>:</td>
			<td><input class="required" type="text" name="reqnum_capacity" value="<?php if (isset($_GET['id'])) echo $this->location['capacity']; ?>" /></td>
		</tr>
		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="<?php echo $this->lang->label_location_submit; ?>" /></td></tr>
	</table>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('input[name^="req"]').each(function(){
			$(this).after('<span>*</span>');
		});
	});
	
	function validate(){

		error = false;
		
		$('input[name^="req"]').each(function(){
			$(this).parent().find('span').html('*');
			
			if($(this).val() == ''){
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append('   <?php echo $this->lang->label_location_required_field; ?>');
				error = true;
			}
		});
		
		$('input[name^="reqnum"]').each(function(){
			if(isNaN($(this).val())){
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append('   <?php echo $this->lang->label_location_numeric_field; ?>');
				error = true;
			}
		});

		if(!error){
			$('form').submit();
		}
	}
</script>