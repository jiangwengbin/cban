<?php
$image = imagecreatetruecolor(200,100);
		
		//���ñ�����ɫ
		$bgcolor = imagecolorallocate($image,0,0,0);
		
		//����������ɫ
		$textcolor = imagecolorallocate($image,255,255,255);
		
		//���ַ���д��ͼ�����Ͻ�
		imagestring($image,20,15,10,"Hello world123!",$textcolor);
		
		//���ͼ��
		header("Content-type: image/jpeg");
		imagejpeg($image);
		
?>