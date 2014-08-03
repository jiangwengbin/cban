$(function() {
	$(".group_div").click(function() {
		//要显示的id
		id = $(this).attr('data-id');
		//展示组
		group_name = $(this).attr('data-class');
		$("." + group_name).hide();
		$("#" + id).show();

		type = $(this).attr("data-type");
		if(type == 1) {//type设置为1时 切换时的效果
			$("li[data-class='" + group_name + "']").removeClass("event_in").removeClass("event_out");
			$("li[data-class='" + group_name + "']").addClass("event_out");
			$(this).removeClass("event_out").addClass("event_in");
		} else if(type == 2){
			$("li[data-class='" + group_name + "']").removeClass("event");
			$(this).addClass("event");
		}
	});
});

$(function() {
	
	$("#header_nav>>li").load(function() {
		$(this).removeClass("de_ba");
		$(this).find("a div").removeClass("de");
		$(this).parent().find(".next_nav").hide();
	});
	
	$("#header_nav>>li").mousemove(function() {
		if($(this).find('li').length) {
			$(this).addClass("de_ba");
			$(this).find("a div").eq(0).addClass("de");
			$(this).find(".next_nav").show();
		}
	}).mouseout(function() {
		$(this).removeClass("de_ba");
		$(this).find("a div").removeClass("de");
		$(this).parent().find(".next_nav").hide();
	});

});