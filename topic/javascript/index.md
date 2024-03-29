---
title: An intro to JavaScript
order: 10
---



JavaScript is the language/format for adding interactivity to a web <nobr>page—</nobr>based on actions or events from the user. Where do we even start with *JS*? (Everyone calls it JS.) It is so massive and often seems unapproachable. So we’ll go through a bit of background, and then look at some very practical examples you might want in your work.
{: .left }

* [JavaScript basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/JavaScript_basics) \
*There are <em>literally</em> millions of sites about JS, but let’s start with MDN.*

* [JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Learn/JavaScript) \
*More MDN.*

* [Newest 'javascript' questions - Stack Overflow](https://stackoverflow.com/questions/tagged/javascript) \
*Great resource for many things, but especially/<wbr>famously for JS. It’s like Reddit for code!*

* [The Modern Javascript Tutorial](https://javascript.info) \
*This reference goes very advanced/<wbr>in-depth.*

* [Eloquent JavaScript](https://eloquentjavascript.net) \
*Also goes deep.*
{: .icon-link .no-marker .right rows="3" }

Going back to our first analogy, JavaScript is the *muscles* of the web. Like [HTML](/topics/html) (the *bones*) and [CSS](/topics/css) (the *skin*), it is ultimately still just text that is parsed by our browsers. Like CSS, it can live within HTML documents, but is usually saved separately with the extension `.js`

JavaScript was first created by [Brendan Eich](https://brendaneich.com/2008/04/popularity/) over just 10 days in 1995, and has been through a myriad of evolutions, paths, missteps, and enhancements [since then](https://en.wikipedia.org/wiki/JavaScript). It has nothing formally to do with *Java*, confusingly—other than being contemporaries and sort-of competitors (thus the name). (Coffee-culture was really big in the 90s!) JavaScript won the race, by every measure, and is ubiquitous on the modern web.

> The idea was to make something that Web designers, people who may or may not have much programming training, could use to add a little bit of animation or a little bit of smarts to their Web forms and their Web pages.
{: .quote }

<cite>[Brendan Eich](https://www.infoworld.com/article/2653798/javascript-creator-ponders-past--future.html)</cite>

Like HTML/CSS, JavaScript was a malleable, *interpreted* (not [*compiled*](https://en.wikipedia.org/wiki/Compiled_language)) language running in the browser—meaning the source code could be seen by anyone, and anyone could borrow or modify it for their needs. And so as our computers—and thus our browsers—became faster and cheaper, JS was used for more and more things. Remember that now the tendrils of JavaScript [are almost everywhere](/topic/everything/#its-increasingly-just-js-behind-the-scenes)—running headless on servers, rendering whole sites, talking to hardware, processing NASA images, and so on. It’s web technologies, all the way down.

> Any application that can be written in JavaScript, will eventually be written in JavaScript.
{: .quote }

<cite>[Jeff Atwood](https://blog.codinghorror.com/the-principle-of-least-power/)</cite>




## Libraries/frameworks vs. plain/vanilla JS



You’ll often hear folks talk about *libraries* or *frameworks* in the context of JavaScript—one of the ways it is malleable. These are collections of Javascript code with their own specific ideas, paradigms, and syntax, that expand upon what the language can do (or can do quickly or easily) on its own, *out of the box*.

Things like [jQuery](https://jquery.com) (old-school, now), [Node](https://nodejs.org/en/), [React](https://reactjs.org), [Vue](https://vuejs.org), [Angular](https://angular.io), [D3](https://d3js.org), and [p5](https://p5js.org) (to name some popular ones) are all written *in* and are interfaced *with* (controlled *by*) JavaScript as well. They are often created to do something JavaScript doesn’t yet support on its own (in/famously, *jQuery*) or with a niche use/focus (like data-visualization, with *D3*). There are many, many frameworks and libraries.

When you write JS without libraries, it is usually called *plain* or *vanilla* JavaScript. The language has evolved so much that we can do a lot, here, and this is where we’ll start. And while JS does many things, we’ll first just use it in the most simple way—to make our web pages more interactive.



## Where does JS live?



Very much [like CSS](/topics/css/#where-css-lives), JavaScript code can live in several places:

1. *Inline* as attributes
1. Via `<script>` elements within HTML documents
1. As separate/external `*.js` files *(the right way)*



### 1. Inline event handlers

JS was first added directly like [*attributes*](/topic/html/#attributes) in HTML tags, just like CSS—but attached/listening for [specific events](https://www.w3schools.com/tags/ref_eventattributes.asp):


```html
<button onclick="alert('The button was clicked!');">Click here!</button>
```
{: style="max-width: 76rem" }

*Note the single quotes when nested/inside doubles!*
{: .two-below style="margin-top: var(--typography--between);" }

This works for very, very simple things, but—for many of the same reasons as inline CSS—is brittle and doesn’t scale with complexity or across multiple pages. Try writing a whole, elaborate function in there! No good.

{: .callout .two-above icon='☝️' }
> You might see these in old examples/code, but don’t use these now! If you see them, it’s probably an indication the code is outdated.



### 2. Wrapped in `<script>` tags

So again like CSS, JavaScript can be enclosed in its own special tag, the [\<script> element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script). (These are also, somewhat confusingly, called *inline* scripts.) Anything inside the tag should be written in JavaScript syntax and will be executed right away, in the order/position of the tag within the HTML document.

Since this script isn’t directly *on* an element anymore (as above), we then have to identify the *target* element with [querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector), and then *attach* the [onclick event](https://developer.mozilla.org/en-US/docs/Web/API/Element/click_event) to it:

{% include figure.html src='/example/javascript/demo' caption='Note the different `// comment syntax` for JS! And we had to add `cursor: pointer;` for the button in our CSS, to indicate it is actionable. Mind your affordances.' height='48rem' %}

Here the `onclick` is a shorthand for using [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener). We also store (declare) the element here as a [variable](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Variables), to keep our code readable. These are a bit like their [CSS counterparts](/topic/responsive/#briefly-css-variables). Ergonomics!



#### Oh also, `<noscript>`

Some folks block/disable JavaScript—for performance or accessibility reasons, or to hide advertising/annoyances, [and so on](https://softwareengineering.stackexchange.com/questions/26179/why-do-people-disable-javascript). This is less and less common these days, since so many sites *completely rely* on JS. It isn’t always feasible to replicate your site behavior entirely *without* JS, but you can use a special [\<noscript> tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript) to show content only when scripting is turned off:

<!-- NOSCRIPT FALLBACK EXAMPLE? -->

You can test this by [disabling JavaScript](https://developer.chrome.com/docs/devtools/javascript/disable/) in your DevTools.



### 3. Separate/external `*.js` files

By far the most common, flexible way to include JavaScript is externally—again, like CSS. The difference here is that instead of a `<link>` element, we still use a (now empty) `<script>` tag, with the addition of a `src="filename.js"` attribute:

```html
<script defer src="script.js"></script>
```
{: style="max-width: 43rem;" }

*I’ve never liked this empty-tag syntax, what can you do.*
{: .two-below style="margin-top: var(--typography--between);" }

Same JavaScript as the example above, but now moved over into a nice, separate, JS-syntax-highlighted file. This will still run when the document gets to the `<script>` (and in its place/order) as before, and the `defer` attribute allows it to “see” the HTML (not yet loaded) below it. We can then move the script up into our `<head>`, along with the other external files:

{% include figure.html src='/example/javascript-external/demo' height='34rem' caption='Stays readable/clean with long documents and lots of files. Where there is one JS file, there are often many.' %}



## Adding/removing a class



Okay, time for a more practical example: probably the most common thing you will use JS for—especially as we’re starting out—is simply to add or remove (toggle) a class from something when the user interacts with your page (such as clicking on a menu).

Like with our [transition](/topic/advanced-css/#transitions) examples, the element needs two states in your CSS: *without* the class and then *with* the class. The JavaScript interaction/event will switch between them, and our CSS `transition` will smooth out the… transition.

We’ll again use `addEventListener` and `querySelector` to listen for clicks, but then modify the [classList](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList) of a *different* element:

{% include figure.html src='/example/javascript-classlist/demo' height='31rem' caption='Note the [camelCase](https://en.wikipedia.org/wiki/Camel_case) variable names, which is the JavaScript convention. Longer, descriptive names will help as your code gets more complex.' %}

The class can be toggled on any element in your HTML (or often, even just on `document.body` itself)! `querySelector` takes *any* CSS selector, even other classes. Also you an specifically use `classList.add` and `classList.remove`, if you don’t want the on-and-off behavior from `classList.toggle`.

You can do many, many things with this basic “add a class” JS!



## Watching for scrolling



Another very common use for JavaScript is to do something when an element enters or exits the viewport (scrolling into or out of view)—like fading or moving something in.

Again we’ll need two states in our CSS—defined with/without a class. But now we’ll use the user’s scrolling, instead of a click, to toggle the switch.

This used to be unnecessarily hard in JavaScript, and was one of the things jQuery was created to help with. But now we can use [IntersectionObserver](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API) to watch the element:

{% include figure.html src='/example/javascript-intersection/demo' height='42rem' caption='Note the [if/else](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else) statement, an example of [conditional logic](https://en.wikipedia.org/wiki/Conditional_(computer_programming)).' %}



You will often want to use this on multiple elements—and remember, when in code, [don’t repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)! So we can use [querySelector*All*](https://developer.mozilla.org/en-US/docs/Web/API/Element/querySelectorAll) to select *multiple* elements, and then a [forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) *loop* to run the same class for each of them:
{: .four-above }

{% include figure.html src='/example/javascript-intersection-loop/demo' height='44rem' caption='Here I’ve also adjusted the [rootMargin](https://www.smashingmagazine.com/2021/07/dynamic-header-intersection-observer/#rootmargin) from the viewport/default, so the elements don’t transition immediately.' %}



## Some miscellaneous tips

Alright, that is a lot. Like I’ve been saying—JavaScript is a *whole thing*. Here are some other tips, as you start to explore:

- Using `alert("Your message")` for *telemetry*/*debugging* can quickly be pretty annoying—instead, you can use `console.log("Your message")` to show messages in the [DevTools console](/topic/inspector/#the-console). The console will also show any JavaScript errors!

	*On the Mac, hit `⌘` `⌥` `J` (command-option-J) to go right there!*

	*In other languages, these functions are often, ironically, called <em>print</em>.*

- Like [HTML](/topic/html/#case-whitespace-tabs-line-breaks)/[CSS](/topic/css/#ergonomics), JS does not care about whitespace or tabbing. But it *is* [case-sensitive](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#basics)!

- Search on [Stack Overflow](https://stackoverflow.com/)! Someone has likely had your problem, before. Many people don’t really *know* JS (myself included)… so much as they really know *SO*.

- Ignore any examples that have lots of dollar signs, like `$("something").else`—it means this is jQuery, and so is pretty outdated!

- To quickly get recent/modern, *vanilla* JavaScript results, instead include *ES6* in your search—this refers to a more recent, easier-to-use syntax.

- Relatedly, if you see arrow functions `=>` it is a pretty good sign the answer recent.

- You’ll see a lot of semicolons `;` but secretly you (almost never) actually need them.
