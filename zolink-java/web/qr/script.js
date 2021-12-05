
async function getQR(code = '') {
	fetch("https://qrcode-monkey.p.rapidapi.com/qr/custom", {
		"method": "POST",
		"headers": {
			"content-type": "application/json",
			"x-rapidapi-host": "qrcode-monkey.p.rapidapi.com",
			"x-rapidapi-key": "a6d87630f1msh69ea6e69445a4eap106132jsn3d540f434d4e"
		},
		"body": {
			"data": "http://zolink.com/",
			"config": {
				"body": "rounded-pointed",
				"eye": "frame14",
				"eyeBall": "ball16",
				"erf1": [],
				"erf2": [
					"fh"
				],
				"erf3": [
					"fv"
				],
				"brf1": [],
				"brf2": [
					"fh"
				],
				"brf3": [
					"fv"
				],
				"bodyColor": "#5C8B29",
				"bgColor": "#FFFFFF",
				"eye1Color": "#3F6B2B",
				"eye2Color": "#3F6B2B",
				"eye3Color": "#3F6B2B",
				"eyeBall1Color": "#60A541",
				"eyeBall2Color": "#60A541",
				"eyeBall3Color": "#60A541",
				"gradientColor1": "#5C8B29",
				"gradientColor2": "#25492F",
				"gradientType": "radial",
				"gradientOnEyes": false,
				"logo": ""
			},
			"size": 300,
			"download": false,
			"file": "png"
		}
	})
	.then(response => response.blob())
	.then(imageBlob => {
		// create a local URL for that image and print it
		const imageObjectURL = URL.createObjectURL(imageBlob);
		document.getElementById("qrCodeContainer").setAttribute('src', imageObjectURL);
		console.log(imageObjectURL);
	})
	.catch(err => {
		console.error(err);
	});
}