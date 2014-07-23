<?php
defined('IN_PHPCMS') or exit('No permission resources.');
if(!defined('CACHE_MODEL_PATH')) define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

/**
 * 内容模型数据库操作类
 */
pc_base::load_sys_class('model', '', 0);
class cban_model extends model 
{
	public $table_name = '';
	public $db_tablepre = '';
	public $category = '';
	public function __construct() 
	{
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'cban';
		parent::__construct();
	}
	
}
?>