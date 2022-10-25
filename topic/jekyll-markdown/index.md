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



## First, what is a CMS?

You’ll often hear people talk about [*content management systems*](https://en.wikipedia.org/wiki/Content_management_system) (CMSes). These are software programs that, well… manage content. There are many reasons to use a CMS, one of which is to separate your *content* from your *templates* (in HTML or JS) and *styles*. To some extend you can think of HTML as *an* expression of your content—but your content is really the text, images, and links—not really the syntax of elements and tags. (Another expression could be a PDF, let’s say.)
{: .left }

*Most CMSes run on a server and use a [database](https://en.wikipedia.org/wiki/Database) to store content, like  [WordPress](https://wordpress.com), [Squarespace](https://www.techradar.com/reviews/squarespace), [Wix](https://www.wix.com/), [Webflow](https://webflow.com), [Cargo](https://cargo.site). There are many.*
{: .right }


## Jekyll and static site generators

[Jekyll](https://jekyllrb.com) is a slightly nuanced/different take on the CMS idea—something called a [*static site generator*](https://www.cloudflare.com/learning/performance/static-site-generator/). This software runs discrete *builds* on your machine (or on a server, GitHub’s in our use)—cobbling together your different source content files and templates and outputting HTML, CSS, and JavaScript—ultimately no different from if you wrote them by hand, as we have. But it can assemble them *for us*.
{: .left }

*Other popular static site generators include [Hugo](https://gohugo.io), [Gatsby](https://www.gatsbyjs.com), [Next.js](https://nextjs.org) (…sorta), [Eleventy](https://jamstack.org/generators/eleventy/).*
{: .right }

<!-- Visual would be nice? -->

You can use Jekyll as a proper CMS/blogging-type platform, like Wordpress. It has support for all that stuff—[draft posts](https://jekyllrb.com/docs/posts/), [themes](https://jekyllthemes.io/), [authors](https://jekyllrb.com/docs/step-by-step/09-collections/), and so on. But we’re going to focus just on how it can make building our simple websites much easier.

> We’ll primarily be using the [template repo](https://github.com/core-interaction/harmonic-collection) to go through the code, but we’ll cover some concepts here.
{: .callout icon='🤚' }
