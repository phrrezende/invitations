// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	var sugestao= function(){
		palavras= $("#convidado_nome").val();
		$.ajax({
			url: "<%= convites_busca_path %>",
			type: "GET",
			data: {nome: palavras},
			success: function(data){
				console.log(data);
			}
		});
	};
	$("#convidado_nome").bind("onkeyup", sugestao);
});