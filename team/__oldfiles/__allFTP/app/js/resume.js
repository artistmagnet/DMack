  /*
   * Resume builder functions
   */

var undoData = new Array();
var defaults = new Array();
defaults["edu"] = '<div class="container"><table class="moveable-cells">'
+ '<thead><tr><th class="move">Name</th><th class="move">Area of Study</th>	<th class="move">Degree</th>'
+ '<th class="move">Instructor</th><th class="move">Address</th><th class="move">Year</th>'
+ '<th class="button"></th><th class="button"></th></tr></thead>'
+ '<tbody><tr class="move"><td><input type="text" name="college" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" name="study" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" name="degree" class="field" style="width:60px;"/></td>'
+ '<td><input type="text" name="instructor" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" name="address" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" name="year" class="field" style="width:30px;"/></td>'
+ '<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td>'
+ '<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td>'
+ '</tr></tbody></table></div>';
defaults["rep"] = '<div class="container"><table class="moveable-cells"><thead><tr>'
+ '<th class="move">Type</th><th class="move">Company</th><th class="move">Contact</th>'
+ '<th class="move">Title</th><th class="move">Phone</th><th class="move">Email</th>'
+ '<th class="move">Address</th><th class="button"></th><th class="button"></th>'
+ '</tr></thead><tbody><tr class="move">'
+ '<td><input type="text" name="type" class="field" style="width:50px;"/></td>'
+ '<td><input type="text" name="company" class="field" style="width:100px;"/></td>'
+ '<td><input type="text" name="contact" class="field" style="width:90px;"/></td>'
+ '<td><input type="text" name="title" class="field" style="width:50px;"/></td>'
+ '<td><input type="text" name="phone" class="field" style="width:70px;"/></td>'
+ '<td><input type="text" name="email" class="field" style="width:100px;"/></td>'
+ '<td><input type="text" name="address" class="field" style="width:100px;"/></td>'
+ '<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td>'
+ '<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td>'
+ '</tr></tbody></table></div>';
defaults["skills"] = '<div class="container"><table class="moveable-cells"><thead><tr>'
+ '<th>Category</th><th class="move">Skill</th><th class="move">Skill</th><th class="move">Skill</th>'
+ '<th class="move">Skill</th>'
+ '<th class="button"><button type="button" class="add-del add-col" title="Add column">+</button></th>' 
+ '<th class="button"><button type="button" class="add-del del-col hide" title="Remove last column">-</button></th>'									
+ '</tr></thead>'
+ '<tbody><tr class="move"><td><select name="category"' 
+ 'style="width:120px"><option value="Accent">Accent</option><option value="Athletics">Athletics</option>'
+ '<option value="Combat">Combat</option><option value="Dance">Dance</option><option value="Music">Music</option>'
+ '<option value="Singing">Singing</option><option value="Other">Other</option></select></td>'
+ '<td><input type="text" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" class="field" style="width:120px;"/></td>'
+ '<td><input type="text" class="field" style="width:120px;"/></td>'
+ '<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td>'
+ '<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td>'
+ '</tr></tbody></table>'
+ '<div id="otherCategory" class="hide"><label>Enter Category Title:</label>'
+ '<input type="text" name="otherSkill" maxlength="20"/>'
+ '<button id="addCategory" type="button" value="rowNo">Enter</button>'
+ '</div></div>';
defaults["other"] = '<div class="container"><table><tr><td><div style="text-align: right;"><label>Enter Section Title:</label>'
+ '<input type="text" name="sectionTitle" style="width:300px;"/></div></td></tr>'
+ '<tr><td><textarea rows="5" style="width: 727px"></textarea></td></tr></table></div>';
defaults["custom"] = '<div class="container"><table class="moveable-cells">'
+ '<div style="text-align: right;"><label>Enter Section Title:</label><input type="text" name="sectionTitle" style="width:300px;"/></div>'
+ '<thead><tr><th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>' 
+ '<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>'
+ '<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>'
+ '<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>'
+ '<th class="button"><button type="button" class="add-del add-col" title="Add column">+</button></th>' 
+ '<th class="button"><button type="button" class="add-del del-col hide" title="Remove last column">-</button></th>'									
+ '</tr></thead>'
+ '<tbody><tr class="move">'
+ '<td><input type="text" class="field" style="width:150px;"/></td>' 
+ '<td><input type="text" class="field" style="width:150px;"/></td>'
+ '<td><input type="text" class="field" style="width:150px;"/></td>'
+ '<td><input type="text" class="field" style="width:150px;"/></td>'
+ '<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td>'
+ '<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td>' 
+ '</tr></tbody></table></div>';


function addRow(element) {
	var row = $(element).parent().parent();
	var newElem = row.clone().appendTo(row.parent());
	$("button",row).addClass("hide");
	$("button",newElem).removeClass("hide");
	$('select', newElem).change(function () {
 		showfield(this);
 	});
	$('button.add-row', newElem).click (function () {
		addRow(this);
	});
	$('button.del-row', newElem).click (function () {
		delRow(this);
	});
}

function delRow(element) {
	var row = $(element).parent().parent();
	var table = row.parent();
	var container = table.parent().parent();
	var section = container.parent();
	var header = section.find('.header');
	var dataId = section.find('.undo-data').html();
	undoData[dataId] = container.clone();
	row.remove();
	section.find('.undo-action').html("delRowBtn");
	header.find('button.undoBtn').removeClass("hide");
	$(table).find('tr:last').find("button").removeClass("hide");
	$(table).find('tr:eq(0)').find("button:eq(1)").addClass("hide");
}

function addColumn(element) {
	var MAXWITH = 590.0;
	var row = $(element).parent().parent();
	var table = row.parent().parent();
	var eCols = row.find('th.extra-col').size();
	var fields = $("tbody tr:first input.field", table).length +
				$("tbody tr:first select", table).length;
	var container = row.closest('.container');
		var section = container.parent();
	var width = MAXWITH / (fields + 1);
	if (eCols < 2) {
		/*console.log ('w:'+width+' f:' + fields);*/
		row.find('th.button:first').prev()
				.after('<th class="extra-col move">'
				+ '<input type="text" value="Enter Column Title" '
				+ 'class="field" style="width:150px;"/></th>');
   		table.find("tbody > tr").each( function () {
   			$(this).find('td.button:first').prev().after('<td><input type="text" name="customrow" class="field" style="width:150px;"/></td>');
   		});
   		table.find("tbody > tr > td > input.field,select").each(function () {
   			$(this).css('width', width + 'px');
   		});
   		row.find("th > input[type=text],select").each(function () {
   			$(this).css('width', width + 'px');
   		});
   		row.find("button").removeClass("hide");
   		if (eCols == 1) $(element).addClass("hide");
   		var container = row.closest('.container');
   		var clone = container.clone();
   		container.remove();
   		section.append (clone);
   		/*if (movecols)*/ $("table.moveable-cells",clone)
   			.dragtable({dragaccept:'th.move'});
   		$("table.moveable-cells tbody",clone).sortable({
   			update: function(event, ui) {rowMove(event, this);}}
 		).disableSelection();
   		$('table.moveable-cells thead tr:first .field',clone)
   			.bind("mouseover", function () {
     		$(this).select().focus();
    	}).bind("mouseout", function () {
     		$(this).blur();
    	});
   		$('button.add-col',clone).click (function () {
	    	addColumn(this);
	    });
	    $('button.del-col',clone).click (function () {
	    	delColumn(this);
	    });
	    $('button.add-row',clone).click (function () {
	    	addRow(this);
	    });
	    $('button.del-row',clone).click (function () {
	    	delRow(this);
	    });	
	}
}

function delColumn(element) {
	var MAXWITH = 590.0;
		var row = $(element).parent().parent();
		var table = $(row).parent().parent();
	var eCols = row.find('th.extra-col').size();
	var fields = $("tbody tr:first input.field", table).length +
				$("tbody tr:first select", table).length;
	var container = row.closest('.container');
	var section = container.parent();
	var header = section.find('.header');
	var dataId = section.find('.undo-data').html();
	var width = MAXWITH / (fields - 1);
	if (eCols > 0) {
		/*console.log ('w:'+width+' f:' + fields);*/
		$('.undo-action',section).html("delColBtn");
		$('button.undoBtn', header).removeClass("hide");
			undoData[dataId] = container.clone();
			row.find('th.extra-col:last').remove();
		table.find("tbody > tr").each( function () {
			$(this).find('td.button:first').prev().remove();
		});
		table.find("tbody > tr > td > input.field,select").each(function () {
			$(this).css('width', width + 'px');
		});
		row.find("th > input[type=text],select").each(function () {
			$(this).css('width', width + 'px');
		});
		row.find("button").removeClass("hide");
		if (eCols == 1) $(element).addClass("hide");
	};
}

function showfield(element){
	var name =  $(element).find ("option:selected").val();
	var container  = $(element).closest('.container').find('#otherCategory');
	if(name=='Other') {
		container.removeClass("hide");
		container.find ('button').val($(element)
				.closest("tr")[0].rowIndex);
		$('input', container).val('');
	} else {
		container.addClass('hide');
	};
}

function addCategory (element) {
	var other = $(element).parent();
	var container = other.parent();
	var val = $('input', other).val();
	if (val != "") {
		var row = $('tbody > tr',container)[parseInt($(other).find('button').val())-1];
		var defaultSelected = false;
	    var nowSelected     = true;
	    $('select > option:first', row)
	    	.before(new Option(val,val,defaultSelected,nowSelected));
	    other.addClass('hide');
	};
}

function generateCustomSection() {
	var section = $('.custom-section:last');
	section.after('<div class="section-box custom-section">'
	+ '<div class="undo-action hide"></div><div class="undo-data hide"></div>'
	+ '<div class="section-type hide">custom</div><div class="header move"><span>Custom</span>'
	+ '<button type="button" class="section-button hide undoBtn" onclick="undoSection(this)">Undo</button>'
	+ '<button type="button" class="section-button restoreBtn" onclick="restoreDefaultSection(this, \'custom\')">Restore Default</button>'
	+ '<button type="button" class="section-button deleteBtn" onclick="removeSection(this)">Delete Section</button>'
	+ '</div>' + defaults["custom"] + '</div>');
	section = $('.custom-section:last');
	$("table.moveable-cells tbody",section).sortable({
		   update: function(event, ui) {rowMove(event, this);}}).disableSelection();
	$('div.undo-data',section).html(Math.uuidCompact());
	$('table.moveable-cells',section).dragtable({dragaccept:'th.move'});
	$('table.moveable-cells thead tr:first .field',section).bind("mouseover", function () {
 		$(this).select().focus();
	}).bind("mouseout", function () {
 		$(this).blur();
	});
	$('button.add-col',section).click (function () {
    	addColumn(this);
    });
    $('button.del-col',section).click (function () {
    	delColumn(this);
    });
    $('button.add-row',section).click (function () {
    	addRow(this);
    });
    $('button.del-row',section).click (function () {
    	delRow(this);
    });	
}	

function generateOtherSection() {
	$('.others-section:last').after('<div class="section-box others-section">'
	+ '<div class="undo-action hide"></div><div class="undo-data hide"></div>'
	+ '<div class="section-type hide">other</div><div class="header move"><span>Other</span>'
	+ '<button type="button" class="section-button hide undoBtn" onclick="undoSection(this)">Undo</button>'
	+ '<button type="button" class="section-button restoreBtn" onclick="restoreDefaultSection(this,\'other\')">Restore Default</button>'
	+ '<button type="button" class="section-button deleteBtn" onclick="removeSection(this)">Delete Section</button>'
	+ '</div>' + defaults["other"] + '</div>');
}

function removeSection(button) {
	var header = button.parentNode;
	var section = header.parentNode;
	var dataId = $(section).find('.undo-data').html();
	// JQuery clone bugfix. Value not assign to text.
	$(section).find('textarea').each( function() {$(this).text($(this).val());});
	undoData[dataId] = $(section).find('.container').clone();
	$(section).find('.undo-action').html("deleteBtn");
	$(section).find('.container').remove();
	$(header).find('button.deleteBtn').addClass('hide');
	$(header).find('button.undoBtn').removeClass('hide');
}

function restoreDefaultSection(button) {
	var header = button.parentNode;
	var section = header.parentNode;
	var dataId = $(section).find('.undo-data').html();
	var type = $('.section-type', section).html();
	$('textarea', section).each( function() {$(this).text($(this).val());});
	undoData[dataId] = $(section).find('.container').clone();
	$(section).find('.undo-action').html("restoreBtn");
	$(section).find('.container').remove();
	$(section).append (defaults[type]);
	$(section).find('.moveable-cells tbody').sortable({
		   update: function(event, ui) {rowMove(event, this);}})
	.disableSelection();
	$(section).find(".moveable-cells thead tr:first .field")
		.bind("mouseover", function () {
	 		$(this).select().focus();
		}).bind("mouseout", function () {
	 		$(this).blur();
	});
	$(section).find('.container table').dragtable({dragaccept:'th.move'});
	$(header).find('button.restoreBtn').addClass("hide");
	$(header).find('button.undoBtn').removeClass('hide');
	if (type == 'skills') {
		$('select[name="category"]',section).change(function () {
	 		showfield(this);
	 	});
		$('#addCategory',section).click(function () {
	 		addCategory(this);
		});
	}
	$('button.add-col',section).click (function () {
	   	addColumn(this);
	});
    $('button.del-col',section).click (function () {
    	delColumn(this);
    });
    $('button.add-row',section).click (function () {
    	addRow(this);
    });
    $('button.del-row',section).click (function () {
    	delRow(this);
    });	
}

function undoSection(button) {
	var header = button.parentNode;
	var section = header.parentNode;
	var action = $('.undo-action', section).html();
	var dataId = $('.undo-data', section).html();
	if (action == "delRowBtn" || action == "restoreBtn"
		|| action == "delColBtn" ) {
		$(section).find('.container').remove();
	}
	$(section).append (undoData[dataId]);
	$(section).find(".moveable-cells tbody").sortable({
		   update: function(event, ui) {rowMove(event, this);}})
	.disableSelection();
	$(section).find(".container table").dragtable({dragaccept:'th.move'});
	$(section).find(".moveable-cells thead tr:first .field")
		.bind("mouseover", function () {
	 		$(this).select().focus();
		}).bind("mouseout", function () {
	 		$(this).blur();
	});
	$(header).find("button.deleteBtn").removeClass("hide");
	$(header).find("button.restoreBtn").removeClass("hide");
	$(header).find("button.undoBtn").addClass("hide");
	$('.container tbody select[name="category"]',section).change(function () {
 		showfield(this);
 	});
	$('#otherCategory button',section).click(function () {
 		addCategory(this);
	});
	$('button.add-col',section).click (function () {
    	addColumn(this);
    });
    $('button.del-col',section).click (function () {
    	delColumn(this);
    });
    $('button.add-row',section).click (function () {
    	addRow(this);
    });
    $('button.del-row',section).click (function () {
    	delRow(this);
    });	
}

function rowMove (event, element) {
	// Remove buttons from view
	$(element).find("button").addClass("hide");
	// Add buttons at last row
	$(element.parentNode).find('tr:last').find("button").removeClass("hide");
}

function bindAddDelButtons() {
	$('button.add-col').click (function () {
	    addColumn(this);
 	});
 	$('button.del-col').click (function () {
 		delColumn(this);
 	});	
 	$('button.add-row').click (function () {
	    	addRow(this);
 	});
 	$('button.del-row').click (function () {
 		delRow(this);
 	});	
}

function buildSectionsDataToSave() {
	try {
    	var toSave = $('#toSave');
    	var copy = null;
		// Clone elements data
    	$('.section-box textarea').each(function () {
			var textarea = $(this);
			textarea.text(textarea.val());
		});
		$('.section-box select').each(function () {
			var select = $(this);
			var selected = select.val();
			/*console.log('idx:'+select.val());*/
			$('option', select).each(function () {
				var option = $(this);
				option.removeAttr("selected");
				if (option.val() == selected) {
					option.attr('selected','selected');
				}
    		});
			select.val(selected);
		});
		$('.section-box input', copy).each(function () {
			var input = $(this);
    		input.attr ('value', input.val());
		});
    	copy = $('#page-content form').clone(true,true);
    	// Remove section data
    	$('input:first', copy).remove();
    	// Remove db data
    	$('#sectionsDataDB', copy).remove();
    	// Remove box with account type
    	$('div.box:first', copy).remove();
    	// Remove footer with buttoms
    	$('#formfooter', copy).remove();
    	// Remove empty sections
    	$('.section-box', copy).each(function () {
    		if ($('.container', this).length == 0) $(this).remove();
    	});
    	// Remove undo ids
    	$('.undo-data', copy).html('');
    	toSave.val(copy.html());
    	buildSectionsDataToDB();
	} catch (e) {
		console.log(e);  
	}
}

function drawResumeView () {
	var data = $('#data');
	var target = $('#inject');
	$('.section-box', data).each (function (){
		var title = $('input[name=\'sectionTitle\']', $(this)).val();
		var name = $('.header span', $(this)).text();
		var secType = $('.section-type', $(this)).text();
		var header = $('.container thead', $(this));
		var body = $('.container tbody', $(this));
		var secText = '<table>';
		target.append ('<p class="rname3">'+(title||name)+'</p>');
		if (secType == 'theatre' || secType == 'custom'
			|| secType == 'rep' || secType == 'edu') {
			secText += '<tr>';
			$('th:not(.button,.hide)', header).each (function () {
				secText += '<th><p class="resume_b">' + 
				 ($('.field', $(this)).val() || $(this).text()) + '</p></th>';
			});
			secText += '</tr>';
			$('tr', body).each (function () {
				secText += '<tr>';
				$('td:not(.button,.hide)',  $(this)).each (function () {
 					secText += '<td><p class="resume">' + 
 					$('.field', $(this)).val() + '</p></td>';
 				});
				secText += '</tr>';
			});
		} else if (secType == 'other') {
			secText += '<tr>';
			$('textarea', body).each (function () {
				secText += '<td><p class="resume">' + 
				  $(this).text()+ '</p></td>';
			});
			secText += '</tr>';
		/*} else if (secType == 'rep' || secType == 'edu') {
			var rows = $('tr', body).length;
			var colNo = 0;
			$('th:not(.button)', header).each (function () {
				secText += '<tr><td><p class="resume">' +  $(this).text() + ': ';
				$('tr', body).each (function () {
					var rowsNo = 1;
 					$('td:eq('+colNo+')', $(this)).each (function () {
 	 					secText += $('.field', $(this)).val() ;
 	 					if (rowsNo < rows) secText += ', ';
 	 					rowsNo++;
 	 				});
 				});
				colNo++;
				secText += '</p></td></tr>';
			});*/
		} else if (secType == 'skills') {
			$('tr', body).each (function () {
				secText += '<tr><td><p class="resume">' +  $('select',$(this)).val() + ': ';
				var cols = $('.field', $(this)).length;
				var colNo = 1;
				$('.field', $(this)).each (function () {
 					secText += $(this).val();
 					if (colNo < cols) secText += ', ';
 					colNo++;
 				});
 				secText += '</p></td></tr>';
			}); 			
		}
		secText += '</table>';
		target.append (secText);
	});
}


function createInput (name, value) {
	var i = $('<input type="text" />');
	i.val(value);
	i.attr("name", "data:"+name);
	return i;
}

function buildSectionsDataToDB() {
	try {
    	var toDB = $('#sectionsDataDB');
    	var root = $('#page-content form');
    	var secNo = 0;
    	var colNo = 0;
    	var rowNo = 0;
    	toDB.empty();
    	$('.section-box', root).each(function () {
    		if ($('.container', $(this)).length != 0) {
    			var title = $('input[name=\'sectionTitle\']', $(this)).val();
    			var name = $('.header span', $(this)).text();
    			var secType = $('.section-type', $(this)).text();
    			var header = $('.container thead', $(this));
    			var body = $('.container tbody', $(this));
    			var data = createInput(secType + ":" + secNo, (title||name));
    			toDB.append (data);
    			if (secType == 'other') {
    				colNo = 0;
    				rowNo = 0;        				
    				$('textarea', body).each (function () {
    					data = createInput(secType + ":" + secNo + ":" + colNo 
    							+ ":" + rowNo, $(this).val());
						toDB.append (data);
						rowNo++;
    				});
    			} else {
    				colNo = 0;
    				$('th:not(.button,.hide)', header).each (function () {
    					data = createInput(secType + ":" + secNo + ":" + colNo, 
    								$('.field', $(this)).val() || $(this).text());
    					toDB.append (data);
    					rowNo = 0;
    					$('tr', body).each (function () {
        					$('td:eq('+colNo+')', $(this)).each (function () {
        						data = createInput(secType + ":" + secNo + ":" 
        								+ colNo + ":" + rowNo, 
        								($('.field', $(this)).val()
        										|| $('select', $(this)).val()));
          						toDB.append (data);
        						rowNo++;
        	 				});
        				});
    					colNo++;
    				});
    			}
    			secNo++;
    		}
    	});
    	console.log(toDB.html());  
	} catch (e) {
		console.log(e);  
	}
}
