// This waits until the browser parses the page.
window.addEventListener('DOMContentLoaded', () => {
	// Set up a variable for our button!
	let button = document.querySelector('#example'); // Any CSS selector.

	button.onclick = () => { // Attach the click event.
		alert('Button was clicked!'); // Pop an alert!
	};
});
