<?php
/**
 *  extention.func.php 用户自定义函数库
 *
 * @copyright			(C) 2005-2010 PHPCMS
 * @license				http://www.phpcms.cn/license/
 * @lastmodify			2010-10-27
 */
 
/**
 * cban专用分页函数
 *
 * @param $num 信息总数
 * @param $curr_page 当前分页
 * @param $perpage 每页显示数
 * @param $urlrule URL规则
 * @param $array 需要传递的数组，用于增加额外的方法
 * @return 分页
 */
function cban_pages($num, $curr_page, $perpage = 20, $urlrule = '', $array = array(),$setpages = 10) {
	if(defined('URLRULE') && $urlrule == '') {
		$urlrule = URLRULE;
		$array = $GLOBALS['URL_ARRAY'];
	} elseif($urlrule == '') {
		$urlrule = url_par('page={$page}');
	}
	$multipage = '';
	/*只有一页也显示第一页页号*/
	if($num <= $perpage && $num!=0) {
		$multipage = '<li  class="event">1</li>';
	}
	if($num > $perpage) {
		$page = $setpages+1;
		$offset = ceil($setpages/2-1);
		$pages = ceil($num / $perpage);
		if (defined('IN_ADMIN') && !defined('PAGES')) define('PAGES', $pages);
		$from = $curr_page - $offset;
		$to = $curr_page + $offset;
		$more = 0;
		if($page >= $pages) {
			$from = 2;
			$to = $pages-1;
		} else {
			if($from <= 1) {
				$to = $page-1;
				$from = 2;
			}  elseif($to >= $pages) {
				$from = $pages-($page-2);
				$to = $pages-1;
			}
			$more = 1;
		}
// 		$multipage .= '<a class="a1">共'.$num.'条</a>';
		if($curr_page>0) {
			$multipage .= ' <li><a href="'.pageurl($urlrule, $curr_page-1, $array).'">上一页</a></li>';
			if($curr_page==1) {
				$multipage .= ' <li class="event">1</li>';
			} elseif($curr_page>6 && $more) {
				$multipage .= ' <li><a href="'.pageurl($urlrule, 1, $array).'">1</a>..</li>';
			} else {
				$multipage .= ' <li><a href="'.pageurl($urlrule, 1, $array).'">1</a></li>';
			}
		}
		for($i = $from; $i <= $to; $i++) {
			if($i != $curr_page) {
				$multipage .= ' <li><a href="'.pageurl($urlrule, $i, $array).'">'.$i.'</a></li>';
			} else {
				$multipage .= ' <li class="event">'.$i.'</li>';
			}
		}
		if($curr_page<$pages) {
			if($curr_page<$pages-5 && $more) {
				$multipage .= ' ..<a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a> <a href="'.pageurl($urlrule, $curr_page+1, $array).'" >下一页</a>';
			} else {
				$multipage .= ' <li><a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a></li> <li><a href="'.pageurl($urlrule, $curr_page+1, $array).'">下一页</a></li>';
			}
		} elseif($curr_page==$pages) {
			$multipage .= ' <li class="event">'.$pages.'</li> <li><a href="'.pageurl($urlrule, $curr_page, $array).'">下一页</a></li>';
		} else {
			$multipage .= ' <li class="event"><a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a></li> <li><a href="'.pageurl($urlrule, $curr_page+1, $array).'">下一页</a></li>';
		}
	}
	
	return $multipage;
}

/**
 * 获取cban自定义的数据库连接
 * @param unknown $table_name 表名
 * @return 数据库连接
 */
function get_cbandb($table_name){
	$cbandb = pc_base::load_model('cban_model');
	$cbandb->table_name = $table_name;
	return $cbandb;
}


/**
 * 通过用户id获得用户模型id
 * @param unknown $userid 用户id
 */
function get_modelid($userid){
	$thisdb = pc_base::load_model('member_model');
	$arr = $thisdb->get_one('userid='.$userid,'modelid');
	return $arr[modelid];
}

/**
 * 通过模型id获得模型名称
 * @param unknown $modelid 模型id
 */
function get_modelname($modelid){
	$thisdb = pc_base::load_model('member_model_model');
	$arr = $thisdb->get_one('modelid='.$modelid,'name');
	return $arr[name];
}


/**
 * 把数组用or拼接成where条件
 * @param unknown $arr 数组
 * @param unknown $field 字段
 * @return string 返回的字符串
 */
function sql_where_or($arr,$field){
	$where = '';
	foreach ($arr as $v) {
		$where .= $where ? " or `$field` = '$v' " : " `$field` = '$v'";
	}
	return $where;
}


/**
 * 把两个一位数组合并成一个二维数组
 * @param unknown $arr1
 * @param unknown $arr2
 * @return 返回处理后的数组
 */
function merger_array($arr1,$arr2){
	$arr = array();
	foreach ($arr1 as $k=>$v){
		$arr[$k][0] = $v;
		if(!$arr2[$k])$arr[$k][1]="";
		$arr[$k][1] = $arr2[$k];

	}
	return $arr;
}

/**
 * 处理数组，每个数组元素如下：
 * http://127.0.0.1:8080/cban/uploadfile/2014/0617/20140617100425486.png
 * 处理后：2014/0617/20140617100425486.png
 * @param unknown $arr
 */
function get_imglist_filepath($arr){
	$upload_url = pc_base::load_config('system','upload_url');
	foreach ($arr as $k=>$v){
		$array =array();
		$array = explode($upload_url,$v);
		$arr[$k] = $array[1];
	}
	return $arr;
}

/**
 * 
 * @param unknown $string 含有图片的字符串
 * @return unknown 数组返回所有图片地址
 */
function preg_img_src($string){
	
	$reg = "/<[img|IMG].*?src=[\'|\"](.*?)[\'|\"].*?[\/]?>/";
	preg_match_all($reg,$string,$src_list);
	return $src_list[1];
}

/**
 *
 * @param unknown $string 含有http的字符串
 * @return unknown 数组返回所有图片地址
 */
function get_pinpai_url($string){
	
	$arr = string2array($string);
	foreach ($arr as $k=>$v){
		$src_list[$k]=$v[url];
	}
	return $src_list;
}

/**
 * 修改内容中，所有附件的状态为未使用
 * @param unknown $content
 * 
 */
function update_attachments($string){
	if(is_array($string)) $src_list = $string;
	else $src_list = preg_img_src($string);
	$attachmentdb = pc_base::load_model('attachment_model');
	$attachmentdb->update('status=0', sql_where_or(get_imglist_filepath($src_list),'filepath'));
}

function supply_preview_img($arr){
	$arr = string2array($arr); 
	$string = '';
	foreach($arr as $k){
		$string .= '
				<a href="javascript:preview(\''.$k['0'].'\')">
				<img src="'.IMG_PATH.'icon/small_img.gif" title="'.$k[1].'" /></a>';
	}
	return $string;
}

/**
 * 
 * @param unknown $catid 栏目id
 * @param unknown $username 用户名
 * 返回文章id
 */
function get_content_id($catid,$username){
	if($catid=='9'){
		$thisdb = get_cbandb('cban_news_md');
	}else if($catid=='10'){
		$thisdb = get_cbandb('cban_news_qy');
	}
	$arr = $thisdb->get_one('username=\''.$username.'\'','id','updatetime desc');
	return $arr['id'];
}

/**
 * 
 * @param unknown $modelid 模型id
 * @param unknown $username 用户名
 * @return 状态字符串
 */
function get_content_status($modelid,$username){
// 	var_dump($modelid=='13');
	if($modelid=='12'){
		$thisdb = get_cbandb('cban_news_md');
	}else if($modelid=='13'){
		$thisdb = get_cbandb('cban_news_qy');
	}else{
		
		showmessage('参数错误');
	}
	
	
	$arr = $thisdb->get_one('username=\''.$username.'\'','status');
	if(!$arr) {
		return "(未发布)";
	}else{
		if($arr['status']=='99') return "(审核通过)";
		else if($arr['status']=='0') return "(审核失败)";
		else return "(审核中)";
	}
	return "(未发布)";
}
?>