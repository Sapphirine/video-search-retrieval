/*!
 * Start Bootstrap - Agency Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

// My Own JS

dict = {}

dict["video1"] = [  "http://www.youtube.com/embed/NO0bxkK_isY",
					"http://www.youtube.com/embed/uFECbEiquRA",
					"http://www.youtube.com/embed/CRNjCQdRETw",
					"http://www.youtube.com/embed/p4dNUMMuM6s",
					"http://www.youtube.com/embed/gzJjbOQ6iHQ",
					"http://www.youtube.com/embed/q1ddKsMNgdI",
					]


dict["video2"] = [  "http://www.youtube.com/embed/-JY5Wkcp2BU",
					"http://www.youtube.com/embed/UwXCchMurxg",
					"http://www.youtube.com/embed/xfRbyawleP4",
					"http://www.youtube.com/embed/QcFXtbARp5k",
					"http://www.youtube.com/embed/imRJVMS1NPE",
					"http://www.youtube.com/embed/Eq8ftoKAC1M",
					]

dict["video3"] = [  "http://www.youtube.com/embed/2xNvL2UrZ4Y",
					"http://www.youtube.com/embed/pCyREHEq_MQ",
					"http://www.youtube.com/embed/kIn8e0AcDL0",
					"http://www.youtube.com/embed/lPvWVNPqq40",
					"http://www.youtube.com/embed/Y7ZpWwja_1c",
					"http://www.youtube.com/embed/JwFetH4yfJI",
					]

dict["video4"] = [  "http://www.youtube.com/embed/_QX69YnBi5Q",
					"http://www.youtube.com/embed/0qveIRMnr9k",
					"http://www.youtube.com/embed/EaUz9dSt5CI",
					"http://www.youtube.com/embed/AhVsQSANRMQ",
					"http://www.youtube.com/embed/CIjwVx94LrU",
					"http://www.youtube.com/embed/OyfrsbSBr9U",
					]

dict["video5"] = [  "http://www.youtube.com/embed/sykdwT2Z0o0",
					"http://www.youtube.com/embed/yRkbEO70m-A",
					"http://www.youtube.com/embed/hxhKM-yq6v8",
					"http://www.youtube.com/embed/sz9bPRPZLoo",
					"http://www.youtube.com/embed/NTpuAxhKBq4",
					"http://www.youtube.com/embed/KT2nrSqlP-I",
					]

dict["video6"] = [  "http://www.youtube.com/embed/fIbph92qtjU",
					"http://www.youtube.com/embed/awUDU6zXIr8",
					"http://www.youtube.com/embed/6C0m8GjEPc4",
					"http://www.youtube.com/embed/NsNBJQTb9Qg",
					"http://www.youtube.com/embed/9DwppQ_7pDA",
					"http://www.youtube.com/embed/FuAPDw0U_gk",
					]

$("#btn-submitVideo").click(function() {
	selectedIdx = $('input[name=radioGroup]:checked').val();
	//console.log(a)
	result = dict[selectedIdx]

	$("#panel-result").empty()
	for(var i = 0; i < result.length; i=i+2){
		string =  '<div class="row"><div class="col-md-6 videoItem"><iframe id="player" width="100%" type="text/html" src="REPLACE_1" frameborder="0"></iframe><p>REPLACE_1_1</p></div><div class="col-md-6 videoItem"><iframe id="player" width="100%" type="text/html" src="REPLACE_2" frameborder="0"></iframe><p>REPLACE_2_1</p><div></div>'
		console.log(i)
		string = string.replace("REPLACE_1", result[i])
		string = string.replace("REPLACE_1_1", "Result " + i)
		string = string.replace("REPLACE_2", result[i+1])
		string = string.replace("REPLACE_2_1", "Result " + (i+1))
		
		$("#panel-result").append(string)
		//setTimeout(function (){
		//	$("#panel-result").append(string)
		//}, 1000);
	}
});

$("#btn-clearVideo").click(function() {
	$("#panel-result").empty()
});



