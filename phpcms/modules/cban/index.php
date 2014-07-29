<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','cban');
class index {
	private $db;
	function __construct() {
		$this->db = pc_base::load_model('cban_model');
// 		$this->_userid = param::get_cookie('_userid');
// 		$this->_username = param::get_cookie('_username');
// 		$this->_groupid = param::get_cookie('_groupid');
	}

	//百县千店页面
	public function init() {

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

		$this->db->table_name = 'cban_member_mendian';
		$count = $this->db->count('userid');

		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1'),'linkageid,name','');

		if($_GET['id'])
		{

			$city_date = $db_linkage -> select(array('parentid'=>$_GET['id']),'linkageid,name');

			$where = '';
			foreach ($city_date as $val) {
				$where .= $where ? " or `diqu` = '$val[linkageid]' " : " `diqu` = '$val[linkageid]'";
			}

			$mendian = $this->db->cban_listinfo($where, 'userid desc',$_GET['page'], '20');
			$pages = $this->db->pages;

			foreach ($mendian as $key => $val) {

				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];

			}
		}



		include template('content','bai_xian_qian_dian');
	}

	/*门店搜索*/
	public function serMendian() {

		$db_linkage = pc_base::load_model('linkage_model');
		$date_linkage = $db_linkage -> select(array('parentid'=>'0','child'=>'1'),'linkageid,name','');

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
		if($_POST['type']){$where .= " and type=".$_POST['type'];}

		if($where!="")
		{

			$this->db->table_name = 'cban_member_mendian';

			$mendian = $this->db->cban_listinfo($where, 'userid desc',$_GET['page'], '20');
			$pages = $this->db->pages;

			foreach ($mendian as $key => $val) {

				$name = $db_linkage -> get_one(array('linkageid'=>$val[diqu]),'name','');
				$mendian[$key][diquname] = $name[name];

			}

		}
		include template('content','bai_xian_qian_dian');
	}
}
?>