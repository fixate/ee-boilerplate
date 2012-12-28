$(document).ready(function() {
	$('#contact').validate({
		// Set up rules for each field in your form. Reference each one by its "name" not "id"
		rules: {
			Your_Name: { required: true },
			Email_Address: { required: true, email: true },
			Message: { required: true }
		}
	});

	// Submit form using AJAX and clear the submitted results
	$('#contact').ajaxForm({
		target: '#notification',
		url: "/assets/_js/plugins/contact-form/mail.php",
		success: successMessage,
		clearForm: true,
		resetForm: true
	});
});

// Fade in success message
function successMessage() {
	$('#notification').fadeIn();
}