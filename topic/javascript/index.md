---
title: An intro to JavaScript
order: 10
published: false
---



JavaScript is the language/format for adding interactivity to a web page—based on actions or events from the user. Where do we even start with *JS*? (Everyone calls it JS.) It is so massive and often (trust me, I know) seems unapproachable. So we’ll go through a bit of background, and then look at some very practical examples you might want in your work.
{: .left }

* [I’m a link](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations)
{: .icon-link .no-marker .right rows="3" }

Going back to our first analogy, JavaScript is the *muscles* of the web. Like [HTML](/topics/html) (the *bones*) and [CSS](/topics/css) (the *skin*), it is ultimately still just text that is parsed by our browsers. Like CSS, it can live within HTML documents, but is usually saved separately with the extension `.js`

JavaScript [dates to the mid-90s](https://en.wikipedia.org/wiki/JavaScript), and has been through a myriad of evolutions, paths, missteps, and enhancements since then. It has nothing really to do with *Java*, confusingly, if you remember from [*What Is Code?*](http://javascript.info). (Coffee-culture was big in the 90s.)

Remember too that the tendrils of JavaScript [are now everywhere](/topic/everything/#its-increasingly-just-js-behind-the-scenes)—running headless on servers, rendering whole sites, talking to hardware, processing NASA images, and so on. It’s web technologies, all the way down. So while JS does many things, we’ll first just use it in the most simple way—to make our web pages more interactive.



## Libraries/frameworks vs. plain/vanilla JS



You’ll often hear folks talk about *libraries* or *frameworks* in the context of JavaScript—these are collections of Javascript code with their own specific paradigms and syntax, that expand upon what the language can do (or do quickly or easily) on its own, *out of the box*.

Things like [jQuery](https://jquery.com) (old-school, now), [Node](https://nodejs.org/en/), [React](https://reactjs.org), [Vue](https://vuejs.org), [Angular](https://angular.io), [D3](https://d3js.org), and [p5](https://p5js.org) (to name some popular ones) are all written *in* and are interfaced *with*/controlled *by* JavaScript. They are often created to do something JavaScript doesn’t yet support on its own (in/famously, *jQuery*) or with a niche use/focus (like data-visualization, with *D3*). There are many, many frameworks and libraries.

When you write JS without libraries, it is usually called *plain* or *vanilla* JavaScript. The language has evolved so much that we can do a lot, here, and this is where we’ll start.











