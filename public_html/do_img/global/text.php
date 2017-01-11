<?php
$size = $_GET['s']; //Tamaño de la letra
$inclinacion = "0"; // Inclinacion del texto
$x = 0; // Mover texto a la derecha o izquierda
$y = $size; // Mover texto arriba o abajo
$text = $_GET['t'];
$px = strlen(".$text.")*$size;
$px2 = ($px)/2;

$im = @imagecreate($px, $size)//$im = @imagecreate(($px-$px2)+120, $size+7)
    or die("Error!");
// Ponemos el fondo transparente 

$transparente = imagecolorallocatealpha($im, 0, 0, 0, 127);//$transparente = imagecolorallocate($im, 255, 255, 255);
imagecolortransparent($im, $transparente);

//Titulos de naves
switch($_GET['t']) 
{
	case 'ship_20_name':
		$text = 'UFO';
		break;
	case 'ship_20_short':
		$text = 'ADMIN SHIP';
		break;
	case 'ship_10_name':
	case 'ship_52_name':
	case 'ship_53_name':
	case 'ship_54_name':
	case 'ship_55_name':
	case 'ship_56_name':
	case 'ship_57_name':
	case 'ship_59_name':
	case 'ship_61_name':
	case 'ship_62_name':
	case 'ship_63_name':
	case 'ship_64_name':
	case 'ship_65_name':
	case 'ship_66_name':
	case 'ship_67_name':
	case 'ship_68_name':
	case 'ship_86_name':
	case 'ship_87_name':
	case 'ship_88_name':
	case 'ship_109_name':
	case 'ship_110_name':
		$text = 'GOLIATH';
		break;
	case 'ship_10_short':
	case 'ship_52_short':
	case 'ship_53_short':
	case 'ship_54_short':
	case 'ship_55_short':
	case 'ship_56_short':
	case 'ship_57_short':
	case 'ship_59_short':
	case 'ship_61_short':
	case 'ship_62_short':
	case 'ship_63_short':
	case 'ship_64_short':
	case 'ship_65_short':
	case 'ship_66_short':
	case 'ship_67_short':
	case 'ship_68_short':
	case 'ship_86_short':
	case 'ship_87_short':
	case 'ship_88_short':
	case 'ship_109_short':
	case 'ship_110_short':
		$text = 'BATTLE CRUISER';
		break;
	case 'ship_98_name':
		$text = 'SHIP ADMIN';
		break;
	case 'ship_98_short':
		$text = 'SUPER SHIP';
		break;
	case 'ship_9_name':
		$text = 'BIGBOY';
		break;
	case 'ship_9_short':
		$text = 'BATTLE CRUISER';
		break;
	case 'ship_16_name':
	case 'ship_17_name':
	case 'ship_18_name':
	case 'ship_58_name':
	case 'ship_60_name':
	case 'ship_8_name':
		$text = 'VENGEANCE';
		break;
	case 'ship_16_short':
	case 'ship_17_short':
	case 'ship_18_short':
	case 'ship_58_short':
	case 'ship_60_short':
	case 'ship_8_short':
		$text = 'STARFIGHTER';
		break;
	case 'ship_7_name':
		$text = 'NOSTROMO';
		break;
	case 'ship_7_short':
		$text = 'STARFIGHTER';
		break;
	case 'ship_6_name':
		$text = 'PIRANHA';
		break;
	case 'ship_6_short':
		$text = 'STARFIGHTER';
		break;
	case 'ship_5_name':
		$text = 'LIBERATOR';
		break;
	case 'ship_5_short':
		$text = 'STARFIGHTER';
		break;
	case 'ship_4_name':
		$text = 'DEFCOM';
		break;
	case 'ship_4_short':
		$text = 'STARFIGHTER';
		break;
	case 'ship_3_name':
		$text = 'LEONOV';
		break;
	case 'ship_3_short':
		$text = 'STARJET';
		break;
	case 'ship_2_name':
		$text = 'YAMATO';
		break;
	case 'ship_2_short':
		$text = 'STARJET';
		break;
	case 'ship_1_name':
		$text = 'PHOENIX';
		break;
	case 'ship_1_short':
		$text = 'STARJET';
		break;
	default:
		$text = $_GET['t'];
		break;
}

// Lista de fuentes para el texto:
switch($_GET['f']) {
    case 'ship_title':
		$fuente = 'fonts/EurostileTHea.ttf'; // Fuente para el texto
		break;
	case 'ship_name':
		$fuente = 'fonts/EurostileTHeaCon.ttf';
		break;
	default:
		$fuente = 'fonts/EurostileT.ttf';
		break;
	}

// Lista de colores disponibles:
switch($_GET['uc']) {
    case 1:
		//Blanco
		$text_color = imagecolorallocate($im, 255, 255, 255);
		break;
	default:
	//Negro por defecto
		$text_color = imagecolorallocate($im, 0, 0, 0);
		break;
	}

imagesavealpha($im, true);
imagettftext($im, $size, $inclinacion, $x, $y, $text_color, $fuente, $text);
header("Content-type: image/png");
header ("Content-Length: " . $size);
imagepng($im);
imagedestroy($im);
?>