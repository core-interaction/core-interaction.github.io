---
title: An intro to JavaScript
order: 10
published: false
---



JavaScript is the language/format for adding interactivity to a web page—based on actions or events from the user. Where do we even start with *JS*? (Everyone calls it JS.) It is so massive and often (trust me, I know) seems unapproachable. So we’ll go through a bit of background, and then look at some very practical examples you might want in your work.
{: .left }

* [JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Learn/JavaScript) \
*There are <em>literally</em> millions of sites about JS, but let’s start with MDN.*

* [Newest 'javascript' questions - Stack Overflow](https://stackoverflow.com/questions/tagged/javascript) \
*Great resource for many things, but especially/<wbr>famously for JS. It’s like Reddit for code!*

* [The Modern Javascript Tutorial](https://javascript.info) \
*This reference goes very advanced/<wbr>in-depth.*
{: .icon-link .no-marker .right rows="3" }

Going back to our first analogy, JavaScript is the *muscles* of the web. Like [HTML](/topics/html) (the *bones*) and [CSS](/topics/css) (the *skin*), it is ultimately still just text that is parsed by our browsers. Like CSS, it can live within HTML documents, but is usually saved separately with the extension `.js`

JavaScript was first created by [Brendan Eich](https://brendaneich.com/2008/04/popularity/) over just 10 days in 1995, and has been through a myriad of evolutions, paths, missteps, and enhancements [since then](https://en.wikipedia.org/wiki/JavaScript). It has nothing formally to do with *Java*, confusingly—other than being contemporaries and sort-of competitors (thus the name), if you remember from [*What Is Code?*](http://javascript.info). (Coffee-culture was really big in the 90s!) JavaScript won the race, by every measure, and is ubiquitous on the modern web.

> The idea was to make something that Web designers, people who may or may not have much programming training, could use to add a little bit of animation or a little bit of smarts to their Web forms and their Web pages.
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



## Where does JS live?



Very much [like CSS](/topics/css/#where-css-lives), JavaScript code can live in several places:

1. *Inline* as attributes
1. Via `<script>` elements within HTML documents
1. As separate/external `*.js` files



### 1. Inline event handlers

JS was first added directly like [*attributes*](/topic/html/#attributes) in HTML tags, just like CSS—but attached/listening for [specific events](https://www.w3schools.com/tags/ref_eventattributes.asp):

*INLINE ONCLICK/ALERT EXAMPLE*

This works for very, very simple things, but—for many of the same reasons as inline CSS—is brittle and doesn’t scale with complexity or across multiple pages.

> You might see these in old examples/code, but don’t use these now! If you see them, it’s probably an indication the code is outdated.
{: .callout icon='☝️' }



### 2. `<script>` tags

Again like CSS, JavaScript can be enclosed in a special [\<script> tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script). (These are also, somewhat confusingly, called *inline* scripts.) Anything inside the tag is executed right away, in the order/position they are in the HTML document:

*SCRIPT TAG ALERT EXAMPLE*

Note the different `// comment syntax` for JS!



Since this script tag isn’t directly *on* an element anymore, we then have to use [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) to *attach* the event to our element, which we can *target* with [querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector):

*SCRIPT TAG EVENT/TARGET EXAMPLE*

Here we store (declare) the element as a [variable](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Variables), to keep our code readable! These are a bit like their [CSS counterparts](/topic/responsive/#briefly-css-variables).



#### Also, `<noscript>`

Some folks block/disable JavaScript—for performance or accessibility reasons, or to hide advertising/annoyances, [and so on](https://softwareengineering.stackexchange.com/questions/26179/why-do-people-disable-javascript). This is less and less common these days, since so many sites *completely rely* on JS. It isn’t always feasible to replicate your site behavior entirely *without* JS, but you can use a special [\<noscript> tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript) to show content only when scripting is turned off:

*NOSCRIPT FALLBACK EXAMPLE*



You can test this by [disabling JavaScript](https://developer.chrome.com/docs/devtools/javascript/disable/) in your DevTools.



### 3. External `*.js` files

By far the most common, flexible way to include JavaScript is externally—again, like CSS. The difference here is that instead of a `<link>` element, we still use a (now empty) `<style>` tag, with the addition of a `src="filename.js"` attribute:

*SCRIPT TAG EXAMPLE, MOVED TO FILE*

I’ve never liked this syntax! HTML/CSS/JS doesn’t always make sense.



## Adding/removing a class



Probably the most common thing you will use JS for—especially as we’re starting out—is simply to add or remove (toggle) a class from something when the user interacts with your page—such as clicking on a menu.

Like with our [transition](/topic/advanced-css/#transitions) examples last week, the element needs two states in your CSS: *with* the class and *without* the class. The JS interaction/event will switch between them, and our CSS `transition` will smooth out the in-between.

We’ll again use `addEventListener` and `querySelector` to listen for clicks, and then modify the [classList](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList) of a *different* element:

*CLASSLIST EXAMPLE*

The class can be toggled on any element in your HTML!



## Watching for scrolling



Another very common use for JavaScript is to do something when an element enters or exits the viewport (scrolling into or out of view)—like fading or moving something in.

Again we’ll need two states in our CSS—defined with/without a class. But now we’ll use the user’s scrolling, instead of a click, to toggle the switch.

This used to be unnecessarily hard in JavaScript, and was one of the things jQuery was created to help with. But now we can use [IntersectionObserver](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API) to watch the element:

*INTERSECTION OBSERVER EXAMPLE*



You will often want to use this on multiple elements—and remember, when in code, [don’t repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)! So we can use [querySelector*All*](https://developer.mozilla.org/en-US/docs/Web/API/Element/querySelectorAll) to select *multiple* elements, and then a [forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) loop to run the same class for each of them:

*IO QUERYSELECTORALL/FOREACH EXAMPLE*

Here I’ve also adjusted the [rootMargin](https://www.smashingmagazine.com/2021/07/dynamic-header-intersection-observer/#rootmargin) from the viewport/default, so the elements don’t transition immediately.



## Some miscellaneous tips

Alright, that is a lot. Like I’ve been saying—JavaScript is a *whole thing*. Here are some other tips, as you start to explore:

- Using `alert("Your message")` for *telemetry*/*debugging* can quickly be pretty annoying—instead, you can use `console.log("Your message")` to show messages in the [DevTools console](/topic/inspector/#the-console). (In other languages, these are often, ironically, called *print*.)

	*Hit ⌘-⌥-J (command-option-J) on the Mac to go right there!*

- Like [HTML](/topic/html/#case-whitespace-tabs-line-breaks)/[CSS](/topic/css/#ergonomics), JS does not care about whitespace or tabbing. But it *is* [case-sensitive](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#basics)!

- Search on [Stack Overflow](https://stackoverflow.com/)! Someone has likely had your problem, before. Many people don’t really *know* JS (myself included)… so much as they really know SO.

- Ignore any examples that have lots of dollar signs, like `$("something").else`—it means this is jQuery, and so is pretty outdated!

- To quickly get recent/modern, *vanilla* JavaScript results, instead include *ES6* in your search—this refers to a more recent, easier-to-use syntax.

- If you see arrow functions `=>`, it is a pretty good sign the answer recent.

- You’ll see a lot of semicolons `;` but secretly you (almost never) actually need them.
