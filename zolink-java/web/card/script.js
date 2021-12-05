
function check_passwords() {

	document.getElementById('server_msg').innerHTML = '';

	if (document.getElementById('floatingPassword').value ==
            document.getElementById('floatingPassword2').value) {

		if (document.getElementById('floatingPassword').value.length < 6 &&
				document.getElementById('floatingPassword').value.length > 0) {
			document.getElementById('pass_check_msg').innerHTML = '<strong>Password must be at least six characters in length.</strong>';
			document.getElementById('submit_btn').disabled = true;
		} else {
			document.getElementById('submit_btn').disabled = false;
			document.getElementById('pass_check_msg').innerHTML = '';
		}

    } else {
        document.getElementById('submit_btn').disabled = true;
		document.getElementById('pass_check_msg').innerHTML = '<strong>Passwords do not match.</strong>';
    }

}
