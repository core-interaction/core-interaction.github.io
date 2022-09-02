---
layout: null
---



const scrollClass = 'scrolled'

watchScroll = (main) => {
	const mainTop =  main.getBoundingClientRect().top

	const checkMainTop = () => (window.scrollY > mainTop) ? document.body.classList.add(scrollClass) : document.body.classList.remove(scrollClass)

	window.addEventListener('load', checkMainTop)
	window.addEventListener('resize', checkMainTop)
	window.addEventListener('scroll', checkMainTop)
}

document.addEventListener('DOMContentLoaded', () => {
	watchScroll(document.querySelector('main'))
})
