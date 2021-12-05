var cardState = 0;

function flip_card() {

	var infoUL = document.getElementById('infoUL');
	var qrUL = document.getElementById('qrUL');
	var btn = document.getElementById('qrBtn');

	if (cardState === 0) {
		infoUL.style.display = "none";
		qrUL.style.display = "flex";
		btn.innerHTML = "Info";
		cardState = 1;
	} else {
		infoUL.style.display = "flex";
		qrUL.style.display = "none";
		btn.innerHTML = "QR Code";
		cardState = 0;
	}

}
