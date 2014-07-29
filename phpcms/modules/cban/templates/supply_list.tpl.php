<?php 
	defined('IN_ADMIN') or exit('No permission resources.');
	include $this->admin_tpl('header', 'admin');
?>
<script type="text/javascript" src="<?php echo JS_PATH?>jquery.sgallery.js"></script>
<div class="pad-lr-10">
<form name="searchform" action="" method="get" >
<input type="hidden" value="cban" name="m">
<input type="hidden" value="manage" name="c">
<input type="hidden" value="supply_list" name="a">
<table width="100%" cellspacing="0" class="search-form">
    <tbody>
		<tr>
		<td><div class="explain-col">
       	关键字： <input name="keywords" type="text" value="<?php echo $keywords ?>" class="input-text">
      	状态：<select name="status"><option value="">请选择</option>
        <option value="1" <?php if($status==1) echo 'selected="selected"'; ?>>未审核</option>
        <option value="4" <?php if($status==4) echo 'selected="selected"'; ?>>审核失败</option>
        <option value="2" <?php if($status==2) echo 'selected="selected"'; ?>>审核通过</option>
        </select>
        <input type="submit" value="搜索" class="button" name="dosubmit">
		</div>
		</td>
		</tr>
    </tbody>
</table>
</form>
<div class="table-list">
<form name="myform" action="" method="post" id="myform">
    <table width="100%" cellspacing="0" >
        <thead align="left">
		<tr>
		<th width="5%">删除</th>
		<th width="15%">标题</th>
		<th width="15%">商品</th>
        <th width="10%">地区</th>
        <th width="5%">类型</th>
        <th width="5%">数量</th>
        <th width="6%">联系人</th>
        <th width="10%">电话</th>
		<th width="12%">发布时间</th>
        <th width="6%">状态</th>
		<th width="10%">图片预览</th>
		</tr>
        </thead> 
<tbody>
<?php 
if(is_array($infos)){
	foreach($infos as $info){
?>
<tr align="left" style="word-break:break-all; word-wrap:break-all;">
<td><input type="checkbox" name="id[]" value="<?php echo $info['id']?>" id="att_<?php echo $info['id']?>" /></td>
<td><?php echo $info['title']?></td>
<td><?php echo $info['goods']?></td>
<td><?php echo get_linkage($info[diqu],1,' - ')?></td>
<td><?php echo $info['status']==1 ? '供应':'求购'?></td>
<td><?php echo $info['num']?></td>
<td><?php echo $info['lxr']?></td>
<td><?php echo $info['tel']?></td>
<td><?php echo date('Y-m-d H:i:s',$info['time'])?></td>
<td>
<?php 
	switch($info['status']){
		case '1' : echo '未审核'; break;
		case '2' : echo '审核通过'; break;
		case '3' : echo '用户撤销'; break;
		case '4' : echo '审核失败'; break;
	}
?>
</td>
<td><?php echo supply_preview_img($info['img']); ?></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="10" align="left">描述：<?php echo $info['describe'];?></td>
</tr>

<?php 
	}
}
?>
</tbody>
</table>
<div class="btn">
<a href="#" onClick="javascript:$('input[type=checkbox]').attr('checked', true)">全选</a>/<a href="#" onClick="javascript:$('input[type=checkbox]').attr('checked', false)">取消</a>
<input type="submit" class="button" name="dosubmit" value="删除" onClick="document.myform.action='?m=cban&c=manage&a=supply_manage&op=1';return confirm('该操作将不可恢复，确定继续执行吗？')"/>
<input type="submit" class="button" name="dosubmit" value="审核通过" onClick="document.myform.action='?m=cban&c=manage&a=supply_manage&op=2';return confirm('该操作将不可恢复，确定继续执行吗？')"/>
<input type="submit" class="button" name="dosubmit" value="审核失败" onClick="document.myform.action='?m=cban&c=manage&a=supply_manage&op=3';return confirm('该操作将不可恢复，确定继续执行吗？')"/>
</div>

 <div id="pages"> <?php echo $pages?></div>

</form>

</div>
</div>
</body>
</html>
<script type="text/javascript">
<!--
window.top.$('#display_center_id').css('display','none');

function preview(filepath) {
	if(IsImg(filepath)) {
		window.top.art.dialog({title:'预览',fixed:true, content:'<img src="<?php echo UPLOAD_URL?>'+filepath+'" onload="$(this).LoadImage(true, 500, 500,\'<?php echo IMG_PATH?>s_nopic.gif\');"/>'});	
	} else {
		window.top.art.dialog({title:'预览',fixed:true, content:'<a href="'+filepath+'" target="_blank"><img src="<?php echo IMG_PATH?>admin_img/down.gif">点击打开</a>'});
	}
}

function IsImg(url){
	  var sTemp;
	  var b=false;
	  var opt="jpg|gif|png|bmp|jpeg";
	  var s=opt.toUpperCase().split("|");
	  for (var i=0;i<s.length ;i++ ){
	    sTemp=url.substr(url.length-s[i].length-1);
	    sTemp=sTemp.toUpperCase();
	    s[i]="."+s[i];
	    if (s[i]==sTemp){
	      b=true;
	      break;
	    }
	  }
	  return b;
}
//-->
</script>