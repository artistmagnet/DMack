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
  $(function () {
	  window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
	  // alert(link);
	  var $tr = $(link).closest('table').find('tbody tr:last');
	  var new_id = new Date().getTime();
	  // console.log(new_id);
	  var new_tr = $tr;
	  new_tr = "<tr class='fields'>"+new_tr.html().replace(/0/g,new_id)+"</tr>";
	  // var dataArray = new Array();
	  // new_tr = new_tr.html().replace(/0/g,new_id);
	  
	  // var new_tr = $tr.find('td').each(function (i) {
	  // 	if(i<6){
   //      	var td_class = $(this).find('input').attr('id').replace("0",new_id);
   //      	var name_tds = $(this).find('input').attr('name').replace("0",new_id);
   //      	dataArray.push(td_class);
   //      }
   //     })
	  // alert(new_tr);
	  return $(new_tr).insertAfter($tr);
   }
  });
});
// function tags(){
// 	$('.tag-input').tagsinput('add', 'some tag');
// }