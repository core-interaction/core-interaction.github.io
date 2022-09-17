---
title: An intro to CSS
order: 2
---



## CSS stands for *Cascading Style Sheets*
{: .no_toc }



CSS is the standard language/format for styling web pages, which specifies what the page’s HTML will look like in the browser.
{: .left }

* [CSS | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS) \
  *MDN, as is custom.*

* [Basics of CSS](https://www.youtube.com/watch?v=BUZIaTHm_oE) \
  *Another ASMR introduction from Laurel.*

* [Google’s web.dev CSS course](https://web.dev/learn/css/) \
  *Different order from ours, but pretty good.*

* [HTML Color Codes](https://htmlcolorcodes.com/) \
  *Too many ads, but some nice tools for color.*

* [Google Fonts](https://fonts.google.com) \
  *We’ll use this for free font families.*

* [Wakamai Fondue](https://wakamaifondue.com) \
  *“What can my font do?”*
{: .icon-link .no-marker .right rows="5" }

In our ongoing analogy, CSS is the *skin* of the web. [Just like HTML](/topics/html), at its most basic it is still just text, in a file, on a computer. It can live inside HTML documents themselves, but is more commonly seen on its own with the extension `.css`

CSS came after HTML, first proposed by [Håkon Wium Lie](https://www.w3.org/Style/CSS20/history.html) in 1994—who was working with our friend Tim Berners-Lee at CERN and wanted more control over the presentation of web pages. (Tim was *against* the idea, thinking it should be up to each user.) It’s had three major revisions that have grown the vocabulary:

- CSS 1, 1996
- CSS 2, 1998
- CSS 3, 1999

*For the past decade or so, features have been added incrementally by browsers “within” the CSS 3 “standard”. That’s how it goes, these days.*



## Where CSS lives



Before we get into CSS itself, let’s talk about how it is incorporated with HTML. There are three ways it can be added:

1. *Inline* on HTML tags themselves
1. Via `<style>` elements in HTML documents
1. As separate/external files via `<link>` elements



### 1. Inline with `style=`

This is the original and most straightforward way to add styles, directly as [*attributes*](/topic/html/#attributes) in HTML tags:

```html
<p style="color: red;">This text will be red!</p>
```
{: .left }

Seams obvious. However this has some downsides—imagine you want to style all of your paragraphs in the same way, and with multiple properties:

```html
<p style="color: red; font-family: sans-serif;">This text will be red!</p>
<p style="color: red; font-family: sans-serif;">I’d also like this to be red.</p>
<p style="color: red; font-family: sans-serif;">And they are all sans-serif, too.</p>
```

It makes it hard to read, and hard to change and maintain—you’d have to update every single instance. (In software, we’d refer to this as *brittle*—meaning it is easy to break.)



### 2. Along comes `<style>`

So the next way that was added to the standard was using a special HTML element, `<style>`, that wraps blocks of CSS that then apply to an entire document. They go up in the `<head>` of our [HTML documents](/topic/html/#the-basic-document):

```html
<!DOCTYPE html>
<html>
	<head>
		<title>Page title</title>
		<style>
			p {
				color: red;
				font-family: sans-serif;
			}
		</style>
	</head>
	<body>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		<p>This is third paragraph.</p>
	</body>
</html>
```
{: .half }

The rules are written written with selectors—more on those, below. But importantly, we can now control the color of all the paragraphs easily, at once.



### 3. External with `<link>`

So this is already much better, allowing us to style whole pages easily and consistently. But what about when we have *multiple* pages? If you wanted a whole site to use the same styles, you’d have to duplicate the `<style>` tag over and over, updated it everywhere whenever you changes. Still brittle. So along comes the `<link>` element:

```html
<!DOCTYPE html>
<html>
	<head>
		<title>Page title</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body>
		<p>This is a paragraph.</p>
		<p>This is another paragraph.</p>
		<p>This is third paragraph.</p>
	</body>
</html>
```
{: .left }

And then in a separate `style.css` file (in this case, in the same directory as our HTML file), we can have the same rules as before—no need for the outside wrapping `<style>` tag:

```css
p {
	color: red;
	font-family: sans-serif;
}
```
{: .half }

This will apply to any page that we add the `<link>` to, and updating the styles will now change the color of the paragraphs in our *entire web site*.

We’ll talk more about *[specificity](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)* later, but it is worth noting that the *inline* approach will usually take precedent over other methods—under the “closest, then lowest” logic.



## CSS rules



Even though it is used to style HTML elements, the syntax of CSS is very different. CSS *rules* are made up of *selectors*, used to target certain elements, and then the *declarations* that you want to apply to them:

{% include figure.html src='rule.svg' %}

The curly brackets `{` `}` (also known as *mustaches* or *handlebars*, for their shape) enclose all the declarations you want to apply to a given selector. These *declarations* are in turn made up of *properties* and *values*.

Properties are always separated from their corresponding values by a colon `:`, and each declaration line has to end in a semicolon `;`. (It’s just how it is.) Also, there are no spaces between values and their units (like `20px`)!

There are [many, many CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference). (Here is a shorter [“common” list](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference).) We’ll go through some in our exercise, but look through these to become more familiar.



### Ergonomics

Just [like HTML](/topic/html/#case-whitespace-tabs-line-breaks), CSS does not care about capitalization, extra white space, or line breaks. Folks generally use tabs/indenting to indicate hierarchy, but again it is just whatever makes it easier for you!

```css
p {
	color: red;
}

/* Is the same as… */

p { color: red; }
```
{: .half }

I generally “single-line” rules when there is only one property declared, as I find it easier to read.

*Capitalization <em>does</em> matter when using IDs or classes as selectors, which have to match the HTML to target correctly. Like with HTML, it’s easiest just to be consistent and stick to lowercase.*



## Basic selectors



Selectors are used to *target* certain HTML elements within the page. These can get pretty complicated, but we’ll look at the three simplest and most common methods to start:

1. Elements
1. Classes
1. IDs



### 1. By element type

If you want to change the styles for all instances of a given HTML element, you drop the `<` `>` from the tag for an element selector. These are called [*type selectors*](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors):

{% include figure.html src='/example/element/demo' caption='Note that CSS has different `/* comment syntax */`, too.' height='33rem' %}



### 2. With a class

But maybe you don’t want to style all of the paragraphs. You can then use a `class` to [target specific instances](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors). They are  added as an *[attribute](/topic/html/#attributes)* on the element you want to target:

{% include figure.html src='/example/class/demo' height='43rem' %}

The *value* here is our class name, which we write in CSS by prefixing with a `.` as with `.highlight` and `.faded`.

You can use these over and over, on any kind of element. And individual elements can have *multiple* classes, too. (We’ll talk about how conflicting rules are handled, below.) Class names can be whatever you want—there are whole methodologies about what to call these things. They are the most common way to target things in CSS.



### 3. With an ID

You can also use an `id`, which is a kind of [special attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id) that can only be used *once* in an HTML document. These are useful thus useful for targeting singular things—like your navigation, the document title, specific headings, etc:

{% include figure.html src='/example/id/demo' height='35rem' %}

These are prefixed by `#` in CSS, as with `#title` and `#introduction`. They can also be used as [link destinations](/topic/html/#attributes).



## *Fancy* selectors



### Combinations and groups

You can use combinations of the above *elements*, *classes*, and *IDs* to be even more specific—however, this likely means you just need to rethink your HTML structure. (We’ll unpack *specificity*, below.) More commonly, you might apply declarations to multiple selectors, called *group selectors*, with a comma-delineated [selector list](https://developer.mozilla.org/en-US/docs/Web/CSS/Selector_list):

{% include figure.html src='/example/group/demo' height='35rem' %}



### With specific attributes

You can use the various [attributes](topic/html/#attributes) as selectors, too. These are usually very similar to using *classes*, but can help you [differentiate things](https://css-tricks.com/attribute-selectors/) like internal and external links, for example:

{% include figure.html src='/example/attribute/demo' height='27rem' %}



### Pseudo-classes

These are [special selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes), added to `element`, `class`, or `id` which target unique *states* or *instances* of HTML elements. You’ll often see these used to target [link states](https://web.dev/learn/css/pseudo-classes/#historic-states):

{% include figure.html src='/example/pseudo-link/demo' caption='`:hover` also works on any element, not just links!' height='33rem' %}



Other common examples have to do with [counts and positions](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes#tree-structural_pseudo-classes):

{% include figure.html src='/example/pseudo-child/demo' height='39rem' %}



### Pseudo-elements

Slightly different the various [pseudo-*elements*](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements), which let you style a particular *part* of an element. You’ll most often see these as `:before` and `:after`, which let us insert things around text.

{% include figure.html src='/example/pseudo-element/demo' height='46rem' %}



### Finally, combinators

Last, you will often want to target something based on its relationship to other elements—its *siblings* or its *parents*. For this, CSS has [*combinators*](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Combinators), which let you relate all the various selectors we’ve learned about here together.

{% include figure.html src='/example/combinator/demo' height='47rem' %}



Importantly, combinators can only “see” elements *before* and *above* themselves—meaning their *previous <em>(older?)</em> siblings* or their *parents*. This directionality somewhat corresponds with the *cascade*, which we’ll talk about shortly.



### `:has()` will change this!

For many, many years folks have wanted a “parent selector” in CSS—meaning a way to apply a style to a parent/container based on one of its children. This was not possible before, as we mentioned above.

CSS has [finally added](https://webkit.org/blog/13096/css-has-pseudo-class/) the `:has()` pseudo-class, just in the past few weeks! It will allow us to write much simpler, logical styles:

```css
div:has(p) { background-color: red; }
```
{: .half }

Safari and Chrome both *just* [added support](https://caniuse.com/css-has), so this should be safe to use in the coming months.



## Specificity



The first three targeting methods (`element`, `.class`, `#id`) are listed in increasing order of [*specificity*](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity), meaning that a class trumps an element rule, and an ID trumps a class. IDs are thus *more specific* than classes, which are *more specific* than element selectors. (And you shouldn’t really use them, but inline styles beat them all.) Take this example:

{% include figure.html src='/example/specificity/demo' height='30rem' %}

You could write a *long* book (and many people have) about CSS specificity—the myriad of ways that some CSS rules take precedent over others. It is often one the more frustrating parts (especially when working with legacy code that is poorly considered). Suffice it to say *it’s complicated*. The easiest way to avoid specificity problems is generally to stay at the same level throughout your HTML, usually by just using classes throughout.



## Oh right, the cascade



We haven’t even talked about that first *C*! Remember, it stands for [*cascading*](https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade). This means that when there is a tie (like two classes applying the same property), the *lowest* rule wins—literally the one further down within a CSS document, or within a style tag. If you have multiple CSS documents with `<link>` element, the lower linked document will take precedence.

{% include figure.html src='/example/cascade/demo' height='19rem' %}



## And inheritance



To add even more confusion, [some CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/inheritance) set on a parent also apply to their children—such as `color` or `font-family`. Most spacing/layout properties, like `width` and `margin` do not. (More on those, next week.)

This allows you to quickly set some properties globally, without having many brittle/redundant rules, as we did before:


{% include figure.html src='/example/inheritance/demo' caption='All the children inherit the `body` styles. Ah, finally, `sans-serif`.' height='31rem' %}



## Color and type properties

Alright, so all this has been about *targeting* elements—what about actually styling them? Let’s introduce a few quick *properties* to get us started.



### Color!

Besides the basic examples above, [*color*](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) can be specified in a few different ways:

{% include figure.html src='/example/color/demo' caption='There are [147 <em>named</em>](https://htmlcolorcodes.com/color-names/) CSS colors! `tomato` is a favorite.' height='53rem' %}

Named colors are quick to work with when you know a few, but `hsla` offers a more intuitive way to adjust and work with colors.

These can also all be applied to `background-color` (and `border`, but we’ll talk about that next week).



### Fonts!

Then perhaps most importantly, you’ll always be customizing your [typography](https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text/Fundamentals). Remember, the web is text *all the way down*:

{% include figure.html src='/example/font-family/demo' height='63rem' caption='With great power comes great responsibility.' %}

Web font licensing is a *Whole Big Thing*—so let’s start out by making use of [Google Fonts](https://fonts.google.com), which offers many *open-source* typefaces nicely packaged for web use. You can select *families* and *weights* there to easily include in your pages, as in the example above.



### Other type properties!

Once you’ve got a `font-family` in, there are additional properties to control the typography:

{% include figure.html src='/example/font/demo' caption='For now, you can just specify units in `px` to match Figma. We’ll talk about other *absolute* and *relative* units soon.' height='82rem' %}



## Resets



As we talked about [last week](/topic/html/#user-agent-styles), browsers have their own, built-in way that they display HTML elements. These *user-agent styles* are specific, somewhat, to each platform and each browser. This is the “look” we have been seeing when we write plain HTML without any CSS—usually Times New Roman, with blue links, and small spacing between elements.

Often, when you are working towards your own design, you will find yourself fighting against these built-in styles. Many designers/front-end folk instead start with [*resets*](https://meyerweb.com/eric/tools/css/reset/)—a semi-standard collection of CSS rules that “zero out” the browser’s built-in styles. This means you have to write everything yourself, but you have more control and aren’t building on unknown foundations. And things should be (more) consistent, across browsers and platforms.

Here is a [simple, modern one](https://elad2412.github.io/the-new-css-reset/) for your `<head>`:

```html
<link href="https://core-interaction.github.io/assets/styles/reset.css" rel="stylesheet">
```

*This is what we use here for our course site!*
