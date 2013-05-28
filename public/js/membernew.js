function showAddTeamPanel() {
	$('#team-add-panel').modal({
		keyboard: false
	});
}

function addTeam(){
	$.post('/team/new',{
		'team[name]':$('#team_name').val()
	},function(resData){
		$('#team-add-panel').modal('hide');
		if(resData.success){
			$('<option/>').appendTo($('#teamlist')).val(resData.team._id).text(resData.team.name);
			$("#ats").show();
		}else{
			$("#atf").show();
		}
	});
}

function setLeadParam(chkbox){
	var chkboxEle = $(chkbox);
	var teamEle = $('#team-select');
	var input = $('#lead-param-input');
	if(chkbox.checked){
		if(input.length > 0) input.val(teamEle.val());
		else 
			chkboxEle.after($('<input/>').attr({
				id:'lead-param-input',name:'user[leadOf]',value:teamEle.val(),type:'hidden'
			}));
	}else{
		input.remove();
	}
}

function changeLeadParamIfExists(select){
	var input = $('#lead-param-input');
	var teamEle = $(select);
	if(input.length > 0)
		input.val(teamEle.val());
}