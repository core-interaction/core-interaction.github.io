window.addEventListener('DOMContentLoaded', () => { // Wait for parse.
	let highlightClass = 'highlight'; // Set up variables.
	let highlightBlock = document.querySelector('section:nth-child(4)');

	// Set up an IntersectionObserver.
	let sectionObserver = new IntersectionObserver(entries => {
		let [entry] = entries; // Don’t worry about this, for now.
		// When it is intersecting, apply the class; otherwise, remove it.
		if (entry.isIntersecting) {
			highlightBlock.classList.add(highlightClass);
		} else {
			highlightBlock.classList.remove(highlightClass);
		}
	});

	sectionObserver.observe(highlightBlock); // Watch for it!
});
