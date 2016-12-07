<?php 
	
$(document).ready(function () {
		
			$.getJSON('estados_cidades.json', function (data) {
				var items = [];
				var options = '<option value="">escolha um estado</option>';	
				$.each(data, function (key, val) {
					options += '<option value="' + val.nome + '">' + val.nome + '</option>';
				});					
				$("#uf").html(options);				
				
				$("#uf").change(function () {				
				
					var options_cidades = '';
					var str = "";					
					
					$("#uf option:selected").each(function () {
						str += $(this).text();
					});
					
					$.each(data, function (key, val) {
						if(val.nome == str) {							
							$.each(val.cidades, function (key_city, val_city) {
								options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
							});							
						}
					});
					$("#cidades").html(options_cidades);
					
				}).change();		
			
			});
		
		});
		

	
//máscara dos campos	

	$(function(){
    $("#date").mask("99/99/9999",{placeholder:" "});
    $("#rg").mask("99.999.999-9",{placeholder:" "});
    $("#cpf").mask("999.999.999-99",{placeholder:" "});
    $("#telefone").mask("(99) 9999-9999",{placeholder:" "});
	$("#celular").mask("(99) 99999-9999",{placeholder:" "});
    $("#cnpj").mask("99.999.999/9999-99",{placeholder:" "});
	$("#cep").mask("99.999-999",{placeholder:" "});
	});

	
	
	
	
	$(document).ready(function(){
    $('table tr').click(function(){
        window.location = $(this).data('cliente.php?id=$id');
        returnfalse;
    });
});

?>