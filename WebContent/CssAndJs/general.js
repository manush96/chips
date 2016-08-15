$(document).ready(function()
{
	$(".ajax_load").click(function(e)
	{
		e.preventDefault();
		url = $(this).attr('ref');
		if(url == "" || url == undefined || url == null)
			return;
		
		$.ajax
		({
			type: "GET",
			url: url,
			data: {},
			success: function(response)
			{
				$("#content_div").html(response);
			}
		});
	});
});