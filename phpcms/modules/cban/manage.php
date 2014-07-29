<?php
pc_base::load_app_class('admin','admin',0);
pc_base::load_sys_class('form', '', 0);
class manage extends admin {

	function __construct(){

	}

	/*供应信息后台管理*/
	function supply_list(){
		$where = '';
		if($_GET['dosubmit']){
			if(trim($_GET['keywords'])){
				$keywords = addslashes(trim($_GET['keywords']));
				$where .= $where ? ' and title like \'%'.$keywords.'%\'' : ' title like \'%'.$keywords.'%\'';
				$where .= $where ? ' or goods like \'%'.$keywords.'%\'' : ' goods like \'%'.$keywords.'%\'';
				$where .= $where ? ' or lxr like \'%'.$keywords.'%\'' : ' lxr like \'%'.$keywords.'%\'';
				$where .= $where ? ' or note like \'%'.$keywords.'%\'' : ' note like \'%'.$keywords.'%\'';
			}
			if(trim($_GET['status'])){
				$status = addslashes(trim($_GET['status']));
				$where .= $where ? ' and status = \''.$status.'\'' : ' status = \''.$status.'\'';
			}
		}

		$thisdb = get_cbandb('cban_supply');
		$page = $_GET['page'] ? $_GET['page'] : '1';
		$infos = $thisdb->listinfo($where,'time desc',$page,20);
		$pages = $thisdb->pages;
		include $this->admin_tpl('supply_list');
	}

	function supply_manage(){

		if($_POST['dosubmit'] && $_GET['op']&& $_POST['id']){

			$id =  new_addslashes($_POST[id]);
			$num = count($id);
			$where = 'id in ('.implode(',',$id).')';
			$thisdb = get_cbandb('cban_supply');
			/*批量删除*/
			if($_GET['op']==1){

				$date = $thisdb->select($where,'img');
				$attachmentdb = get_cbandb('cban_attachment');
				foreach ($date as $k){
					$img_arr = string2array($k['img']);
					foreach ($img_arr as $kk){
						$attachmentdb->update('status=0','filepath=\''.$kk['0'].'\'');
					}
				}
 				$thisdb = get_cbandb('cban_supply');
				$thisdb->delete($where);
				showmessage('操作成功！',HTTP_REFERER);
			}
			/*批量审核通过*/
			if($_GET['op']==2){
				$thisdb->update('status=2',$where);
				showmessage('操作成功！',HTTP_REFERER);
			}
			/*批量审核失败*/
			if($_GET['op']==3){
				$thisdb->update('status=4',$where);
				showmessage('操作成功！',HTTP_REFERER);
			}
		}else{
			showmessage('你至少选中一条记录！');
		}

	}

}
?>