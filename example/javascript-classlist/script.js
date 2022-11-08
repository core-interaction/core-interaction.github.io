window.addEventListener('DOMContentLoaded', () => { // Wait for parse.
	let highlightClass = 'highlight'; // Set up variables.
	let textBlock = document.querySelector('section'); // Any selector.
	let switchButton = document.querySelector('#example');

	switchButton.onclick = () => { // Attach the event.
		textBlock.classList.toggle(highlightClass); // Toggle the class!
	};
});