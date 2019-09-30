function calendar() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; 
	var today = date.getDate();
	let dayOfWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	var toWeek = dayOfWeek[date.getDay()];
	
	for (var i = 0; i < 7; i++) {
		
		if(i > 0) {
			date.setDate(date.getDate() + 1);
			year = date.getFullYear();
			month = date.getMonth() + 1;
			today = date.getDate();
			toWeek = dayOfWeek[date.getDay()];
		}

		var html = "";
			html += '<div class="dateBox">';
			html += '<p data-year="' + year + '" data-month="' + month + '" class="day">' + today + '</p>';
			html += '<span class="dayOfWeek">' + toWeek + '</span>';
			html += '</div>';
		
		$(".dateNav").append(html);
	}	
}
