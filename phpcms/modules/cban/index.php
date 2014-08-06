<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','cban');
class index {

	//百县千店页面
	public function qxwd() {

		if(isset($_GET['siteid'])) {
			$siteid = intval($_GET['siteid']);
		} else {
			$siteid = 1;
		}
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		$_userid = $this->_userid;
		$_username = $this->_username;
		$_groupid = $this->_groupid;
		//SEO
		$SEO = seo($siteid);

 		$thisdb = get_cbandb('cban_news_md');
// 		$count = $this->db->count('userid');

		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1','keyid'=>'1'),'linkageid,name','');

		if($_GET['id'])
		{

			$city_date = $db_linkage -> select(array('parentid'=>$_GET['id']),'linkageid,name');

			$where = '';
			foreach ($city_date as $val) {
				$where .= $where ? " or `diqu` = '$val[linkageid]' " : " `diqu` = '$val[linkageid]'";
			}

			$mendian = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;

			foreach ($mendian as $key => $val) {

				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];

			}
		}
// 		$CATEGORYS = getcache('category_content_'.$siteid,'commons');
// 		print_r($CATEGORYS);
		include template('content','qxwd');
	}

	/*门店搜索*/
	public function serMendian() {

		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1','keyid'=>'1'),'linkageid,name','');

		$where = "";

		/*只有省份*/
		if($_POST['L_1-1'] && !$_POST['L_1-2'])
		{
			$city_date = $db_linkage -> select(array('parentid'=>$_POST['L_1-1']),'linkageid,name');

			foreach ($city_date as $val) {
				$where .= $where ? " or `diqu` = '$val[linkageid]' " : " `diqu` = '$val[linkageid]'";
			}

			//print_r($mendian);
		}
		if($_POST['L_1-2'])
		{
			$where .= $where ? " or `diqu` = '".$_POST['L_1-2']."'" : " `diqu` = '".$_POST['L_1-2']."'";

		}
		if($_POST['type']){$where .= " and service=".$_POST['type'];}

		if($where!="")
		{

			$thisdb = get_cbandb('cban_news_md');

			$mendian = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;

			foreach ($mendian as $key => $val) {

				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];

			}

		}
		include template('content','qxwd');
	}
	
	
	public function jdmq(){
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		$qyid = addslashes($_GET['qyid']);
		if($qyid){
			$thisdb = get_cbandb('cban_news_qy');
			$qy = $thisdb->get_one('id='.$qyid);
			if(!$qy)showmessage('参数错误！',HTTP_REFERER);
			if($qy[status]!=99)showmessage('企业信息暂未发布！',HTTP_REFERER);
			
			$qydatadb = get_cbandb('cban_news_qy_data');
			$pinpai = $qydatadb->get_one('id='.$qyid,"pinpai");
			$pinpai = string2array($pinpai['pinpai']);
			
			//print_r($pinpai);
			
			include template('content','jdmq_show');
		}
		else{
			
			$keywords = addslashes($_GET['keywords']);
			$where = '';
			if($keywords){
				$where .= $where ? ' and cptype like \'%'.$keywords.'%\'' : ' cptype like \'%'.$keywords.'%\'';
			}
			
			$where .= $where ? ' and status=99 ' : ' status=99 ';
	
			$thisdb = get_cbandb('cban_news_qy');
			//status 99通过 1审核中 0退稿
			$qy = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;
			
			include template('content','jdmq');
		}
	}
}
?>