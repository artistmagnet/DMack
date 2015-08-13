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
//= require dragtable

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
	  var $tr = $(link).closest('table').find('tbody tr:last');
	  var new_id = new Date().getTime();
	  var new_tr = $($tr).clone();
	  
	  new_tr.find('td').each(function(i,el){
        var tr_input = $(el).find('input');
        tr_input.attr('placeholder','').val('');
        var id_val = tr_input.attr('id');
        if(i<6){
	        
	        if(id_val=="1"||id_val=="2"||id_val=="3"||id_val=="4"||id_val=="5"||id_val=="6"){
	        	var name = tr_input.attr('name');
	        	var new_name = "resume[educations_attributes]["+new_id+"]["+name+"]";
	        	tr_input.attr('name',new_name);
	        	tr_input.attr('id',"resume_educations_attributes_"+new_id+"_"+name);
	        	
	        }
	        else{
		        var id_arr = id_val.split("_");
		        id_arr[3] = new_id; 
		        var new_name = id_arr[0]+"["+id_arr[1]+"_"+id_arr[2]+"]"+"["+id_arr[3]+"]"+"["+id_arr[4]+"]";
		        tr_input.attr('name',new_name);
		        $(el).find('input').attr('id',id_arr.join("_"));
		        
	    	} 
	    } 
	  });
	  new_tr = "<tr class='fields'>"+new_tr.html()+"</tr>";
	  return $(new_tr).insertAfter($tr);
   }
  });
});
// function tags(){
// 	$('.tag-input').tagsinput('add', 'some tag');
// }