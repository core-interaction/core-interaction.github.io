---
title: An intro to HTML
order: 1
---



## HTML stands for *HyperText Markup Language*
{: .no_toc }



HTML is the standard markup language/format for creating web pages, containing the content and structure of a page as a series of tags/elements.
{: .left }

* [HTML | MDN](https://developer.mozilla.org/en-US/docs/Web/HTML) \
  *When in doubt, refer to the MDN documentation!*

* [Basics of HTML](https://www.youtube.com/watch?v=CkzbI1Tv_rQ)\
  *A very calming introduction by Laurel Schwulst.*

* [Organizing Files for the Web](https://docs.google.com/presentation/d/101TEdtacOFZhCwebijcJaX0h1BpDwhAm2SJhE3jW89c/edit#slide=id.g331f24f572_4_0)
  *Sasha Portis on (web) file-naming, for when you get to saving.*
{: .icon-link .no-marker .right rows="4"}

In our ongoing analogy, HTML is the *skeleton* of the web. At its most basic it is a text file, in a folder on a computer, with a `.html` extension.
{: .left }

As we heard last week, this format was codified by our pal [Tim Berners-Lee](https://www.w3.org/People/Berners-Lee/) in 1991, evolving from his earlier [SGML](https://en.wikipedia.org/wiki/Standard_Generalized_Markup_Language), a similar/proto language. There have been five major revisions to the spec since then, which added (and sometimes *deprecated*, or removed) tags and syntax:
{: .left }

- HTML 1, 1991
- HTML 2, 1995
- HTML 3, 1997
- HTML 4, 1997 (busy year)
- HTML 5, 2014
{: .left }


## The basic document




HTML consists of a [range of elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element), nested inside one another, like a [matryoshka doll](https://en.wikipedia.org/wiki/Matryoshka_doll) of text.



*As a visual:*
{: .two-above }

{% include figure.html src='nesting.svg' %}



*As code:*
{: .two-above }

```html
<!DOCTYPE html>
<html>
	<head>
		<title>Page title</title>
	</head>
	<body>
		<h1>This is a heading</h1>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
	</body>
</html>
```
{: .left }

The `<html>` element contains all elements of the page, the `<head>` element contains the title, and the body contains `<h1>` and `<p>`.

We call these [*semantic* elements](https://www.w3schools.com/html/html5_semantic_elements.asp)—which is saying that they give their contents a *meaning* or a *role*. (Remember [Tim’s diagram](topic/everything/web.png).) These *roles* are then interpreted by your browser (Chrome, Safari, Firefox, etc.) when it loads the file, to ultimately display the page. We call this *parsing* the document.



*In this example, here is what we’ve told the browser:*
{: .four-above }

- `<!DOCTYPE html>` \
  What kind of file this is, so it knows how to parse it.

  - `<html>` \
    The root element of an HTML page, containing all the content.

  - `<head>` \
    The *meta* information about the HTML page—like its title, default language, [scripts](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script), and [stylesheets](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style). \
    \
    *Nothing in this element is visible on the page itself.*

    - `<title>` \
      Specifies a [title](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title) for the page—which is shown in the browser’s tab, and when it is shared.

  - `<body>` \
    Defines the document's body—the container for all the visible contents, such as headings, paragraphs, images, hyperlinks, tables, lists, etc.

    - `<h1>` \
      Defines a primary/first-level heading.

    - `<p>` \
      Defines a paragraph.
{: .left .two-above }

{% capture aside %}
```html
<!DOCTYPE html>
<html>
  <head>
    <title>Page title</title>
  </head>
  <body>
    <h1>This is a heading</h1>
    <p>This is a paragraph.</p>
    <p>This is another paragraph.</p>
  </body>
</html>
```
{% endcapture %}

{% include aside.html content=aside sticky=true rows=2 %}

We use semantic elements to help structure and describe our content—but also for accessibility (screen readers)—where the tag type helps indicate what things are.
{: .left}


## What are elements?



[Elements](https://developer.mozilla.org/en-US/docs/Glossary/Element) are composed of tags (opening, closing) and their content:

{% include figure.html src='tag.svg' %}

Some elements do not have any content or children, like `<br>` or `<img>`. These are called [*empty elements*](https://developer.mozilla.org/en-US/docs/Glossary/Empty_element) and do not have a closing tag.
{: .four-below }

*Some common elements you’ll see:*
{: .two-below }

- `<h1>` `<h2>` `<h3>` `<h4>` `<h5>` `<h6>` for headings

  ```html
  <h1>There should only be one first-level heading!</h1>
  ```

- `<p>` for paragraphs

  ```html
  <p>You should always wrap your text in a paragraph!</p>
  ```

- `<a>` are links

  The `href` (*H*ypertext *REF*erence) specifies a URL that the link points to, and the tag wraps the visible link text. The `href` can point to another, local HTML file (living in the same directory structure) or an external page. They can also point to specific parts of a page.

  ```html
  <a href="https://www.example.com">Links need attributes!</a>
  ```



- `<img>` are images

  The `src` likewise can point to a local image file or an external URL! `alt` provides a description for accessibility/screen readers.

  ```html
  <img src="example.jpg" alt="Images should have descriptions!">
  ```



- `<header>` `<footer>` `<nav>` `<main>` `<article>` `<section>` `<div>` define areas

  These are the structural containers of a website. The names don’t imbue meaning or function directly, but help us organize and think about our content structure. (And again, are helpful for accessibility.)

  ```html
  <body>
	  <header>
		  <!-- A header. -->
	  </header>
	  <main>
		  <!-- Your main content. -->
	  </main>
	  <footer>
		  <!-- The footer. -->
	  </footer>
  </body>
  ```



- `<span>` `<strong>` `<em>` wrap around bits of text

  ```html
  <p>You may have noticed I like using <em>emphasis</em>.</p>
  ```



- `ol` `ul`, and `li` build lists

  ```html
  <ul>
	  <li><!-- A list item. --></li>
	  <li><!-- Another. --></li>
	  <li><!-- A third. --></li>
  </ul>
  ```

There are [many, many HTML elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element), all with particular uses. (We’ll unpack some more, below.)



## Attributes



All HTML elements can have [attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes), which provide more information about the element:

{% include figure.html src='attr.svg' %}



*Some common attributes:*
{: .two-below }

- The `lang` attribute of the `<html>` tag declares the language of the Web page.

  ```html
  <html lang="en">
  ```

- The `href` attribute of `<a>` specifies the URL of the page the link goes to.

  ```html
  <a href="https://www.example.com">Goes to example.com</a>
  ```

- The `target` attribute `_blank` can tell a `<a>` to open in a new window/tab.

  ```html
  <a href="https://www.example.com" target="_blank">New tab!</a>
  ```

  *This can be annoying, so use it judiciously!*

- The `style` attribute is used to add styles to an element, such as color, font, size, etc.

  ```html
  <p style="color: blue;">This is blue text.</p>
  ```

  *We’ll use CSS for this kind of thing, but know this is how it used to be done and it was brittle and terrible.*

- The `src` attribute of `<img>` specifies the path to the image to be displayed, as above.

  ```html
  <img src="example.jpg">
  ```

- The `width` and `height` attributes of `<img>` provide size information for images. Not required, but helps prevent layout “sloshing” as images load.

  ```html
  <img src="example.jpg" width="200px" height="200px">
  ```

- The `alt` attribute of `<img>` provides an alternate text for an image, used by screen readers.

  ```html
  <img src="example.jpg" alt="A description of the image.">
  ```

- The `id` specifies a singular, unique element on a page—for CSS targeting and anchor (scroll, “jump”) links, prepended with `#`.

  ```html
  <h2 id="a-heading-element">A heading element</h2>

  <a href="#a-heading-element">Goes to “a heading element”</a>
  ```

- The `class` attribute provides a selector took hook on with CSS.

  ```html
  <p class="warning">We’ll get into this soon.</p>
  ```



## Case, whitespace, tabs, line breaks



HTML doesn’t care about capitalization, extra white space, or line breaks. The browser will just read everything from left to right, as if it is one long, running sentence. So the shouty `<!DOCTYPE HTML>` and quieter `<!doctype html>` are interpreted the same.

The browser parses both of these in the exact same way:
{: .two-above }

```html
<body>
	<h1>Dog Breeds</h1>
	<p>There are many kind of dog breeds</p>
	<ul>
		<li>German Shepherd</li>
		<li>Bulldog</li>
		<li>Poodle</li>
	</ul>
</body>
```
{: .left }

```html
<body><h1>Dog Breeds</h1><p>There are many kind of
dog breeds</p><ul><li>German Shepherd</li>
<li>Bulldog</li><li>Poodle</li></ul></body>
```
{: .left }

But obviously, the first one is much more readable to us humans. We can use whitespace, tabs/indenting, and line breaks to make it easier for us to read the code. There are a lot of common patterns used—like indenting to indicate hierarchy/nesting. But there are also no wrong ways to do it! In HTML, spaces are code *ergonomics* for you—just like a good chair or desk, that allow you to work more comfortably.



## Block elements



[Block-level elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements) always start on a new line, and take up the full width available—stretching out to the left and right of their parent/container. They stack on top of each other. Importantly, block elements can have a top and bottom margin, unlike inline elements:

`<address>`
`<article>`
`<aside>`
`<blockquote>`
`<canvas>`
`<dd>`
`<div>`
`<dl>`
`<dt>`
`<fieldset>`
`<figcaption>`
`<figure>`
`<footer>`
`<form>`
`<h1>`-`<h6>`
`<header>`
`<hr>`
`<li>`
`<main>`
`<nav>`
`<noscript>`
`<ol>`
`<p>`
`<pre>`
`<section>`
`<table>`
`<tfoot>`
`<ul>`

{% include figure.html src='/example/block/demo' height='19em' %}



## Inline elements



[Inline elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Inline_elements) do *not* start on a new line, and only take up as much width as necessary. I like to think of these as the little metal slugs [from printing](https://en.wikipedia.org/wiki/Slug_(typesetting)). Other text and inline elements will continue to flow around them, and they can wrap to new lines:


`<em>`
`<strong>`
`<span>`
`<a>`
`<img>`

{% include figure.html src='/example/inline/demo' height='18em' %}



## So many elements!




### Comments
{: .four-above }

You can *comment* part of the code and the browser won’t show it. [Comments](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Getting_started#html_comments) are often used to explain your thinking, organize your code, “turn off” a bit of code, or hide whatever you’d like.

{% include figure.html src='/example/comment/demo' caption='Keep in mind these are still readable in the *source*.' height='15em' %}

I highly recommend getting into a habit of commenting your code, especially when starting out. If you figure something tricky out, write down why and how you solved it to help you understand and remember. And you’ll often come back to things. Commenting your code is a gift to your future self!



### Tables
{: .four-above }

[Tables](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table) aren’t used as often anymore, in favor of `<div>` and other layout elements. You used to [have to use them](https://thehistoryoftheweb.com/tables-layout-absurd/) to get any kind of multi-column, grid layouts. But those need even more CSS!

{% include figure.html src='/example/table/demo' caption='This syntax is pretty verbose, for what you get.' height='30em' %}



### Lists
{: .four-above }

Any time you have more than two of something, you probably have [a list](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/HTML_text_fundamentals#lists). These are commonly used for semantic navigation elements, as well, think *“here’s a list of links in this site*.

{% include figure.html src='/example/lists/demo' height='26em' %}



### Description lists
{: .four-above }

There are [specific lists](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl) for defining things.

{% include figure.html src='/example/description-list/demo' caption='These aren’t much to look at without CSS, though. Soon!' height='19em' %}




### Details/summary
{: .four-above }

There is even some basic interactivity (way, way ahead of JavaScript) with [*details disclosure*](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) elements that open and close.

{% include figure.html src='/example/details-summary/demo' caption='You can do a lot with these.' height='22em' %}



Again, there are [many, many, many, many HTML elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element). Try and find the one that best fits your usage, wherever possible using a *semantic* element that fits your content.
{: .four-above }


## *User-agent* styles

We haven’t applied any styles/CSS here yet, so everything we see in these examples is based on [*user-agent* stylesheets](https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade#user-agent_stylesheets)—that is, each browser’s own default display (and behavior) for an element type. This is what the web was, before CSS! But as a designer, rarely what you want. We’ll get into writing our own styles in the coming weeks.
