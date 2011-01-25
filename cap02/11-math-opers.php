<?php
/**
 * 		variabile
 * r - raza cercului
 * a - lungimea laturii patratului
 * m, n - lungimea si latimea dreptunghiului
 * 		output:
 * Aria unui cerc de raza r=10 este 314.15<br>
 * Diametrul sau este 20<br>
 * Dreptunghiul cu laturile 7 12 are perimetrul 38
 */

$r = 10;
$pi = 3.1415;
$a = $pi;
$m = 7;
$n = 12;

//------- calcule
$c_area = $pi * $r * $r;
$r_area = $m * $n;
$r_perim = 2 * ($m + $n);

//------- afisare
echo 'Aria unui cerc de raza r=',$r,' este ',$c_area, '<br>';
echo 'Diametrul sau este ', $r * 2, '<br>';
echo 'Dreptunghiul cu laturile ',$m,' ',$n,' are perimetrul ', $r_perim;