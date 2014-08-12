<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','cban');
class index {

	//千县万店页面
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

			$where = "";
 			
			foreach ($city_date as $val) {
				$arr[] = $val[linkageid];
			}
			$where .= $where ? ' or diqu in('.implode(',',$arr).')' : ' diqu in('.implode(',',$arr).')';
			$where .= " and service ='1' ";
			
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
	
	/*门店内容页*/
	function  showmd(){
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		if(trim($_GET['mdid']) && intval($_GET['mdid'])!=0){
			$id = $_GET['mdid'];
			$thisdb = get_cbandb('cban_news_md');
			$a = $thisdb -> get_one('id='.$id);
			$thisdb = get_cbandb('cban_news_md_data');
			$b = $thisdb -> get_one('id='.$id);
			//print_r(array_merge($a,$b));
			extract(array_merge($a,$b));
			include template('content','qxwd_show');
		}
	}
	
	/*门店搜索*/
	public function serMendian() {
		
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		
		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1','keyid'=>'1'),'linkageid,name','');

		$where = "";

		/*只有省份*/
		if($_GET['L_1-1'] && !$_GET['L_1-2'])
		{
			$city_date = $db_linkage -> select(array('parentid'=>$_GET['L_1-1']),'linkageid,name');

			foreach ($city_date as $val) {
				$arr[] = $val[linkageid];
			}
			$where .= $where ? ' or diqu in('.implode(',',$arr).')' : ' diqu in('.implode(',',$arr).')';
			
			//print_r($mendian);
		}
		if($_GET['L_1-2'])
		{
			$where .= $where ? " or `diqu` = '".$_GET['L_1-2']."'" : " `diqu` = '".$_GET['L_1-2']."'";

		}
		
		if(trim($_GET['keywords'])){
			$keywords = addslashes(trim($_GET['keywords']));
			$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
		}
		
		if($where!="")
		{
			$where .= " and service ='1' ";
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
	
	//家电名企
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
			$qydata = $qydatadb->get_one('id='.$qyid,"content,pinpai");
			$pinpai = string2array($qydata['pinpai']);
			$content = $qydata['content'];
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
	
	//展会信息
	public function zhxx(){
		
		$where = '';
		
		if(trim($_GET['keywords'])){
			$keywords = addslashes(trim($_GET['keywords']));
			$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
			$where .= $where ? ' or description like \'%'.$keywords.'%\'' : ' description like \'%'.$keywords.'%\'';
			$where .= $where ? ' or address like \'%'.$keywords.'%\'' : ' address like \'%'.$keywords.'%\'';
			$where .= $where ? ' or cptype like \'%'.$keywords.'%\'' : ' cptype like \'%'.$keywords.'%\'';
		}
		
		
		if(trim($_GET['L_1-1'])){
			
			if(trim($_GET['L_1-2']) && intval($_GET['L_1-2'])!=0){
				
				$where .= $where ? ' and diqu =\''.addslashes(trim($_GET['L_1-2'])).'\'' : ' diqu =\''.addslashes(trim($_GET['L_1-2'])).'\'';
			}else{
				$db_linkage = pc_base::load_model('linkage_model');
				$date_linkage = $db_linkage -> select(array('parentid'=>addslashes(trim($_GET['L_1-1']))),'linkageid');
				//echo implode(',',$date_linkage);
				$arr = array();
				foreach ($date_linkage as $k=>$v){
					$arr[$k] = $v[linkageid];
				}
				$where .= $where ? ' and diqu in ('.implode(',',$arr).')' : ' diqu in ('.implode(',',$arr).')' ;
			}
		}
		//print_r($_GET[info][L_1]);
		$zhxxdb = get_cbandb('cban_news_zhxx');
		$zhxx = $zhxxdb->listinfo($where, 'listorder desc',$_GET['page'], '20');
		$pages = $zhxxdb->pages;
		
		include template('content','list_zhxx_ser');
	}
	
	//商机信息
	public function supply(){
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		$where = 'status=2';
		
		if(trim($_GET['keyword'])){
			$keyword = addslashes(trim($_GET['keyword']));
			$where .= $where ? ' and goods like \'%'.$keyword.'%\'' : ' goods like \'%'.$keyword.'%\'';
		}
		
		if(trim($_GET['keywords'])){
			$keywords = addslashes(trim($_GET['keywords']));
			$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
			$where .= $where ? ' or goods like \'%'.$keywords.'%\'' : ' goods like \'%'.$keywords.'%\'';
			$where .= $where ? ' or description like \'%'.$keywords.'%\'' : ' description like \'%'.$keywords.'%\'';
		}
		
		if(trim($_GET['L_1-1'])){
				
			if(trim($_GET['L_1-2']) && intval($_GET['L_1-2'])!=0){
		
				$where .= $where ? ' and diqu =\''.addslashes(trim($_GET['L_1-2'])).'\'' : ' diqu =\''.addslashes(trim($_GET['L_1-2'])).'\'';
			}else{
				$db_linkage = pc_base::load_model('linkage_model');
				$date_linkage = $db_linkage -> select(array('parentid'=>addslashes(trim($_GET['L_1-1']))),'linkageid');
				//echo implode(',',$date_linkage);
				$arr = array();
				foreach ($date_linkage as $k=>$v){
					$arr[$k] = $v[linkageid];
				}
				$where .= $where ? ' and diqu in ('.implode(',',$arr).')' : ' diqu in ('.implode(',',$arr).')' ;
			}
		}
		
			$thisdb = get_cbandb('cban_supply');
			//status 99通过 1审核中 0退稿
			$supply = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;
			
		include template('content','supply');
	}
	
	//家电维修
	public function jdwx() {
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		
		$thisdb = get_cbandb('cban_news_md');
		// 		$count = $this->db->count('userid');
		
		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1','keyid'=>'1'),'linkageid,name','');
		
		if($_GET['id'])
		{
		
			$city_date = $db_linkage -> select(array('parentid'=>$_GET['id']),'linkageid,name');
		
			$where = "";
			foreach ($city_date as $val) {
				$arr[] = $val[linkageid];
			}
			$where .= $where ? ' or diqu in('.implode(',',$arr).')' : ' diqu in('.implode(',',$arr).')';
			$where .= " and service ='2' ";
		
			$mendian = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;
		
			foreach ($mendian as $key => $val) {
		
				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];
		
			}
		}
		
		//$CATEGORYS = getcache('category_content_'.$siteid,'commons');
		//print_r($CATEGORYS);
		include template('content','jdwx');
	}
	
	public function serJDWX() {
	
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
	
		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1','keyid'=>'1'),'linkageid,name','');
	
		$where = "";
	
		/*只有省份*/
		if($_GET['L_1-1'] && !$_GET['L_1-2'])
		{
			$city_date = $db_linkage -> select(array('parentid'=>$_GET['L_1-1']),'linkageid,name');
	
			foreach ($city_date as $val) {
				$arr[] = $val[linkageid];
			}
			$where .= $where ? ' or diqu in('.implode(',',$arr).')' : ' diqu in('.implode(',',$arr).')';
				
			//print_r($mendian);
		}
		if($_GET['L_1-2'])
		{
			$where .= $where ? " or `diqu` = '".$_GET['L_1-2']."'" : " `diqu` = '".$_GET['L_1-2']."'";
	
		}
	
		if(trim($_GET['keywords'])){
			$keywords = addslashes(trim($_GET['keywords']));
			$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
		}
	
		if($where!="")
		{
			$where .= " and service ='2' ";
			$thisdb = get_cbandb('cban_news_md');
	
			$mendian = $thisdb->cban_listinfo($where, 'id desc',$_GET['page'], '20');
			$pages = $thisdb->pages;
	
			foreach ($mendian as $key => $val) {
	
				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];
	
			}
	
		}
		include template('content','jdwx');
	}
	
	//维修网点内容页
	function  showJDWX(){
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		//SEO
		$SEO = seo($siteid);
		if(trim($_GET['mdid']) && intval($_GET['mdid'])!=0){
			$id = $_GET['mdid'];
			$thisdb = get_cbandb('cban_news_md');
			$a = $thisdb -> get_one('id='.$id);
			$thisdb = get_cbandb('cban_news_md_data');
			$b = $thisdb -> get_one('id='.$id);
			//print_r(array_merge($a,$b));
			extract(array_merge($a,$b));
			include template('content','jdwx_show');
		}
	}
}
?>