<?php
$arbore = array(
  'hello',
  'foo',
  'world' => array(
	'how',
	'are',
	'you',
	'today?' => array(
	  'march',
	  27,
	  2010
	)
  ),
  'out',
  'there!'
);

function itereaza_recursiv($arbore,$depth=0) {
  $indent = str_repeat('  ',$depth);
  foreach($arbore as $k => $v) {
	if(is_string($v) || is_numeric($v)) {
	  echo "$indent$k => $v";
	  echo PHP_EOL;
	}
	elseif(is_array($v)) {
	  echo "{$indent}going into '$k'\r\n";
	  itereaza_recursiv($v,$depth+1);
	}
  }
}

itereaza_recursiv($arbore);
