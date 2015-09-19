// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.remotipart
//= require bootstrap.min
//= require bootstrap-tagsinput.min
//= require jquery_nested_form
//= require plugins/enscroll.min
//= require plugins/footable.min
//= require plugins/icheck.min
//= require main
//= require chosen
//= require custom
//= require layouts
//= require productions
//= require chosen-jquery
//= require live_validation
//= require jquery.dragtable
//= require nested_forms

$(document).ready(function(){
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})

	$(function () {
	  $('[data-toggle="popover"]').popover({ trigger: "hover" });
	})
	$(function() {
		$( "#datepicker" ).datepicker();
	});
	$(function() {
		$( ".datepicker" ).datepicker();
	});
  $('.alert .close').on('click', function(e) {
      $(this).parent().hide();
  });
  
});
// function tags(){
// 	$('.tag-input').tagsinput('add', 'some tag');
// }