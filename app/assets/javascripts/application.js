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
//= require cocoon
//= require_tree .
//= require bootstrap.min
//= require admin-lte
//= require 'icheck'

$(document).ready(function($) {
    $("input[type=text].currency").setMask('decimal');
    $("input[type=text].date_time").setMask('date');
    $("input[type=text].cnpj").setMask('cnpj');
});



function SubmitAndRemoveMask() {
    $("input[type=text].currency").setMask('decimal_default');
        $("input[type=text].cnpj").setMask('default');
}


function BuscarCep() {
    var $parent = $(":focus").parents(".nested-fields");
    var $cep = $parent.find('.cep').val();
    $.getJSON("/cep/busca_cep/" + $cep,
    function ( data ) {
      console.log(data);
      $parent.find(".logradouro").val(data.tipo_logradouro + ' ' + data.logradouro);
      $parent.find(".bairro").val(data.bairro);
      $parent.find(".cidade").val(data.cidade);
      $parent.find(".estado").select(data.uf);
    }
  );
}



function SomarItens() {
    var parent, valor, quantidade, subtotal, valorString, items, itemCount, total, itemString
    $("input[type=text].integer").setMask('integer');
    parent = $(":focus").parents(".nested-fields");
    valor = parent.find('.valor');
    quantidade = parent.find('.quantidade');    
    subtotal = parent.find('.subtotal');
    
    valorString = valor.val().replace(".", "");
    valorString = valorString.replace(",", ".");
    subtotal.val(valorString * quantidade.val().replace(".", ""));
    
    items = $(".subtotal");
    itemCount = items.length;
    total = 0;
    for(var i = 0; i < itemCount; i++)
    {
        itemString = items[i].value;
        total = total + parseFloat(itemString);
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
 
 
 
    
