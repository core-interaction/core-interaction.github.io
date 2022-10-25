---
title: Jekyll, Liquid, and Markdown
order: 8
published: false
---



We’re going to cover several topics here, under a sort of umbrella topic of *making it less annoying to work with HTML*.
{: .left }

- [Jekyll - Simple, blog-aware, static sites](https://jekyllrb.com) \
*We’ll be using Jekyll as our CMS/static site generator.*

- [Creating a site | Jekyll](https://www.youtube.com/watch?v=pxua_1vyFck&list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB&index=4) \
*Series of videos with a very chipper guy going through features.*

- [Liquid template language](https://shopify.github.io/liquid/) \
*The templating language/syntax that Jekyll uses.*

- [Getting Started | Markdown Guide](https://www.markdownguide.org/getting-started/) \
*The <em>lingua franca</em> markup language these days. Also, the site was [made in Jekyll](https://github.com/mattcone/markdown-guide)!*
{: .no-marker .icon-link  .right rows='5' }

Everything you’ve been working on up to this point has been *hand-written*, meaning every line of code the browser renders is something you have typed (or copied/pasted), “by hand.”

This is how the web started, and is still (I think) the best way to learn the basics—but it is rarely how modern web pages are actually put together anymore. At scale, hand-coding is quickly [*brittle*](https://en.wikipedia.org/wiki/Software_brittleness), especially when you are iterating across many pages.

Instead, almost all websites use some form of *templating*, where one piece of HTML (in a single file) is used repeatedly—either assembled by your computer or by the server—across multiple web pages. Sometimes they are put together (we’ll say *compiled* or *built*) once; other times they are created every time someone goes to the page.

And as we’ve said before, when you are writing the same exact code over and over, there is probably a shorter way. [Don’t repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)!
