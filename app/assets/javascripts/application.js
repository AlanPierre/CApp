// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .


$(document).ready(function($) {
    $("input[type=text].currency").setMask('decimal');
    $("input[type=text].total").setMask('decimal');
    $("input[type=text].date_time").setMask('date');
    $("input[type=text].cnpj").setMask('cnpj');
    $("input[type=text].cep").setMask('cep');
    $("input[type=tel]").setMask('phone');
    
    $('input').iCheck({
    checkboxClass: 'icheckbox_flat-yellow',
    radioClass: 'iradio_flat-yellow'
  });
    
        
    $('.datepicker').datepicker();

    $('#filter_form input[type=checkbox]').on('ifChecked', function(event){
         $("#filter_form").submit();
  });

    $('#filter_form input[type=checkbox]').on('ifUnchecked', function(event){
         $("#filter_form").submit();
    });
        $('#filter_form  .datepicker').on('blur', function(event){
         $("#filter_form").submit();
    });
    
    $('#filter_form  #search_with').on('keyup', function(event){
         $("#filter_form").submit();
    });
    
     $('#filter_form  #cliente_name').on('keyup', function(event){
         $("#filter_form").submit();
    }); 
    
    
     $('.add_fields').on('click',function(event) { 
        setTimeout(function() {      
            $('input').iCheck({
            checkboxClass: 'icheckbox_flat-yellow',
            radioClass: 'iradio_flat-yellow'
            });
        }, 100);     
     }); 
   
$(function(){
    var cliente_endereco_id =  $('#orcamento_cliente_endereco_id').val();
    if(typeof  cliente_endereco_id != 'undefined'){
      if(cliente_endereco_id == ''){ $(".endereco_cliente").val('')}
    else {$.getJSON("/cliente/enderecos.json", { cliente_endereco_id: cliente_endereco_id },
         function(result){
         if( result.cidade_id == null || result.estado_id == null ){
               $(".endereco_cliente").val("Endereço incompleto.");
               return;}
            console.log(result);
            $(".endereco_cliente").val(result.rua + " - " + result.numero + " - " + result.complemento + " - " +result.bairro + " - " + result.cidade.name + "/" + result.estado.uf + " - " + result.cep);
      });
    };
     };
});
    
});



function SubmitAndRemoveMask() {
    $("input[type=text].currency").setMask('decimal_default');
    $("input[type=text].cnpj").setMask('default');
    $("input[type=text].cep").setMask('default');
}



function SubmitFilter() {
    var $parent = $(":focus").parents("li");
    var $check_box = $parent.find("input[type=checkbox]");
    if ($check_box.is(':checked')) {$check_box.iCheck('uncheck');} else {$check_box.iCheck('check');}
}


function BuscarCep() {
        var $parent = $(":focus").parents(".nested-fields");
         $("input[type=text].cep").setMask('cep');   
      var cep_code =  $parent.find('.cep').val();  
    if(cep_code.length == 9){  
      if( cep_code.length <= 0 ) return;
      $.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
         function(result){
            if( result.status!=1 ){
               alert(result.message || "Houve um erro desconhecido");
               return;
            }
            console.log(result);
            $parent.find(".bairro").val( result.district );
            $parent.find(".logradouro").val( result.address );
            var uf = result.state;
            $parent.find(".estado option").each(function() {
                this.selected = (this.text === uf);
            });
          $parent.find(".estado").trigger("onchange");
          setTimeout(function() { 
            var cidade = result.city;
            $parent.find(".cidade option").each(function() {
                this.selected = (this.text === cidade);
            });}, 500);
          
      });
   }
}



function SomarItens() {
    //Calcular Subtotal
    var parent, valor, quantidade, subtotal, valorString, items, itemCount, total, itemString
    parent = $(":focus").parents(".nested-fields");
    valor = parent.find('.valor').val();
    subtotal = parent.find('.subtotal');
    valorString = valor.replace(".", "");
    valorString = valorString.replace(",", "");
    quantidade = parent.find('.quantidade').val();
    subtotal.val(parseInt(+valorString, 10) * parseInt(+quantidade, 10));
    //Calcular Total
    items = $(".subtotal");
    itemCount = items.length;
    total = 0;
    for(var i = 0; i < itemCount; i++){
        itemString = items[i].value;
        itemString = itemString.replace(".", "");
        itemString = itemString.replace(",", "");
        total = total + parseInt(+itemString, 10); 
    }
    document.getElementById('total').value = total;
    $("input[type=text].currency").setMask('decimal');
}

function RemoverSomarItens() {
    var $parent = $(":focus").parents(".nested-fields");
    $parent.find('.subtotal').val('0');
    //Calcular Total
    items = $(".subtotal");
    itemCount = items.length;
    total = 0;
    for(var i = 0; i < itemCount; i++){
        itemString = items[i].value;
        itemString = itemString.replace(".", "");
        itemString = itemString.replace(",", "");
        total = total + parseInt(+itemString, 10); 
    }
    document.getElementById('total').value = total;
    $("input[type=text].currency").setMask('decimal');
}

function DynamicSelect()  {
    var $parent = $(":focus").parents(".item"); 
    $parent.find('select[data-option-dependent=true]').each(function(i) {
      var key_method, observed, observed_dom_id, observer, observer_dom_id, prompt, regexp, url_mask, value_method;
      observer_dom_id = $(this).attr("id");
      observed_dom_id = $(this).data("option-observed");
      url_mask = $(this).data("option-url");
      key_method = $(this).data("option-key-method");
      value_method = $(this).data("option-value-method");
      prompt = $("<option value=\"\">").text("Selecione");
      regexp = /:[0-9a-zA-Z_]+:/g;
      observer = $("select#" + observer_dom_id);
      observed = $("#" + observed_dom_id);
      if (!observer.val() && observed.size() > 1) {
        observer.attr("disabled", true);
      }
        
      observer.empty().append(prompt);
      if (!observer.val() && observed.size() > 1) {
        observer.attr('disabled', true);
      }
        var url;
        observer.empty().append(prompt);
        if (observed.val()) {
          url = url_mask.replace(regexp, observed.val());
          $.getJSON(url, function(data) {
            $.each(data, function(i, object) {
              console.log(data);
              observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
              observer.attr('disabled', false);
            });
          });
        }
    });
  }


function DynamicSelectEnderecoCliente()  {
    $('#orcamento_cliente_endereco_id').each(function(i) {
        $(".endereco_cliente").val('');
      var key_method, observed, observed_dom_id, observer, observer_dom_id, prompt, regexp, url_mask, value_method;
      observer_dom_id = $(this).attr("id");
      observed_dom_id = $(this).data("option-observed");
      url_mask = $(this).data("option-url");
      key_method = $(this).data("option-key-method");
      value_method = $(this).data("option-value-method");
      prompt = $("<option value=\"\">").text("Selecione");
      regexp = /:[0-9a-zA-Z_]+:/g;
      observer = $("select#" + observer_dom_id);
      observed = $("#" + observed_dom_id);
      if (!observer.val() && observed.size() > 1) {
        observer.attr("disabled", true);
      }
      observer.empty().append(prompt);
      if (!observer.val() && observed.size() > 1) {
        observer.attr('disabled', true);
      }
        var url;
        observer.empty().append(prompt);
        if (observed.val()) {
          url = url_mask.replace(regexp, observed.val());
          $.getJSON(url, function(data) {
            $.each(data, function(i, object) {
              console.log(data);
              observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
              observer.attr('disabled', false);
                
            });
          });
        }
    });
  }

function DynamicSelectDescricao()  {
    var $parent = $(":focus").parents(".modal-body"); 
    $parent.find('textarea[data-option-dependent=true]').each(function(i) {
      var key_method, observed, observed_dom_id, observer, observer_dom_id, prompt, regexp, url_mask, value_method;
      observer_dom_id = $(this).attr("id");
      observed_dom_id = $(this).data("option-observed");
      url_mask = $(this).data("option-url");
      key_method = $(this).data("option-key-method");
      value_method = $(this).data("option-value-method");
      regexp = /:[0-9a-zA-Z_]+:/g; 
      observer = $("textarea#" + observer_dom_id);
      observed = $("#" + observed_dom_id);
        var url;
        observer.empty().append(prompt);
        if (observed.val()) {
          url = url_mask.replace(regexp, observed.val());
          $.getJSON(url, function(data) {
                observer.val(data.descricao);
  
          });
        }
    });
  }


function DynamicSelectEnderecoCompleto()  {
    var cliente_endereco_id =  $('#orcamento_cliente_endereco_id').val();
      if(cliente_endereco_id == ''){ $(".endereco_cliente").val('')}
    else {$.getJSON("/cliente/enderecos.json", { cliente_endereco_id: cliente_endereco_id },
         function(result){
        
         if( result.cidade_id == null || result.estado_id == null ){
               $(".endereco_cliente").val("Endereço incompleto.");
               return;
            }
            console.log(result);
            $(".endereco_cliente").val(result.rua + " - " + result.numero + " - " + result.complemento + " - " +result.bairro + " - " + result.cidade.name + "/" + result.estado.uf + " - " + result.cep);
      });
        };

}

function InserirOrcamentoCondicoesGerais() {
    $.getJSON("/orcamento-item-descricao/1",
    function ( data ) {
      console.log(data);
      $("#orcamento_condicoes").val(data.descricao);
    }
  );
}

function InserirDescricao() {
    var $parent = $(":focus").parents(".nested-fields");
    $parent.find('.descricao_item').val($parent.find('.descricao_text').val());
    $('.modal').modal('hide');
}


function CloseModal() {
    $('.modal').modal('hide');
}

function OpenModal() {
    var $parent = $(":focus").parents(".nested-fields");
    $parent.find('.descricao_text').val($parent.find('.descricao_item').val());
    $parent.find('.modal').modal('show');
}

function OpenModalEstoqueMinimo() {
    var $parent = $(":focus").parents("tr");
    $parent.find('.modal').modal('show');
}
 
function OpenModalEnderecoCliente() {
    $('#endereco-cliente').modal('show');
}



$(function () {  
// Search form.  
  $('#filter_form').submit(function () {  
    $.get(this.action, $(this).serialize(), null, 'script');  
    return false;  
  });   
    
  // Search form.  
  $('#search').submit(function () {  
    $.get(this.action, $(this).serialize(), null, 'script');  
    return false;  
  });  
}); 



function DynamicSelectOPMaterial()  {

var $parent = $(":focus").parents(".item"); 
$parent.find('.materials').each(function(i) {
  var key_method, tipo, tipo_dom_id,cliente, cliente_dom_id, produto, produto_dom_id, observer, observer_dom_id, prompt, regexp, regexp2, regexp3, url_mask, value_method;
  observer_dom_id = $(this).attr("id");
    
cliente_dom_id = $(this).data("option-cliente");
tipo_dom_id = $(this).data("option-tipo");
produto_dom_id = $(this).data("option-produto");
    
  url_mask = $(this).data("option-url");
  key_method = $(this).data("option-key-method");
  value_method = $(this).data("option-value-method");
  prompt = $("<option value=\"\">").text("Selecione");

regexp = 'cliente';
regexp2 = 'tipo';
regexp3 = 'produto';
    

  observer = $("select#" + observer_dom_id);
tipo = $("#" + tipo_dom_id);
cliente = $("#" + cliente_dom_id);
produto = $("#" + produto_dom_id);
    
  if (!observer.val() && tipo.size() > 1 && cliente.size() > 1  && produto.size() > 1) {
    observer.attr("disabled", true);
  }

  observer.empty().append(prompt);
  if (!observer.val() && tipo.size() > 1  && cliente.size() > 1  && produto.size() > 1) {
    observer.attr('disabled', true);
  }
    
    var url;
    observer.empty().append(prompt);
    
    if (tipo.val() && cliente.val()) {
    url = url_mask.replace(regexp, cliente.val());
    url = url.replace(regexp2, tipo.val());
    url = url.replace(regexp3, produto.val());
        
      $.getJSON(url, function(data) {
        $.each(data, function(i, object) {
          console.log(data);
          observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
          observer.attr('disabled', false);
        });
      });
    }
});
}
