<?php


class MY_member_verify extends member_verify {
	
	private $db, $member_db;
	
	function __construct() {
		parent::__construct();
		$this->db = pc_base::load_model('member_verify_model');
		$this->_init_phpsso();
	}
	
	
	function pass() {
		if (isset($_POST['userid'])) {
			$this->member_db = pc_base::load_model('member_model');
			$uidarr = isset($_POST['userid']) ? $_POST['userid'] : showmessage(L('illegal_parameters'), HTTP_REFERER);
			$where = to_sqls($uidarr, '', 'userid');
			$userarr = $this->db->listinfo($where);
			$success_uids = $info = array();
			
			foreach($userarr as $v) {
				$status = $this->client->ps_member_register($v['username'], $v['password'], $v['email'], $v['regip'], $v['encrypt']);
				if ($status > 0) {
					$info['phpssouid'] = $status;
					$info['password'] = password($v['password'], $v['encrypt']);
					$info['regdate'] = $info['lastdate'] = $v['regdate'];
					$info['username'] = $v['username'];
					$info['nickname'] = $v['nickname'];
					$info['email'] = $v['email'];
					$info['regip'] = $v['regip'];
					$info['point'] = $v['point'];
					$info['groupid'] = $this->_get_usergroup_bypoint($v['point']);
					$info['amount'] = $v['amount'];
					$info['encrypt'] = $v['encrypt'];
					$info['modelid'] = $v['modelid'] ? $v['modelid'] : 10;
					if($v['mobile']) $info['mobile'] = $v['mobile'];
					$userid = $this->member_db->insert($info, 1);
// 					if($v['modelinfo']) {	//如果数据模型不为空
// 						//插入会员模型数据
// 						$user_model_info = string2array($v['modelinfo']);
// 						$user_model_info['userid'] = $userid;
// 						$this->member_db->set_model($info['modelid']);
// 						$this->member_db->insert($user_model_info);
// 						print_r($userid);
// 					}
					
					if($userid) {
						$success_uids[] = $v['userid'];
					}
				}
			}
			$where = to_sqls($success_uids, '', 'userid');			
			$this->db->update(array('status'=>1, 'message'=>$_POST['message']), $where);
			
			//phpsso注册失败的用户状态直接置为审核期间phpsso已注册该会员
			$fail_uids = array_diff($uidarr, $success_uids);
			if (!empty($fail_uids)) {
				$where = to_sqls($fail_uids, '', 'userid');
				$this->db->update(array('status'=>5, 'message'=>$_POST['message']), $where);
			}
			
			//发送 email通知
			if($_POST['sendemail']) {
				$memberinfo = $this->db->select($where);
				pc_base::load_sys_func('mail');
				foreach ($memberinfo as $v) {
					sendmail($v['email'], L('reg_pass'), $_POST['message']);
				}
			}
			
			showmessage(L('pass').L('operation_success'), HTTP_REFERER);
		} else {
			showmessage(L('operation_failure'), HTTP_REFERER);
		}
	}
	/**
	 * 初始化phpsso
	 * about phpsso, include client and client configure
	 * @return string phpsso_api_url phpsso地址
	 */
	private function _init_phpsso() {
		pc_base::load_app_class('client', '', 0);
		define('APPID', pc_base::load_config('system', 'phpsso_appid'));
		$phpsso_api_url = pc_base::load_config('system', 'phpsso_api_url');
		$phpsso_auth_key = pc_base::load_config('system', 'phpsso_auth_key');
		$this->client = new client($phpsso_api_url, $phpsso_auth_key);
		return $phpsso_api_url;
	}

	/**
	 *根据积分算出用户组
	 * @param $point int 积分数
	 */
	private function _get_usergroup_bypoint($point=0) {
		$groupid = 2;
		if(empty($point)) {
			$member_setting = getcache('member_setting');
			$point = $member_setting['defualtpoint'] ? $member_setting['defualtpoint'] : 0;
		}
		$grouplist = getcache('grouplist');
	
		foreach ($grouplist as $k=>$v) {
			$grouppointlist[$k] = $v['point'];
		}
		arsort($grouppointlist);
	
		//如果超出用户组积分设置则为积分最高的用户组
		if($point > max($grouppointlist)) {
			$groupid = key($grouppointlist);
		} else {
			foreach ($grouppointlist as $k=>$v) {
				if($point >= $v) {
					$groupid = $tmp_k;
					break;
				}
				$tmp_k = $k;
			}
		}
		return $groupid;
	}
}
?>