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
    var $parent = $(":focus").parents(".nested-fields");
    var $valor = $parent.find('.valor');
    var $quantidade = $parent.find('.quantidade');    
    var $subtotal = $parent.find('.subtotal');
    console.log( $valor.val().replace(",", ".") * $quantidade.val());
    $subtotal.val($valor.val().replace(",", ".") * $quantidade.val().replace(".", ""));
}




function DynamicSelect()  {
    var $parent = $(":focus").parents(".nested-fields"); 
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


 

    
