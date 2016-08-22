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
function side_url()
{
	url = $.trim($("#session_url").text());
	if(url == "" || url == null || url == undefined)
	{
		$('#dashboard_link.ajax_load').trigger('click');
	}
	else
	{
		$('a[ref="'+url+'"].ajax_load').trigger('click');
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
					type: "GET",
					url: "set_url.html",
					data: { url: url },
					success: function(response)
					{
						$("#session_url").text(url);
					}
				});
			}
		});
	});
	$(".sidelink a").click(function()
	{
		$(".sidelink").removeClass("active_sidelink");
		$(this).parent().addClass("active_sidelink");
	});
	side_url();
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
	
	$(document).on("click","#get_reports",function()
	{
		var key = $("#keyword").val();
		var page = $("#page_id").text().trim();
		$.ajax
		({
			type: "GET",
			url: "viewreport.html",
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
		no_of_var = $('div[data-id="'+id+'"]').find(".no_of_var_text").text();
		status = $(this).attr("data-status");
		
		$("#edit_query_modal").find("#name").val(name);
		$("#edit_query_modal").find("#query").val(query);
		$("#edit_query_modal").find("#pword").val(desc);
		$("#edit_query_modal").find("#id").val(id);
		$("#edit_query_modal").find("#status").val(status);
		$("#edit_query_modal").find(".append_div").html("");
		params = $(this).find('.params').text();
		var myData = JSON.parse(params);
		var myClone;
		$.each(myData,function(key, obj)
		{
			myClone = $("#edit_query_modal").find("#param_clone").clone();
			$("#edit_query_modal").find(".append_div").append(myClone);
			$("#edit_query_modal").find(".append_div").find("#param_clone").find("#param_id").val(obj['id']);
			$("#edit_query_modal").find(".append_div").find("#param_clone").find("#param_name").val(obj['param_name']);
			$("#edit_query_modal").find(".append_div").find("#param_clone").find("#param_type").val(obj['param_type']);
			$("#edit_query_modal").find(".append_div").find(".my_param_clone").removeAttr("id");
			$("#edit_query_modal").find(".append_div").find(".my_param_clone").show();	
		});
	});
	
	$(document).on("click",".edit_report",function()
			{
				id = $(this).attr('rel');
				// report name queryid dbid display names
				name = $('div[data-id="'+id+'"]').find(".name_text").text();
				queryid = $('div[data-id="'+id+'"]').find(".query_text").text();
				displaynames = $('div[data-id="'+id+'"]').find(".description_text").text();
				dbid = $('div[data-id="'+id+'"]').find(".db_id").text();
				
				alert(id);
				alert(name);
				alert(queryid);
				alert(dbid);
				alert(displaynames);
				/*$("#edit_report").find("#name").val(name);
				$("#edit_report").find("#query").val(query);
				$("#edit_report").find("#pword").val(desc);
				$("#edit_report").find("#id").val(id);
				$("#edit_report").find("#status").val(status);*/
			});
	$(document).on("click","#edit_query_submit",function(e)
	{
		$("#param_clone").remove();
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
						side_url();
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
						side_url();
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
						side_url();
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
		
		query = $("#rep_query").val();
		name = $("#report_name").val();
		db_id = $("#rep_db").val();
		
		if(query == "" || name == "" || db_id == "" || query == null || name == null || db_id == null || query == undefined || name == undefined || db_id == undefined)
		{
			$("#report_div_1").find(".myError").text("All fields are necessary!");
			return;
		}
		$("#report_div_1").find(".myError").text("");
		$.ajax
		({
			type: "GET",
			url: "get_page_2.html",
			data: { query: query, db_id:db_id, name:name  },
			success: function(response)
			{
				$(".report_div").hide();
				$("#report_div_2").html(response);
				$("#report_div_2").show("fast");
			}
		});
	});	
	
	$(document).on("click","#goto_1",function()
	{
		$(".report_div").hide();
		$("#report_div_1").show("fast");
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
				side_url();
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
				side_url();
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
				side_url();
			},
			cancel: function()
			{
			    
			}
		});
	});
});
