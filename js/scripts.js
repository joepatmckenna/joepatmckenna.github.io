$(document).ready(function() {
	$('.anchor').addClass('anchor-offset');
	var navpos = $('#navbar-bottom').offset();
	$(window).bind('scroll', function() {
		if ($(window).scrollTop() > navpos.top) {
			$('#navbar-bottom').addClass('fixed');
			$('.anchor').removeClass('anchor-offset');
		}
		else {
			$('#navbar-bottom').removeClass('fixed');
			$('.anchor').addClass('anchor-offset');
		}
	});
});
$('a').click(function(){
	$('html, body').animate({scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top}, 500);
	return false;
});
function dim(element) {
	TweenLite.to(element, .3, {opacity:".8"})			
}
function brighten(element) {
	TweenLite.to(element, .3, {opacity:"0"})			
}
function animate_logo(id) {
	var link = "img/" + id + ".gif";
	document.getElementById(id).src = link;
}
function show_icon(icon_id) {
	TweenLite.to(document.getElementById(icon_id), .3, {opacity:"1"})			
}
function hide_icon(icon_id) {
	TweenLite.to(document.getElementById(icon_id), .3, {opacity:"0"})			
}
function show_syllabus(subject) {
	var viewer = document.getElementById('pdf-viewer'); 	
	var link = "http://docs.google.com/viewer?url=http%3A%2F%2Fwww.math.fsu.edu%2F~jmckenna%2F"
	+ subject + "%2Fsyllabus.pdf&embedded=true";
	if((viewer.style.display == "block") && (viewer.src == link)) {
		viewer.style.display = "none";
	} else {
		viewer.src = link;
		viewer.style.display = "block";
	}
}
function show_pdf(subject, category) {
	var viewer = document.getElementById('pdf-viewer'); 	
	var form_id = category + "-select";
	var number = document.getElementById(form_id).value;
	var syllabus_link = "http://docs.google.com/viewer?url=http%3A%2F%2Fwww.math.fsu.edu%2F~jmckenna%2F"
	+ subject + "%2Fsyllabus.pdf&embedded=true";
	if(number == "select") {
		if(viewer.src != syllabus_link) {
			viewer.style.display = "none";
		}
	} else {
		var link = "http://docs.google.com/viewer?url=http%3A%2F%2Fwww.math.fsu.edu%2F~jmckenna%2F" 
		+ subject + "%2F" + category + "%2F" + number + ".pdf&embedded=true";
		viewer.src = link;
		viewer.style.display = "block";	
	}
}
