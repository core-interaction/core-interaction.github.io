window.addEventListener('DOMContentLoaded', () => { // Wait for parsing.
	let clickedClass = 'clicked'; // Set up variables.
	let textBlock = document.querySelector('section'); // Any selector.
	let switchButton = document.querySelector('#example');

	switchButton.onclick = () => { // Attach the event.
		textBlock.classList.toggle(clickedClass); // Toggle the class!
	};
});
