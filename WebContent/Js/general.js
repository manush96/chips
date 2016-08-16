function placeCaretAtEnd(el)
{
    el.focus();
    if (typeof window.getSelection != "undefined"
            && typeof document.createRange != "undefined")
    {
        var range = document.createRange();
        range.selectNodeContents(el);
        range.collapse(false);
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    }
    else if (typeof document.body.createTextRange != "undefined")
    {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(el);
        textRange.collapse(false);
        textRange.select();
    }
}

$(document).ready(function()
{
	
	$(document).on("click",".ajax_load",function(e)
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
				$(".select_list").select2(
				{
					allowClear: true
				});
				$.ajax
				({
					type: "POST",
					url: "setsession.html",
					data: { url: url },
					success: function()
					{
						
					}
				});
			}
		});
	});
	url = $.trim($("#session_url").text());
	if(url == "" || url == null || url == undefined)
	{
		$('#dashboard_link').trigger('click');
	}
	else
	{
		$('a[ref="'+url+'"]').trigger('click');
	}
	$(document).on("click","#get_queries",function()
	{
		var key = $("#keyword").val();
		var page = $("#page_id").text().trim();
		$.ajax
		({
			type: "GET",
			url: "viewquery.html",
			data: { page: "1", key: key },
			success: function(response)
			{
				$("#content_div").html(response);
			}
		});
	});
	
	$(document).on("click",".edit_query_row",function()
	{
		id = $(this).attr('rel');
		name = $('div[data-id="'+id+'"]').find(".name_text").text();
		query = $('div[data-id="'+id+'"]').find(".query_text").text();
		desc = $('div[data-id="'+id+'"]').find(".description_text").text();
		
		//----		
		no_of_var = $('div[data-id="'+id+'"]').find(".no_of_var_text").text();
		//----
		
		$("#edit_query_modal").find("#name").val(name);
		$("#edit_query_modal").find("#query").val(query);
		$("#edit_query_modal").find("#pword").val(desc);
		$("#edit_query_modal").find("#id").val(id);
	});		
	$(document).on("click",".remove_query_row",function()
	{
		id = $(this).attr('rel');
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "SingleDelete.html",
					data: { id: id },
					success: function(response)
					{
						$("#dashboard_link").trigger("click");
					}
				});
			},
			cancel: function()
			{
			    
			}
		});
		
	});
	$(document).on("click",".remove_db_row",function()
	{
		id = $(this).attr('rel');
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "SingleDeleteDb.html",
					data: { id: id },
					success: function(response)
					{
						$("#dashboard_link").trigger("click");
					}
				});
			},
			cancel: function()
			{
			    
			}
		});
		
	});
	
	$(document).on("click",".remove_report_row",function()
	{
		id = $(this).attr('rel');
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "SingleDeleterep.html",
					data: { id: id },
					success: function(response)
					{
						$("#dashboard_link").trigger("click");
					}
				});
			},
			cancel: function()
			{
			    
			}
		});
	});	
	
	$(document).on("click","#add_parameters", function()
	{
		$("#add_append_div").html('');
		var cnt = $("#no_of_var").val();
		for(i=1; i<=cnt; i++)
		{
			var clone = $("#var_clone").clone();
			$("#add_append_div").append(clone);
		}

		$("#add_append_div").find(".my_param_div").removeAttr("id");
		$("#add_append_div").find(".my_param_div").show();
	});

	$(document).on("click",".edit_db_row",function()
	{
		//max pool minpool  password url

		id = $(this).attr('rel');
		username = $('div[data-id="'+id+'"]').find(".username_text").text();
		password = $('div[data-id="'+id+'"]').find(".password_text").text();
		name = $('div[data-id="'+id+'"]').find(".name_text").text();
		url = $('div[data-id="'+id+'"]').find(".url_text").text();
		desc = $('div[data-id="'+id+'"]').find(".description_text").text();
		maxpool = $('div[data-id="'+id+'"]').find(".max_pool_size_text").text();
		minpool = $('div[data-id="'+id+'"]').find(".min_pool_size_text").text();
		
		//----		
		//no_of_var = $('div[data-id="'+id+'"]').find(".no_of_var_text").text();
		//----
		$("#edit_db_modal").find("#id").val(id);
		$("#edit_db_modal").find("#username").val(username);
		$("#edit_db_modal").find("#password").val(password);
		$("#edit_db_modal").find("#name").val(name);
		$("#edit_db_modal").find("#url").val(url);
		$("#edit_db_modal").find("#description").val(desc);
		$("#edit_db_modal").find("#min_pool_size").val(minpool);
		$("#edit_db_modal").find("#max_pool_size").val(maxpool);
		
	});		
	$(document).on("click","#goto_2",function()
	{
		$(".report_div").hide();
		query = $("#rep_query").val();
		name = $("#report_name").val();
		db_id = $("#rep_db").val();
		$.ajax
		({
			type: "GET",
			url: "get_page_2.html",
			data: { query: query, db_id:db_id, name:name  },
			success: function(response)
			{
				$("#report_div_2").html(response);
			}
		});
		$("#report_div_2").show();
	});	
	$(document).on("click","#delete_selected",function()
	{
		ids = "";
		$('.select_check:checked').each(function()
		{
			ids += this.getAttribute("rel");
			ids += ",";
		});
		ids = ids.substring(0,ids.length - 1)
		
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "multidelete.html",
					data: { ids: ids },
					success: function(response)
					{
						
					}
				});
				$("#dashboard_link").trigger("click");
			},
			cancel: function()
			{
			    
			}
		});
	});
	
	$(document).on("click","#delete_selected_db",function()
	{
		ids = "";
		$('.select_check:checked').each(function()
		{
			ids += this.getAttribute("rel");
			ids += ",";
		});
		ids = ids.substring(0,ids.length - 1)
		
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "multideletedb.html",
					data: { ids: ids },
					success: function(response)
					{
						
					}
				});
				$("#dashboard_link").trigger("click");
			},
			cancel: function()
			{
			    
			}
		});
	});

	$(document).on("click","#delete_selected_report",function()
	{
		ids = "";
		$('.select_check:checked').each(function()
		{
			ids += this.getAttribute("rel");
			ids += ",";
		});
		ids = ids.substring(0,ids.length - 1)
		
		$.confirm
		({
			title: 'Are you sure?',
			content: "You won't be able to revert this action!" ,
			confirmButton: 'Delete',
			confirmButtonClass: 'btn-danger',
			cancelButton: 'Cancel',
    		cancelButtonClass: 'btn-info',
    		closeIcon: true,
    		closeIconClass: 'glyphicon glyphicon-remove',
    		theme: 'material',
    		backgroundDismiss: true,
			confirm: function()
			{
				$.ajax
				({
					type: "POST",
					url: "multideleterep.html",
					data: { ids: ids },
					success: function(response)
					{
						
					}
				});
				$("#dashboard_link").trigger("click");
			},
			cancel: function()
			{
			    
			}
		});
	});
});
