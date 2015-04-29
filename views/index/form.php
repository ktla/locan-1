<h1><?php echo $page_title; ?></h1>
<form action="<?php echo url(); ?>" method="POST">
	<input style="width: 50px;" type="text" name="var1" />
	<div style="display: inline-block;">
		<input type="radio" checked="checked" name="operation" value="add" />+
		<input type="radio" name="operation" value="sub" />-
	</div>
	<input style="width: 50px;" type="text" name="var2" />
	<input type="submit" name="submit" value="=" />
</form>