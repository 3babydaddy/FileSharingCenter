$(function() {
	$("#linkBtnMan").click(function() {
		$("#share_to_user").show();
		$("#share_to_grop").hide();
	});

	$("#linkBtnGrop").click(function() {
		$("#share_to_user").hide();
		$("#share_to_grop").show();
	});
});