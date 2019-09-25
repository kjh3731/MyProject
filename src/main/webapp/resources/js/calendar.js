function calendar() {
	
	var date = new Date();
	let dayOfWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	
	for (var i = 0; i < 7; i++) {
		
		var today = date.getDate();
		var toWeek = dayOfWeek[date.getDay()];
		
		if(i > 0) {
			date.setDate(date.getDate() + 1);
			today = date.getDate();
			toWeek = dayOfWeek[date.getDay()];
		}
		
		$(".dateNav").append(
				'<div class="dateBox">' +
					'<p class="day"></p>' +
					'<span class="dayOfWeek"></span>' +
				'</div>'
		);
		
		$(".day")[i].innerHTML = today;
		$(".dayOfWeek")[i].innerHTML = toWeek;
	}
}
