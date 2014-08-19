<?php
$image = imagecreatetruecolor(200,100);
		
		//设置背景颜色
		$bgcolor = imagecolorallocate($image,0,0,0);
		
		//设置字体颜色
		$textcolor = imagecolorallocate($image,255,255,255);
		
		//把字符串写在图像左上角
		imagestring($image,20,15,10,"Hello world123!",$textcolor);
		
		//输出图像
		header("Content-type: image/jpeg");
		imagejpeg($image);
		
?>