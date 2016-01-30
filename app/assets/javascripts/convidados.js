// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

	var convidado = function(){
		id = $(this).parent().attr("id");
		convite = {convidado_id: id, data_entrega: '2016-01-30', user_id: "2"}
		$.ajax({
			url: "<%= new_convite_path %>"
			type: "GET",
			data: convite
		});
	}; 
	
	$('button[name="convidadar"]').bind('click', convidado);
});