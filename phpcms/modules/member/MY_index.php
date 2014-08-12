<?php

class MY_index extends index{

	function __construct() {
		parent::__construct();
	}

	public function init(){
	
	
		if(isset($_POST['dosubmit'])) {
				
			if(!trim($_POST['info']['license']) && !trim($_POST['info']['orgcode'])){
				showmessage('营业执照和组织机构代码至少填一项');
			}
				
			//更新用户昵称
			$nickname = isset($_POST['nickname']) && is_username(trim($_POST['nickname'])) ? trim($_POST['nickname']) : '';
			$nickname = safe_replace($nickname);
			if($nickname) {
				$this->db->update(array('nickname'=>$nickname), array('userid'=>$this->memberinfo['userid']));
				if(!isset($cookietime)) {
					$get_cookietime = param::get_cookie('cookietime');
				}
				$_cookietime = $cookietime ? intval($cookietime) : ($get_cookietime ? $get_cookietime : 0);
				$cookietime = $_cookietime ? TIME + $_cookietime : 0;
				param::set_cookie('_nickname', $nickname, $cookietime);
			}
			require_once CACHE_MODEL_PATH.'member_input.class.php';
			require_once CACHE_MODEL_PATH.'member_update.class.php';
			$member_input = new member_input($this->memberinfo['modelid']);
			$modelinfo = $member_input->get($_POST['info']);
	
			$this->db->set_model($this->memberinfo['modelid']);
			$membermodelinfo = $this->db->get_one(array('userid'=>$this->memberinfo['userid']));
			if(!empty($membermodelinfo)) {
				$this->db->update($modelinfo, array('userid'=>$this->memberinfo['userid']));
			} else {
				$modelinfo['userid'] = $this->memberinfo['userid'];
				$this->db->insert($modelinfo);
			}
				
			showmessage(L('operation_success'), HTTP_REFERER);
		} else {
				
			$memberinfo = $this->memberinfo;
			$memberinfo['usertype'] = get_modelname($this->memberinfo['modelid']);
				
			//获取会员模型表单
			require CACHE_MODEL_PATH.'member_form.class.php';
			$member_form = new member_form($this->memberinfo['modelid']);
			$this->db->set_model($this->memberinfo['modelid']);
				
			$membermodelinfo = $this->db->get_one(array('userid'=>$this->memberinfo['userid']));
			$forminfos = $forminfos_arr = $member_form->get($membermodelinfo);
	
			//万能字段过滤
			foreach($forminfos as $field=>$info) {
				if($info['isomnipotent']) {
					unset($forminfos[$field]);
				} else {
					if($info['formtype']=='omnipotent') {
						foreach($forminfos_arr as $_fm=>$_fm_value) {
							if($_fm_value['isomnipotent']) {
								$info['form'] = str_replace('{'.$_fm.'}',$_fm_value['form'], $info['form']);
							}
						}
						$forminfos[$field]['form'] = $info['form'];
					}
				}
			}
	
			$formValidator = $member_form->formValidator;
	
			include template('member', 'cban_index');
		}
	}
	
	public function register() {

		$this->_session_start();
		//获取用户siteid
		$siteid = isset($_REQUEST['siteid']) && trim($_REQUEST['siteid']) ? intval($_REQUEST['siteid']) : 1;
		//定义站点id常量
		if (!defined('SITEID')) {
			define('SITEID', $siteid);
		}
	
		//加载用户模块配置
		$member_setting = getcache('member_setting');
		if(!$member_setting['allowregister']) {
			showmessage(L('deny_register'), 'index.php?m=member&c=index&a=login');
		}
		//加载短信模块配置
		$sms_setting_arr = getcache('sms','sms');
		$sms_setting = $sms_setting_arr[$siteid];
	
		header("Cache-control: private");
		if(isset($_POST['dosubmit'])) {
			if($member_setting['enablcodecheck']=='1'){//开启验证码
				if ((empty($_SESSION['connectid']) && $_SESSION['code'] != strtolower($_POST['code']) && $_POST['code']!==NULL) || empty($_SESSION['code'])) {
					showmessage(L('code_error'));
				} else {
					$_SESSION['code'] = '';
				}
			}
				
			if(!trim($_POST['info']['license']) && !trim($_POST['info']['orgcode']) && $_POST['modelid']!=10){
				showmessage('营业执照和组织机构代码至少填一项');
				
			}
				
			$userinfo = array();
			$userinfo['encrypt'] = create_randomstr(6);
	
			$userinfo['username'] = (isset($_POST['username']) && is_username($_POST['username'])) ? $_POST['username'] : exit('0');
			$userinfo['nickname'] = (isset($_POST['nickname']) && is_username($_POST['nickname'])) ? $_POST['nickname'] : '';
				
			$userinfo['email'] = (isset($_POST['email']) && is_email($_POST['email'])) ? $_POST['email'] : exit('0');
			$userinfo['password'] = isset($_POST['password']) ? $_POST['password'] : exit('0');
				
			$userinfo['email'] = (isset($_POST['email']) && is_email($_POST['email'])) ? $_POST['email'] : exit('0');
	
			$userinfo['modelid'] = isset($_POST['modelid']) ? intval($_POST['modelid']) : 10;
			$userinfo['regip'] = ip();
			$userinfo['point'] = $member_setting['defualtpoint'] ? $member_setting['defualtpoint'] : 0;
			$userinfo['amount'] = $member_setting['defualtamount'] ? $member_setting['defualtamount'] : 0;
			$userinfo['regdate'] = $userinfo['lastdate'] = SYS_TIME;
			$userinfo['siteid'] = $siteid;
			$userinfo['connectid'] = isset($_SESSION['connectid']) ? $_SESSION['connectid'] : '';
			$userinfo['from'] = isset($_SESSION['from']) ? $_SESSION['from'] : '';
			//手机强制验证
				
			if($member_setting[mobile_checktype]=='1'){
				//取用户手机号
				$mobile_verify = $_POST['mobile_verify'] ? intval($_POST['mobile_verify']) : '';
				if($mobile_verify=='') showmessage('请提供正确的手机验证码！', HTTP_REFERER);
				$sms_report_db = pc_base::load_model('sms_report_model');
				$posttime = SYS_TIME-360;
				$where = "`id_code`='$mobile_verify' AND `posttime`>'$posttime'";
				$r = $sms_report_db->get_one($where,'*','id DESC');
				if(!empty($r)){
					$userinfo['mobile'] = $r['mobile'];
				}else{
					showmessage('未检测到正确的手机号码！', HTTP_REFERER);
				}
			}elseif($member_setting[mobile_checktype]=='2'){
				//获取验证码，直接通过POST，取mobile值
				$userinfo['mobile'] = isset($_POST['mobile']) ? $_POST['mobile'] : '';
			}
			if($userinfo['mobile']!=""){
				if(!preg_match('/^1([0-9]{9})/',$userinfo['mobile'])) {
					showmessage('请提供正确的手机号码！', HTTP_REFERER);
				}
			}
			unset($_SESSION['connectid'], $_SESSION['from']);
				
			if($member_setting['enablemailcheck']) {	//是否需要邮件验证
				$userinfo['groupid'] = 7;
			} elseif($member_setting['registerverify']) {	//是否需要管理员审核
				$modelinfo_str = $userinfo['modelinfo'] = isset($_POST['info']) ? array2string(array_map("safe_replace", new_html_special_chars($_POST['info']))) : '';
				$this->verify_db = pc_base::load_model('member_verify_model');
				unset($userinfo['lastdate'],$userinfo['connectid'],$userinfo['from']);
				$userinfo['modelinfo'] = $modelinfo_str;
				$this->verify_db->insert($userinfo);
				showmessage(L('operation_success'), 'index.php?m=member&c=index&a=register&t=3');
			} else {
				//查看当前模型是否开启了短信验证功能
				$model_field_cache = getcache('model_field_'.$userinfo['modelid'],'model');
				if(isset($model_field_cache['mobile']) && $model_field_cache['mobile']['disabled']==0) {
					$mobile = $_POST['info']['mobile'];
					if(!preg_match('/^1([0-9]{10})/',$mobile)) showmessage(L('input_right_mobile'));
					$sms_report_db = pc_base::load_model('sms_report_model');
					$posttime = SYS_TIME-300;
					$where = "`mobile`='$mobile' AND `posttime`>'$posttime'";
					$r = $sms_report_db->get_one($where);
					if(!$r || $r['id_code']!=$_POST['mobile_verify']) showmessage(L('error_sms_code'));
				}
				$userinfo['groupid'] = $this->_get_usergroup_bypoint($userinfo['point']);
			}
				
			if(pc_base::load_config('system', 'phpsso')) {
				$this->_init_phpsso();
				$status = $this->client->ps_member_register($userinfo['username'], $userinfo['password'], $userinfo['email'], $userinfo['regip'], $userinfo['encrypt']);
				if($status > 0) {
					$userinfo['phpssouid'] = $status;
					//传入phpsso为明文密码，加密后存入phpcms_v9
					$password = $userinfo['password'];
					$userinfo['password'] = password($userinfo['password'], $userinfo['encrypt']);
					$userid = $this->db->insert($userinfo, 1);
					if($member_setting['choosemodel']) {	//如果开启选择模型
						//通过模型获取会员信息
						require_once CACHE_MODEL_PATH.'member_input.class.php';
						require_once CACHE_MODEL_PATH.'member_update.class.php';
						$member_input = new member_input($userinfo['modelid']);
	
						$_POST['info'] = array_map('new_html_special_chars',$_POST['info']);
						$user_model_info = $member_input->get($_POST['info']);
						$user_model_info['userid'] = $userid;
	
						//插入会员模型数据
						$this->db->set_model($userinfo['modelid']);
						$this->db->insert($user_model_info);
					}
						
					if($userid > 0) {
						//执行登陆操作
						if(!$cookietime) $get_cookietime = param::get_cookie('cookietime');
						$_cookietime = $cookietime ? intval($cookietime) : ($get_cookietime ? $get_cookietime : 0);
						$cookietime = $_cookietime ? TIME + $_cookietime : 0;
	
						if($userinfo['groupid'] == 7) {
							param::set_cookie('_username', $userinfo['username'], $cookietime);
							param::set_cookie('email', $userinfo['email'], $cookietime);
						} else {
							$phpcms_auth_key = md5(pc_base::load_config('system', 'auth_key').$this->http_user_agent);
							$phpcms_auth = sys_auth($userid."\t".$userinfo['password'], 'ENCODE', $phpcms_auth_key);
								
							param::set_cookie('auth', $phpcms_auth, $cookietime);
							param::set_cookie('_userid', $userid, $cookietime);
							param::set_cookie('_username', $userinfo['username'], $cookietime);
							param::set_cookie('_nickname', $userinfo['nickname'], $cookietime);
							param::set_cookie('_groupid', $userinfo['groupid'], $cookietime);
							param::set_cookie('cookietime', $_cookietime, $cookietime);
						}
					}
					//如果需要邮箱认证
					if($member_setting['enablemailcheck']) {
						pc_base::load_sys_func('mail');
						$phpcms_auth_key = md5(pc_base::load_config('system', 'auth_key'));
						$code = sys_auth($userid.'|'.$phpcms_auth_key, 'ENCODE', $phpcms_auth_key);
						$url = APP_PATH."index.php?m=member&c=index&a=register&code=$code&verify=1";
						$message = $member_setting['registerverifymessage'];
						$message = str_replace(array('{click}','{url}','{username}','{email}','{password}'), array('<a href="'.$url.'">'.L('please_click').'</a>',$url,$userinfo['username'],$userinfo['email'],$password), $message);
						sendmail($userinfo['email'], L('reg_verify_email'), $message);
						//设置当前注册账号COOKIE，为第二步重发邮件所用
						param::set_cookie('_regusername', $userinfo['username'], $cookietime);
						param::set_cookie('_reguserid', $userid, $cookietime);
						param::set_cookie('_reguseruid', $userinfo['phpssouid'], $cookietime);
						showmessage(L('operation_success'), 'index.php?m=member&c=index&a=register&t=2');
					} else {
						//如果不需要邮箱认证、直接登录其他应用
						$synloginstr = $this->client->ps_member_synlogin($userinfo['phpssouid']);
						showmessage(L('operation_success').$synloginstr, 'index.php?m=member&c=index&a=init');
					}
						
				}
			} else {
				showmessage(L('enable_register').L('enable_phpsso'), 'index.php?m=member&c=index&a=login');
			}
			showmessage(L('operation_failure'), HTTP_REFERER);
		} else {
			if(!pc_base::load_config('system', 'phpsso')) {
				showmessage(L('enable_register').L('enable_phpsso'), 'index.php?m=member&c=index&a=login');
			}
				
			if(!empty($_GET['verify'])) {
				$code = isset($_GET['code']) ? trim($_GET['code']) : showmessage(L('operation_failure'), 'index.php?m=member&c=index');
				$phpcms_auth_key = md5(pc_base::load_config('system', 'auth_key'));
				$code_res = sys_auth($code, 'DECODE', $phpcms_auth_key);
				$code_arr = explode('|', $code_res);
				$userid = isset($code_arr[0]) ? $code_arr[0] : '';
				$userid = is_numeric($userid) ? $userid : showmessage(L('operation_failure'), 'index.php?m=member&c=index');
	
				$this->db->update(array('groupid'=>$this->_get_usergroup_bypoint()), array('userid'=>$userid));
				showmessage(L('operation_success'), 'index.php?m=member&c=index');
			} elseif(!empty($_GET['protocol'])) {
	
				include template('member', 'protocol');
			} else {
				//过滤非当前站点会员模型
				$modellist = getcache('member_model', 'commons');
				foreach($modellist as $k=>$v) {
					if($v['siteid']!=$siteid || $v['disabled']) {
						unset($modellist[$k]);
					}
				}
				if(empty($modellist)) {
					showmessage(L('site_have_no_model').L('deny_register'), HTTP_REFERER);
				}
				//是否开启选择会员模型选项
				if($member_setting['choosemodel']) {
					$first_model = array_pop(array_reverse($modellist));
					$modelid = isset($_GET['modelid']) && in_array($_GET['modelid'], array_keys($modellist)) ? intval($_GET['modelid']) : $first_model['modelid'];
	
					if(array_key_exists($modelid, $modellist)) {
						//获取会员模型表单
						require CACHE_MODEL_PATH.'member_form.class.php';
						$member_form = new member_form($modelid);
						$this->db->set_model($modelid);
						$forminfos = $forminfos_arr = $member_form->get();
	
						//万能字段过滤
						foreach($forminfos as $field=>$info) {
							if($info['isomnipotent']) {
								unset($forminfos[$field]);
							} else {
								if($info['formtype']=='omnipotent') {
									foreach($forminfos_arr as $_fm=>$_fm_value) {
										if($_fm_value['isomnipotent']) {
											$info['form'] = str_replace('{'.$_fm.'}',$_fm_value['form'], $info['form']);
										}
									}
									$forminfos[$field]['form'] = $info['form'];
								}
							}
						}
	
						$formValidator = $member_form->formValidator;
					}
				}
				$description = $modellist[$modelid]['description'];
	
				include template('member', 'register');
			}
		}
	}
	
	public function account_manage_password() {
		if(isset($_POST['dosubmit'])) {
			$updateinfo = array();
			if(!is_password($_POST['info']['password'])) {
				showmessage(L('password_format_incorrect'), HTTP_REFERER);
			}
			if($this->memberinfo['password'] != password($_POST['info']['password'], $this->memberinfo['encrypt'])) {
				showmessage(L('old_password_incorrect'), HTTP_REFERER);
			}
	
			//修改会员邮箱
			if($this->memberinfo['email'] != $_POST['info']['email'] && is_email($_POST['info']['email'])) {
				$email = $_POST['info']['email'];
				$updateinfo['email'] = $_POST['info']['email'];
			} else {
				$email = '';
			}
			$newpassword = password($_POST['info']['newpassword'], $this->memberinfo['encrypt']);
			$updateinfo['password'] = $newpassword;
	
			$this->db->update($updateinfo, array('userid'=>$this->memberinfo['userid']));
			if(pc_base::load_config('system', 'phpsso')) {
				//初始化phpsso
				$this->_init_phpsso();
				$res = $this->client->ps_member_edit('', $email, $_POST['info']['password'], $_POST['info']['newpassword'], $this->memberinfo['phpssouid'], $this->memberinfo['encrypt']);
				$message_error = array('-1'=>L('user_not_exist'), '-2'=>L('old_password_incorrect'), '-3'=>L('email_already_exist'), '-4'=>L('email_error'), '-5'=>L('param_error'));
				if ($res < 0) showmessage($message_error[$res]);
			}
	
			showmessage(L('operation_success'), HTTP_REFERER);
		} else {
			$show_validator = true;
			$memberinfo = $this->memberinfo;
	
			include template('member', 'cban_account_manage_password');
		}
	}
	

	/*供应信息发布*/
	public function supply_infor()
	{
		//删除曾经上传的文件的cookie，则关闭“未处理文件“的功能
		param::set_cookie('att_json','');
	
		if($_POST['dosubmit']){
			if(count($_POST['imglist_url'])<1 || count($_POST['imglist_url'])>5){
				showmessage('商品图片数量在 1 - 5 张');
			}
	
			if( trim($_POST['info']['title']) && trim($_POST['info']['goods']) && strlen($_POST['info']['describe'])<40
			&& $_POST['info']['type'] && trim($_POST['info']['num']) && trim($_POST['L_1-2'])
			&& trim($_POST['info']['lxr']) && trim($_POST['info']['tel']) && strlen($_POST['info']['note'])<100 )
			{
				pc_base::load_app_func('global');
	
				$date['title'] = addslashes(trim($_POST['info']['title']));
				$date['userid'] = param::get_cookie('_userid');
				$date['username'] = param::get_cookie('_username');
				$date['goods'] = addslashes(trim($_POST['info']['goods']));
				$date['description'] = $_POST['info']['description'] ? addslashes($_POST['info']['description']) : '';
				$date['type'] = $_POST['info']['type'];
				$date['num'] = $_POST['info']['num'];
				$date['diqu'] = $_POST['L_1-2'];
				$date['lxr'] = addslashes(trim($_POST['info']['lxr']));
				$date['tel'] = addslashes(trim($_POST['info']['tel']));
				$date['note'] = $_POST['info']['note'] ? addslashes($_POST['info']['note']) : '';
				$date['time'] = SYS_TIME;
				$date['img'] = array2string(merger_array(get_imglist_filepath($_POST['imglist_url']),$_POST['imglist_alt']));
	
				$attachmentdb = pc_base::load_model('attachment_model');
	
				$where = sql_where_or(get_imglist_filepath($_POST['imglist_url']),'filepath');
				$attachmentdb->update('status=1',$where);
	
				$thisdb = get_cbandb('cban_supply');
	
				if($thisdb->insert($date)) showmessage('添加成功，返回继续添加','index.php?m=member&c=index&a=supply_infor');
	
			}else{
				showmessage('参数错误');
			}
	
		}else{
			//上传图片js参数
			$name = "图片上传";
			$args = "5,gif|jpg|jpeg|png|bmp,0";
			$authkey = upload_key($args);
			include template('member', 'cban_supply_infor');
		}
	}
	
	public function supply_infor_manage()
	{
		if($_GET['status'] && $_GET['id']){
			$string = $_SERVER['argv'][0];
			$string = preg_replace('/&id=[0-9]*/i','',$string);
			$string = preg_replace('/&status=[0-9]*/i','',$string);
			//  		echo $string."<br>";
			$where['userid'] = addslashes(param::get_cookie('_userid'));
			$where['id'] = addslashes($_GET['id']);
			if ($_GET['status']==1)
			{
				$thisdb = get_cbandb('cban_supply');
				if($thisdb->update('status=3',$where))
					showmessage('撤销成功！','index.php?'.$string);
			}
			if ($_GET['status']==3)
			{
				$thisdb = get_cbandb('cban_supply');
				if($thisdb->update('status=1',$where))
					showmessage('重新发布成功！','index.php?'.$string);
			}
		}else{
			$where = ' userid='.param::get_cookie('_userid');
			if($_GET['dosubmit']){
				if(trim($_GET['keyword'])){
					$keywords = addslashes(trim($_GET['keyword']));
					$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
					$where .= $where ? ' or goods like \'%'.$keywords.'%\'' : ' goods like \'%'.$keywords.'%\'';
	
				}
	
				if(trim($_GET['L_1-1'])){
	
					if(trim($_GET['L_1-2'])){
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
	
				if(trim($_GET['type'])){
					$type='';
					if(trim($_GET['type'][1])){
						$type .= $type ? ' or type=1 ' :' type=1 ';
					}
					if(trim($_GET['type'][2])){
						$type .= $type ? ' or type=2 ' :' type=2 ';
					}
					if(trim($_GET['type'][1]) && trim($_GET['type'][2])){
						$type=' type in(1,2) ';
					}
					$where .= $where ? ' and '.$type : $type;
				}
				if(trim($_GET['status_mes'])){
					$status='';
					if(trim($_GET['status_mes'][1])){
						$status .= $status ? ' or status=1 ' :' status=1 ';
					}
					if(trim($_GET['status_mes'][2])){
						$status .= $status ? ' or status<>1 ' :' status<>1 ';
					}
					if(trim($_GET['status_mes'][1]) && trim($_GET['status_mes'][2])){
						$status = ' status in(1,2,3,4) ';
					}
					$where .= $where ? ' and '.$status : $status;
				}
				// 				print_r($_SERVER['argv']);
			}
			$thisdb = get_cbandb('cban_supply');
			$supply_infor_list = $thisdb->cban_listinfo($where,'time desc',$_GET['page'],20);
			$pages = $thisdb->pages;
			include template('member', 'cban_supply_infor_manage');
		}
	}
	
	private function _session_start() {
		$session_storage = 'session_'.pc_base::load_config('system','session_storage');
		pc_base::load_sys_class($session_storage);
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
		

}

?>