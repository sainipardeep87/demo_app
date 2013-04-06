$(document).on("keyup","#search_user",function(event){
	var input = $(this).val();
	var url ="/users/find_user?input="+input
	if (input.length < 3){
		$("#searched_users").empty();
		$("#searched_users").hide();
	}
	else
	{	$.get(url,function(data){
		$("#searched_users").show();
		$("#searched_users").empty();
		$("#searched_users").html(data);
		
	});
	}
});

$(document).on("click",".searched_user_name",function(event){
	var val = $(this).val();
	$.get("/users/show?="+val,function(data){
		
	})
});

$(document).on("click","#search_user",function(event){
	$("#search_user").val("");
})
