---
title: An intro to JavaScript
order: 10
published: false
---



JavaScript is the language/format for adding interactivity to a web page—based on actions or events from the user. Where do we even start with *JS*? (Everyone calls it JS.) It is so massive and often (trust me, I know) seems unapproachable. So we’ll go through a bit of background, and then look at some very practical examples you might want in your work.
{: .left }

* [JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript) \
*There are <em>literally</em> millions of sites about JS, but let’s start with MDN.*

* [Newest 'javascript' questions - Stack Overflow](https://stackoverflow.com/questions/tagged/javascript) \
*Great resource for many things, but especially/<wbr>famously for JS. It’s like Reddit for code!*
{: .icon-link .no-marker .right rows="3" }

Going back to our first analogy, JavaScript is the *muscles* of the web. Like [HTML](/topics/html) (the *bones*) and [CSS](/topics/css) (the *skin*), it is ultimately still just text that is parsed by our browsers. Like CSS, it can live within HTML documents, but is usually saved separately with the extension `.js`

JavaScript was first created by [Brendan Eich](https://brendaneich.com/2008/04/popularity/) over just 10 days in 1995, and has been through a myriad of evolutions, paths, missteps, and enhancements [since then](https://en.wikipedia.org/wiki/JavaScript). It has nothing formally to do with *Java*, confusingly—other than being contemporaries and sort-of competitors (thus the name), if you remember from [*What Is Code?*](http://javascript.info). (Coffee-culture was big in the 90s!) JavaScript won the race, by every measure, and is ubiquitous on the modern web.

> The idea was to make something that Web designers, people who may or may not have much programming training, could use to add a little bit of animation or a little bit of smarts to their Web forms and their Web pages.
{: .quote }

<cite>[Brendan Eich](https://www.infoworld.com/article/2653798/javascript-creator-ponders-past--future.html)</cite>

Like HTML/CSS, JavaScript was a malleable, *interpreted* (not [*compiled*](https://en.wikipedia.org/wiki/Compiled_language)) language running in the browser—meaning the source code could be seen by anyone, and anyone could borrow or modify it for their needs. And so as our computers—and thus our browsers—became faster and cheaper, JS was used for more and more things. Remember that now the tendrils of JavaScript [are almost everywhere](/topic/everything/#its-increasingly-just-js-behind-the-scenes)—running headless on servers, rendering whole sites, talking to hardware, processing NASA images, and so on. It’s web technologies, all the way down.

> Any application that can be written in JavaScript, will eventually be written in JavaScript.
{: .quote }

<cite>[Jeff Atwood](https://blog.codinghorror.com/the-principle-of-least-power/)</cite>




## Libraries/frameworks vs. plain/vanilla JS



You’ll often hear folks talk about *libraries* or *frameworks* in the context of JavaScript—one of the ways it is malleable. These are collections of Javascript code with their own specific ideas, paradigms, and syntax, that expand upon what the language can do (or can do quickly or easily) on its own, *out of the box*.

Things like [jQuery](https://jquery.com) (old-school, now), [Node](https://nodejs.org/en/), [React](https://reactjs.org), [Vue](https://vuejs.org), [Angular](https://angular.io), [D3](https://d3js.org), and [p5](https://p5js.org) (to name some popular ones) are all written *in* and are interfaced *with* (controlled *by*) JavaScript as well. They are often created to do something JavaScript doesn’t yet support on its own (in/famously, *jQuery*) or with a niche use/focus (like data-visualization, with *D3*). There are many, many frameworks and libraries.

When you write JS without libraries, it is usually called *plain* or *vanilla* JavaScript. The language has evolved so much that we can do a lot, here, and this is where we’ll start. And while JS does many things, we’ll first just use it in the most simple way—to make our web pages more interactive.



## Where does JS live

1. Inline on elements
2. Script tags in the page
3. Separate/external JS files

Talk about sync/async (events for external)



## Adding/removing a class



## Scrolling (IntersectionObserver)



## Other tips
