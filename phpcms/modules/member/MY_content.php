<?php

class MY_content extends content {
	
	function __construct() {
		parent::__construct();
	}
	
	public function publish() {
		//关闭多图上传的‘未处理文件 ’功能
		//param::set_cookie('att_json','');
		
		$modelid = $this->memberinfo['modelid'];
		$_username = $this->memberinfo['username'];
		

		if($modelid==12){
			$catid='9';
		}else if($modelid==13){
			$catid='10';
		}else{
			showmessage('参数错误');
		}
		
		$id = get_content_id($catid,$_username);
		
		if(isset($_POST['dosubmit'])) {
			
			if($id) {
				
				if($catid=='9'){
					$thisdb = get_cbandb('cban_news_md_data');
					
				}else if($catid=='10'){
					
					if(count($_POST['pinpai_url'])>10){
						showmessage('最多只能添加10个品牌');
					}
					$thisdb = get_cbandb('cban_news_qy_data');
					$content = $thisdb -> get_one('id='.$id,'pinpai');
					$content = new_stripslashes($content['pinpai']);
					$src_list = get_pinpai_url($content);
					update_attachments($src_list);
					$attachmentdb = pc_base::load_model('attachment_model');
					$src_list = $_POST['pinpai_url'];
					$attachmentdb->update('status=1', sql_where_or(get_imglist_filepath($src_list),'filepath'));
					
				}
				
				$content = $thisdb -> get_one('id='.$id,'content');
				$content = new_stripslashes($content['content']);
				update_attachments($content);
				$attachmentdb = pc_base::load_model('attachment_model');
				$src_list = preg_img_src(new_stripslashes($_POST['info']['content']));
				$attachmentdb->update('status=1', sql_where_or(get_imglist_filepath($src_list),'filepath'));
				//先把原来的附近都设置为未使用，在把传过来的附近设置成已使用
				
				$this->_edit_news($catid , $id);
			}
			else  $this->_add_news($catid);
			
		}else{
			$this->_show_news($catid , $id , $_username);
		}	
	}
	
	/**
	 * 显示 企业，门店信息
	 */
	private function _show_news($catid , $id , $_username) {
		$temp_language = L('news','','content');
		//设置cookie 在附件添加处调用
		param::set_cookie('module', 'content');
			
		//print_r($this->memberinfo);
		
		param::set_cookie('catid', $catid);
		$siteids = getcache('category_content', 'commons');
		$siteid = $siteids[$catid];
		$CATEGORYS = getcache('category_content_'.$siteid, 'commons');
		$category = $CATEGORYS[$catid];
			
		if($category['type']==0) {
			$modelid = $category['modelid'];
			$this->model = getcache('model', 'commons');
			$this->content_db = pc_base::load_model('content_model');
			$this->content_db->set_model($modelid);
				
			$this->content_db->table_name = $this->content_db->db_tablepre.$this->model[$modelid]['tablename'];
			$r = $this->content_db->get_one(array('id'=>$id,'username'=>$_username,'sysadd'=>0));
				
			//if(!$r) showmessage('非法操作！');
				
			//status 99通过 1审核中 0退稿
			//if($r['status']==99) showmessage(L('has_been_verified'));
				
			$this->content_db->table_name = $this->content_db->table_name.'_data';
			$r2 = $this->content_db->get_one(array('id'=>$id));
				
			$data = array_merge($r,$r2);
			require CACHE_MODEL_PATH.'content_form.class.php';
			$content_form = new content_form($modelid,$catid,$CATEGORYS);	
			$forminfos_data = $content_form->get($data);			
			$forminfos = array();
			foreach($forminfos_data as $_fk=>$_fv) {
				if($_fv['isomnipotent']) continue;
				if($_fv['formtype']=='omnipotent') {
					foreach($forminfos_data as $_fm=>$_fm_value) {
						if($_fm_value['isomnipotent']) {
							$_fv['form'] = str_replace('{'.$_fm.'}',$_fm_value['form'],$_fv['form']);
						}
					}
				}
				$forminfos[$_fk] = $_fv;
			}
			$formValidator = $content_form->formValidator;
			//print_r($forminfos);
			//unset($forminfos['content']);
			include template('member', 'cban_content_publish');
		}
	}
	
	private function _add_news($catid){
		
		if(count($_POST['pinpai_url'])>10){
			showmessage('最多只能添加10个品牌');
		}
		$src_list = preg_img_src(new_stripslashes($_POST['info']['content']));
		$where = sql_where_or(get_imglist_filepath($src_list),'filepath');
		$attachmentdb = pc_base::load_model('attachment_model');
		$attachmentdb->update('status=1',$where);
		//把内容中的附件设置为已使用
		
		$memberinfo = $this->memberinfo;
		$grouplist = getcache('grouplist');
		$priv_db = pc_base::load_model('category_priv_model'); //加载栏目权限表数据模型
		
		//判断会员组是否允许投稿
		if(!$grouplist[$memberinfo['groupid']]['allowpost']) {
			showmessage(L('member_group').L('publish_deny'), HTTP_REFERER);
		}
		//判断每日投稿数
		$this->content_check_db = pc_base::load_model('content_check_model');
		$todaytime = strtotime(date('y-m-d',SYS_TIME));
		$_username = $this->memberinfo['username'];
		$allowpostnum = $this->content_check_db->count("`inputtime` > $todaytime AND `username`='$_username'");
		if($grouplist[$memberinfo['groupid']]['allowpostnum'] > 0 && $allowpostnum >= $grouplist[$memberinfo['groupid']]['allowpostnum']) {
			showmessage(L('allowpostnum_deny').$grouplist[$memberinfo['groupid']]['allowpostnum'], HTTP_REFERER);
		}
		$siteids = getcache('category_content', 'commons');
		header("Cache-control: private");
		
		//判断此类型用户是否有权限在此栏目下提交投稿
		if (!$priv_db->get_one(array('catid'=>$catid, 'roleid'=>$memberinfo['groupid'], 'is_admin'=>0, 'action'=>'add'))) showmessage('该栏目禁止投稿', APP_PATH.'index.php?m=member&c=content&a=publish');
			
			
		$siteid = $siteids[$catid];
		$CATEGORYS = getcache('category_content_'.$siteid, 'commons');
		$category = $CATEGORYS[$catid];
		$modelid = $category['modelid'];
		if(!$modelid) showmessage(L('illegal_parameters'), HTTP_REFERER);
		$this->content_db = pc_base::load_model('content_model');
		$this->content_db->set_model($modelid);
		$table_name = $this->content_db->table_name;
		$fields_sys = $this->content_db->get_fields();
		$this->content_db->table_name = $table_name.'_data';
			
		$fields_attr = $this->content_db->get_fields();
		$fields = array_merge($fields_sys,$fields_attr);
		$fields = array_keys($fields);
		$info = array();
		foreach($_POST['info'] as $_k=>$_v) {
			if($_k == 'content') {
				$info[$_k] = remove_xss(strip_tags($_v, '<p><a><br><img><ul><li><div>'));
			} elseif(in_array($_k, $fields)) {
				$info[$_k] = new_html_special_chars(trim_script($_v));
			}
		}
		$_POST['linkurl'] = str_replace(array('"','(',')',",",' ','%'),'',new_html_special_chars(strip_tags($_POST['linkurl'])));
		$post_fields = array_keys($_POST['info']);
		$post_fields = array_intersect_assoc($fields,$post_fields);
		$setting = string2array($category['setting']);
		if($setting['presentpoint'] < 0 && $memberinfo['point'] < abs($setting['presentpoint']))
			showmessage(L('points_less_than',array('point'=>$memberinfo['point'],'need_point'=>abs($setting['presentpoint']))),APP_PATH.'index.php?m=pay&c=deposit&a=pay&exchange=point',3000);
			
		//判断会员组投稿是否需要审核
		if($grouplist[$memberinfo['groupid']]['allowpostverify'] || !$setting['workflowid']) {
			$info['status'] = 99;
		} else {
			$info['status'] = 1;
		}
		$info['username'] = $memberinfo['username'];
		if(isset($info['title'])) $info['title'] = safe_replace($info['title']);
		$this->content_db->siteid = $siteid;
			
		$id = $this->content_db->add_content($info);
		//检查投稿奖励或扣除积分
		if ($info['status']==99) {
			$flag = $catid.'_'.$id;
			if($setting['presentpoint']>0) {
				pc_base::load_app_class('receipts','pay',0);
				receipts::point($setting['presentpoint'],$memberinfo['userid'], $memberinfo['username'], $flag,'selfincome',L('contribute_add_point'),$memberinfo['username']);
			} else {
				pc_base::load_app_class('spend','pay',0);
				spend::point($setting['presentpoint'], L('contribute_del_point'), $memberinfo['userid'], $memberinfo['username'], '', '', $flag);
			}
		}
		//缓存结果
		$model_cache = getcache('model','commons');
		$infos = array();
		foreach ($model_cache as $modelid=>$model) {
			if($model['siteid']==$siteid) {
				$datas = array();
				$this->content_db->set_model($modelid);
				$datas = $this->content_db->select(array('username'=>$memberinfo['username'],'sysadd'=>0),'id,catid,title,url,username,sysadd,inputtime,status',100,'id DESC');
				if($datas) $infos = array_merge($infos,$datas);
			}
		}
		setcache('member_'.$memberinfo['userid'].'_'.$siteid, $infos,'content');
		//缓存结果 END
		
		showmessage('信息发布成功，等待管理员审核<br />审核通过后，将有可能在站点发布您的信息！');
		
			
	}
	
	/**
	 * 编辑 企业，门店信息
	 */
	private function _edit_news($catid , $id){
		
		$_POST['info']['diqu'] = $_POST['diqu-2'];
		$siteids = getcache('category_content', 'commons');
		$siteid = $siteids[$catid];
		$CATEGORYS = getcache('category_content_'.$siteid, 'commons');
		$category = $CATEGORYS[$catid];
		if($category['type']==0) {
		
			$this->content_db = pc_base::load_model('content_model');
			$modelid = $category['modelid'];
			$this->content_db->set_model($modelid);
			//判断会员组投稿是否需要审核
			$memberinfo = $this->memberinfo;
			$grouplist = getcache('grouplist');
			$setting = string2array($category['setting']);
			if(!$grouplist[$memberinfo['groupid']]['allowpostverify'] || $setting['workflowid']) {
				$_POST['info']['status'] = 1;
			}
			
			foreach($_POST['info'] as $_k=>$_v) {
				if($_k == 'content') {
					$_POST['info'][$_k] = strip_tags($_v, '<p><a><br><img><ul><li><div>');
				} elseif(in_array($_k, $fields)) {
					$_POST['info'][$_k] = new_html_special_chars(trim_script($_v));
				}
			}
			$_POST['linkurl'] = str_replace(array('"','(',')',",",' ','%'),'',new_html_special_chars(strip_tags($_POST['linkurl'])));
			
			$this->content_db->edit_content($_POST['info'],$id);
			
			showmessage('更新成功','index.php?m=member&c=content&a=publish');
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
	

}
?>