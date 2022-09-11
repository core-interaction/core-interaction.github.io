---
title: Basic CSS
order: 2
published: false
---



[CSS: Cascading Style Sheets | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS)

MDN, as is custom.

[Basics of CSS](https://www.youtube.com/watch?v=BUZIaTHm_oE)

Another ASMR introduction from Laurel.

## CSS stands for Cascading Style Sheets**

CSS is the standard language/format for styling web pages, which specifies what the page’s HTML will look like in the browser.

In our ongoing analgy, CSS is the *skin* of the web. [Just like HTML](https://www.notion.so/HTML-a6c4dba52c9b429d8f64908ebfbc7018), at its most basic it is still just text, in a file, on a computer. It can live inside HTML documents themselves, but is more commonly seen on its own with the extension `.css`

CSS came after HTML, first proposed by [Håkon Wium Lie](https://www.w3.org/Style/CSS20/history.html) in 1994—who was working with our friend Tim Berners-Lee at CERN and wanted more control over the presentation of web pages. (Tim was against the idea, thinking it should be up to each user.) It’s had three major revisions that have grown the vocabulary:

- **CSS 1, 1996**
- **CSS 2, 1998**
- **CSS 3, 1999**

*For the past decade or so, features have been added incrementially “within” CSS 3.*

## Where CSS lives

---

Before we get into CSS itself, let’s talk about how it is incorporated with HTML. There are three ways it can be added: *inline* on HTML tags, via `<style>` elements in HTML documents, and as separate/external files via `<link>` elements.

## Inline with `style=`

This is the original and most straightforward way to add styles, directly as *[attributes](https://www.notion.so/HTML-a6c4dba52c9b429d8f64908ebfbc7018)* in HTML tags:

```html
<p style="color: red;">This text will be red!</p>
```

Seams obvious. However this has some downsides—imagine you want to style all of your paragraphs in the same way, and with multiple properties:

```html
<p style="color: red; font-family: sans-serif;">This text will be red!</p>
<p style="color: red; font-family: sans-serif;">I’d also like this to be red.</p>
<p style="color: red; font-family: sans-serif;">And they are all sans-serif, too.</p>
```

It makes it hard to read, and hard to change—you’d have to update every single instance.

## Along comes `<style>`

So the next way that came about was using a special HTML element, `<style>` that wraps blocks of CSS that then apply to an entire document. They go in the `<head>` of our [HTML documents](https://www.notion.so/HTML-a6c4dba52c9b429d8f64908ebfbc7018):

```html
<!doctype html>
<html>
	<head>
		<title>Page title</title>
		<style>
			p {
				color: blue;
				font-family: sans-serif;
			}
		</style>
	</head>
	<body>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		<p>This is third paragraph.</p>
	</body>
</html>
```

The rules are written written with selectors—more on those, below. But importantly, we can now control the color of all the paragraphs at once.

## External with `<link>`

So this is already much better, allowing us to style whole pages easily and consistently. But what about when we have *multiple* pages? If you wanted a whole site to use the same styles, you’d have to duplicate the `<style>` tag over and over, updated it everywhere whenever you changes. So along comes the `<link>` element:

```html
<!doctype html>
<html>
	<head>
		<title>Page title</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		<p>This is third paragraph.</p>
	</body>
</html>
```

And then in a separate `style.css` file (in this case, in the same directory as our HTML file), we can have the same rules as before—no need for the `<style>` tag:

```css
p {
	color: green;
	font-family: sans-serif;
}
```

This will apply to any page that we add the `<link>` to, and updating the styles will now change the color of the paragraphs in our *entire site*.

We’ll talk more about *[specificity](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)* later, but it is worth noting that the *inline* approach will usually take precedent over other methods—under the “closest, then lowest” logic.

## CSS rules

---

Even though it is used to style HTML elements, the syntax of CSS is very different.

CSS rules are made up of *selectors*, used to target certain elements, and then the *declarations* that you want to apply to them:

![TI2B-S22_%20CSS%201%20(5).png](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/TI2B-S22_20CSS20120(5).png)

The curly brackets `{` `}` (also known as *mustaches* or *handlebars*) enclose all the declarations you want to apply to a given selector. These *declarations* are in turn made up of *properties* and *values:*

![TI2B-S22_%20CSS%201%20(6).png](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/TI2B-S22_20CSS20120(6).png)

Properties are always separated from their corresponding values by a colon `:`, and each declaration line has to end in a semicolon `;`. (It’s just how it is.) Also, there are no spaces between values and their units!

There are [many, many CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference). (Here is a shorter [“common” list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference).) We’ll go through some in our exercise, but look through these to become more familiar.

**Just like HTML, CSS does not care about capitalization[*](https://www.notion.so/CSS-Fundamentals-6ea128fa0cfd4b46972d85348850af70), extra white space, or line breaks. Folks generally use tabs/indenting to indicate hierarchy, but again it is just whatever makes it easier for you!**

* *Capitalization* does *matter when using IDs or classes as selectors, which have to match the HTML to target correctly. Like with HTML, it’s easiest just to be consistent and stick to lowercase.*

## Selectors

---

Selectors are used to *target* certain HTML elements within the page. These can get pretty complicated, but we’ll look at the three simplest and most common methods to start.

## By element

If you want to change the styles for all instances of a given HTML element, you drop the `<` `>` from the tag for an element selector. These are called *type* *selectors:*

```html
<!-- In your HTML file. -->
<h1>This heading will be black.</h1>
<p>This paragraph will be red.</p>
<p>This paragraph will also be red.</p>
```

```css
/* In your CSS file. */
p {
	color: red;
}
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled.png)

## With a class

But maybe you don’t want to style all of the paragraphs. You can then use a `class` to [target specific instances](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors). They are  added as an *[attribute](https://www.notion.so/HTML-a6c4dba52c9b429d8f64908ebfbc7018)* on the element you want to target:

```html
<!-- In your HTML file. -->
<h1 class="highlight">This heading will will be in green.</h1>
<p>This paragraph will remain in black.</p>
<p class="highlight">This paragraph will also be in green.</p>
```

The *value* here is our class name, which we write in CSS by prefixing with a `.`

```css
/* In your CSS file. */
.highlight {
	color: green;
}
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%201.png)

You can usese these over and over, on any kind of element. And individual elements can have *multiple* classes, too. Class names can be whatever you want—there are whole methodologies about what to call these things. They are the most common way to target things in CSS.

## With an ID

You can also use an `id`, which is a kind of [special attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id) that can only be used *once* in an HTML document. These are useful thus useful for targeting singular things—like your navigation, or the document title, etc. These prefixed by `#` in CSS (and can also be used as link destinations, as in `#navigation` ):

```html
<!-- In your HTML file. -->
<h1>This heading will remain in black.</h1>
<p id="warning">This paragraph will be in red.</p>
<p id="introduction">This paragraph will be in green.</p>
```

```css
/* In your CSS file. */
#warning {
	color: red;
}
#introduction {
	color: green;
}
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%202.png)

## Pseudo-classes

---

These are [special selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes), added to `element`, `class`, or `id` which target unique *states* or *instances* of HTML elements:

```css
/* Make all your links blue */
a {
	color: blue;
}

/* Will change the color when the mouse is over it. */
a:hover {
	color: pink;
}

/* When the mouse is clicked. */
a:active {
	color: red;
}

/* After you’ve visited the link. */
a:visited {
	color: gray;
}
```

Other common examples have to do with counts and positions:

```css
/* The paragraph is the first descendent of some parent element. */
p:first-child {
	color: blue;
}

/* Paragraphs that are the 4th children. */
p:nth-child(4) {
	color: green;
}

/* Last one. */
p:last-child {
	color: red;
}

/* Only one. */
p:only-child {
	color: orange;
}

/* You can invert these, too. */
div:not(:first-child) {
	margin-top: 40px;
}
```

```html
<div>
	<p>This should be blue.</p>
	<p>Standard black, here.</p>
	<p>Also black.</p>
	<p>This one is green!</p>
	<p>Back to black.</p>
	<p>This will be red.</p>
</div>
<div>
	<p>This should be orange.</p>
</div>
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%203.png)

## Specificity!

---

The first three targeting methods (`element`, `class`, `id`) are listed in increasing order of *specificity*, meaning that a class trumps an element rule, and an ID trumps a class. IDs are thus *more specific* than classes, which are *more specific* than element selectors. (And you shouldn’t really use them, but inline styles beat them all.) Take this example:

```css
/* In your CSS file. */
p {
	color: red;
}
.highlight {
	color: green;
}
#intro {
	color: blue;
}
#warning {
	color: orange;
}
```

```html
<!-- In your HTML file. -->
<h2>This heading will remain black.</h2>
<p>This paragraph will be red.</p>
<p class="highlight">This paragraph will be green.</p>
<p>This paragraph will be red again.</p>
<h2 class="highlight" id="intro">This heading will be blue.</h2>
<p id="warning">This paragraph will be orange.</p>
<p class="highlight" style="color: gray;">This paragraph will be gray.</p>
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%204.png)

You could write a long book (and many people have) about CSS specificity—the myriad of ways that some CSS rules take precedent over others. Suffice it to say *it’s complicated*. The easiest way to avoid specificity problems is generally to stay at the same level throughout your HTML, usually by using classes throughout.

## The cascade

---

We haven’t even talked about that first C! Remember, it stands for *[cascading](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance)*. This means that when there is a tie (two classes, applying the same property), the *lowest* rule wins—literally the one further down within a CSS document, or within a style tag. If you have multiple CSS documents with `<link>` element, the lower linked document will “win.”

```css
.note {
	color: gray;
}
.warning {
	color: orange;
}
```

```html
<!-- In your HTML file. -->
<p class="note">This paragraph will be gray.</p>
<p class="note">This paragraph will also be gray.</p>
<p class="note warning">This paragraph will be orange though.</p>
```

![Untitled](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%205.png)

## And inheritance too?!

---

To add even more confusion, some CSS properties set on a parent also apply to their children—such as `color` or `font-family`. Most spacing/layout properties, like `width` and `margin` do not. This allows you to quickly set some properties globally, without having many redundant rules, as we did before:

```html
<!doctype html>
<html>
	<head>
		<style>
			body {
				color: darkgray;
				font-family: sans-serif;
			}
			span {
				color: orange;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		<p>This is <span>third</span> paragraph.</p>
	</body>
</html>
```

![Ah, finally, sans-serif.](CSS!%20(Fundamentals)%204f744331151d431bb7269a63dfe7da1e/Untitled%206.png)

Ah, finally, sans-serif.

## Color!

I am going to add some basics on color, here.

## Typography!

Same for typography.

## User-agent styles and resets

---

Browsers have their own, built-in way that they display HTML elements. These are specific, somewhat, to each platform and each browser. This is the “look” we have been seeing when we write plain HTML without any CSS—usually Times New Roman, with blue links, and small spacing between elements. These, collectively, are called *user-agent styles*.

Often, when you are working towards your own design, you will find yourself fighting against these built in styles. Many designers/front-end folk instead start with *[reset*s](https://meyerweb.com/eric/tools/css/reset/)—a semi-standard collection of CSS rules that “zero out” the browser’s built-in styles. This means you have to write everything yourself, but you have more control and aren’t leaning on unknown foundations. And things should be (more) the same, across browsers and platforms.

Here is a [simple, modern one](https://elad2412.github.io/the-new-css-reset/) for your `<head>`:

```html
<link href="https://cdn.jsdelivr.net/npm/the-new-css-reset@1.4.7/css/reset.min.css"  rel="stylesheet">
```
