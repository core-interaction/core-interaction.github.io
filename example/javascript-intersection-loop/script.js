let highlightClass = 'highlight'; // Variables again.
let highlightBlocks = document.querySelectorAll('section'); // All.

// Loop through the list, doing this `forEach` one.
highlightBlocks.forEach((block) => {
	let sectionObserver = new IntersectionObserver(entries => {
		let [entry] = entries;

		// This is a "ternary" operator——a condensed if/else.
		entry.isIntersecting ? block.classList.add(highlightClass) : block.classList.remove(highlightClass); 
	}, {
		root: document, // This is only needed in the example iframe!
		rootMargin: '-33% 0% -33% 0%', // CSS-ish: top/right/bottom/left.
	});

	sectionObserver.observe(block); // Watch each one!
});
