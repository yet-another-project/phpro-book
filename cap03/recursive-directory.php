<?php
function display_directory($dirpath) {
	$dh = opendir($dirpath);
	while($entry = readdir($dh)) {
		echo $entry;
		if(is_dir($dirpath.DIRECTORY_SEPARATOR.$entry)) {
			echo DIRECTORY_SEPARATOR;
		}
		echo PHP_EOL;
	}
	closedir($dh);
}

display_directory(getcwd());
