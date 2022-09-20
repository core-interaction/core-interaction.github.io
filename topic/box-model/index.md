---
title: The box model
order: 3
---



The first thing we need to understand is how CSS sizes elements. This is called the [*the box model*](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model), as everything on the web begins as a rectangle:
{: .left }

* [Introduction to CSS layout | MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Introduction) \
	*As usual.*

* [web.dev Layout](https://web.dev/learn/css/layout/) \
	*This gets into `grid` and `flex`; we’ll talk about those soon.*
{: .right .no-marker .icon-link rows="2" }

{% include figure.html src='box-model.svg' caption='With `box-sizing: content-box;` per the spec.' %}

By default, browsers are set to `box-sizing: content-box;` which means that the padding (and border) exists *outside* the content width or height—so padding is then an *outset.*

But this is often unintuitive and doesn’t fit with most web design patterns, so it is very common (nearly universal) to instead set this to `box-sizing: border-box;` which makes padding and border exist *inside* the content dimensions. Then padding is easier to think of as an *inset*. ([W3C](https://www.w3.org/TR/css-box-3/) probably got this default wrong. Good ol’ CSS!)

{% include figure.html src='box-model-border.svg' caption='With `box-sizing: border-box;` the defacto standard. Most [CSS resets](/topic/css#resets) will do this for you! Like I said, very common.' %}



Let’s take a look at this box, going inside-to-outside.



## Content



The *content area* is the guts of the element, usually text or an image. Its dimensions are defined by that content, but also can be specified directly via `width` or `height`. (More on those soon.)

{% include figure.html src='/example/content/demo' height='23rem' %}

> I’ve pulled our [CSS reset](/topic/css#resets) into the `<head>` all of these examples, so we are only seeing the styles that are expressly written out here.
{: .callout .two-above icon="🤚" }



## Padding



Next comes [*padding*](https://developer.mozilla.org/en-US/docs/Web/CSS/padding), which extends the element’s area around the content. It’s easiest to think of this as an *inset* (if we’ve made our `box-sizing` the logical `border-box`, above).

{% include figure.html src='/example/padding/demo' height='28rem' %}



### A sidebar about *shorthand*

*Padding*—and many other properties, like *border* and *margin*—can be specified with a [shorthand property](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties) to make it easier to use the same spacing all around, or shared top/bottom and left/right. (We’ll talk about units below, promise.)

- 1 value: *all directions/sides*
- 2 values: *top/bottom, left/right*
- 3 values: *top, left/right, bottom*
- 4 values: *top, right, bottom, left*
{: .half .two-above }

```css
p { padding: 20px; }
p { padding: 20px 40px; }
p { padding: 20px 40px 80px; }
p { padding: 20px 20px 40px 80px; }
```
{: .half }

You can always write the individual directions out, though (like `padding-top`). Three- and four-value rules are harder to read, so I tend to avoid them.



## Border



Then we have [*border*](https://developer.mozilla.org/en-US/docs/Web/CSS/border). Border is… the border around an element. It has its own `border-width`, `border-color`, and also `border-style`:

{% include figure.html src='/example/border/demo' caption='The shorthand `border-top` property value order here doesn’t matter! Isn’t CSS logical.' height='42rem' %}

{% include figure.html src='/example/border-style/demo' height='58rem' caption='Look at all those borders.' %}

{% include figure.html src='/example/border-radius/demo' height='67rem' %}



## Margin



The last part of our box is [*margin*](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)—the space *around* an element, empty/whitespace area that is used to separate an element from its *siblings*. Like *padding* and *border*, you can specify it all around or on individual sides.

{% include figure.html src='/example/margin/demo' height='37rem' %}

Margin has a couple tricks up its sleeve. First, it can have *negative* values—which will eat up/remove space between elements. (*Padding* and *border* only take up space.) Just add a minus before the value and watch it bring things together.

{% include figure.html src='/example/margin-negative/demo' caption='The first element pulls the second element closer with a *negative* margin.
' height='25rem' %}

Also [margins *collapse*](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing), meaning that they are sometimes combined into a single value (the largest) between two elements. This happens most often on adjacent siblings, and is both useful and an absolute pain.

{% include figure.html src='/example/margin-collapse/demo' caption='You might expect the margin between the first two `div` to be `80px`, but it is only `40px`. They have *collapsed.*' height='26rem' %}



## And their units



Okay, so we have all these box properties—but how do we specify the dimensions? CSS has many [*length units*](https://developer.mozilla.org/en-US/docs/Web/CSS/length), used for `width`, `height`, and also  `padding`, `border`, `margin`, and even `font-size`. (Picas, anyone?) We’ll look at some common ones.



### Absolute length units

Maybe the easiest ones to understand, fixed to physical (well, sort of) sizes. \
\
*With the many vagaries of screen size and density, the physical/ruler lengths will only be correct when you print. And maybe not even then.*
{: .half }

```css
.pixels {
	height: 360px;
	width: 720px;
}

.inches {
	height: 5in;
	width: 10in;
}

.mm {
	height: 84mm;
	width: 400mm;
}
```
{: .half }



### Relative length units

Otherwise you can use *relative* units, which depend on and respond to their context. \
\
*These are distinctly and intrinsically <em>web</em> measurements.*
{: .half }

```css
/* Relative to nearest sized ancestor. */
.percentage {
	height: 90%;
	width: 85%;
}

/* Relative to viewport height/width. */
.viewport {
	height: 75vh;
	width: 80vw;
}

/* Relative to element font-size. */
.em {
	height: 14em; /* 1em is one line. */
	width: 4.8em;
}

/* Also relative to font size */
.ch {
	width: 1ch; /* 1ch is one letter. */
}

/* Relative to :root font-size. */
.rem {
	height: 12rem;
	width: 2.4rem;
}
```
{: .half }


### Combine them with a `calc`

Sometimes you might want to use these together! Or otherwise do some math. For this we have the [calc function](https://developer.mozilla.org/en-US/docs/Web/CSS/calc()).
{: .half }

```css
.absolute-and-relative {
	width: calc(50% - 20px);
}

.computer-do-the-math {
	width: calc(100% / 12);
}
```
{: .half }

> CSS is big and massive and overwhelming and sometimes indefensibly nonsensical—but remember that you can do a surprising amount with just these basic properties! And no matter how complex it gets, it always comes back to these basics.
{: .callout icon="😥" }



## Position



With an idea of how elements take up space, now we’ll look at how they exist and move together in the [*document flow*](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Normal_Flow). The CSS property `position` [sets this relationship](https://developer.mozilla.org/en-US/docs/Web/CSS/position).



### Static

By default, every element is *static—*just meaning its normal, stacked position in the document.

*You’ll rarely, if ever, actually set this yourself. It’s the default you change.*

{% include figure.html src='/example/position-static/demo' caption='Nothing changes here—`static` is the default.' height='24rem' %}



### Relative

The first thing we might want to do is adjust an element *from* that normal *static* position, which we can do with *relative* positioning.

Once you have set `position: relative;` you can use the  `top`, `right`, `bottom`, and `left` values (with any of the units, above) to move the element away from its default, normal position in the flow.

{% include figure.html src='/example/position-relative/demo' caption='The element still exists/takes up space in the *flow*.' height='30rem' %}



### Absolute

*Absolute* positioning is somewhat similar to *relative—*but instead of placing an element in relation to its own default position, it uses the position of its nearest *relatively-positioned* ancestor. So it will “go up the chain” of parents and wrapper elements until it finds one set to `position: relative;`, then uses the same offset properties to move the element around.

Importantly, `position: absolute;` also *removes* the element from the normal document flow—meaning it takes up no space in the page layout.

*This is often used for exacting, specific design elements.*

{% include figure.html src='/example/position-absolute/demo' caption='The element is out of the *flow*, and placed according to the `relative` parent.' height='35rem' %}



### Fixed

*Fixed* positioning also removes the element from the document flow, but it places elements with relation to the *browser viewport*—the boundaries of the window or device.

So `position: fixed;` brings the element completely out of the page’s normal flow, like it is sitting on its own separate layer.

*This is often used for things like navigation elements.*

{% include figure.html src='/example/position-fixed/demo' height="29rem" %}



### Sticky

The most recent addition to the *position* party, `position: sticky;` elements are placed according to the normal flow of the document, like *static,* until their nearest *scrolling ancestor* (usually the viewport) moves past them. The element is then *stuck* in relation to this element.

*This is often used for headers on tables and lists.*

{% include figure.html src='/example/position-sticky/demo' caption='This always feels very *web*-y.' height='29rem' %}



### “Depth”

Okay, [*z-index*](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index) is not strictly *positioning*—it is a separate property. You can see that all these *position* properties have given us ways to make things overlap. `z-index` is how we can decide the *front-to-back* ordering (think [*z-axis*](https://en.wikipedia.org/wiki/Cartesian_coordinate_system#Three_dimensions)).

By default, items that are lower in the DOM (coming after each other) are in front of higher, earlier elements.

{% include figure.html src='/example/z-index/demo' caption='The two `position` properties both create new stacking contexts, `z-index: 1;` moves even elements in front.' height='38rem' %}

A whole lot of things make a new [*stacking context*](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) (including most `position` changes) which is kind of like a *group* that has its own internal depth/overlap order. No amount of internal *z-index* adjustments can break something out of that group—which is one of the reasons why *z* can be really difficult to understand and tricky to use. But you can adjust the *z-index* of the group, as we do here.



## Floats



Sometimes you’ll want to have an image or block flow within a block of text. There are a lot of ways to do this now, but the oldest (yet sometimes still trickiest) is a [*float*](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats).



### Left and right

The declarations `float: left;` and `float: right;` take an element out of the normal flow and place it on the left or right side of its parent container. Any text *siblings* will then flow around the element—like a *text wrap—*filling up any available space to its side. They will go as far up as the top of the *floated element*.

{% include figure.html src='/example/float/demo' height='40rem' %}



### Don’t forget to `clear`

Since this takes the floated element out of the *flow*, if we want the following element (often another text block, like a `<p>`) to not move up it needs to be *cleared* with `clear: left;` , `clear: right;`, or `clear: both;`. Applied on the following element, it will make it stay entirely below (clear of) the *floated* element.

{% include figure.html src='/example/float-clear/demo' caption='Uh oh, classic *float* problem on the second one.' height='48rem' %}

If you have a parent wrapper and no following element, there won’t be anything there to *clear* the float—meaning the parent will collapse down to the size of the text content. You can solve this broken look with a *[clearfix hack](https://developer.mozilla.org/en-US/docs/Web/CSS/clear#sect1)*, which uses a pseudo-element as an ersatz `last-child` to clear the container.

{% include figure.html src='/example/float-clearfix/demo' caption='Much better. `:after` is a pseudo-element—which acts here as a last child that clears the `div`.' height='52rem' %}



Generally, I try and avoid floats—they aren’t common in modern design patterns and have been giving people headaches for… *decades* now. They require you to know how long your content is and also how big your viewport/page will be—both things that you don’t always have control over in responsive/mobile 2022.

*Sometimes they are still the only thing that can do what you need!*



## Display



In our [HTML introduction](/topic/html#block-elements) we briefly talked about *block* and *inline* elements, as set by the user-agent styles. These are the first two examples of [the *display* property](https://developer.mozilla.org/en-US/docs/Web/CSS/display).



### Block

So as we discussed, most HTML elements are *block-level* by default. But you can also set `display: block;` manually on an *inline* element, too. This would mean that it starts on a new line, takes up the full width available, and you can specify a `height`, `width`, and use `margin` above and below.

{% include figure.html src='/example/display-block/demo' caption='Whenever you are linking a whole area (like an image and text together), safe bet that you want `block`.' height='36rem' %}



### Inline

And going the other way, you can make *block* elements switch to *inline* with `display: inline;`. They will no longer start on their own lines, will only take up as much space as their content/children, and don’t accept `height` and `width` properties.

{% include figure.html src='/example/display-inline/demo' caption='The `white-space` property `pre`-vents the spaces in the paragraphs from collapsing.' height='32rem' %}



### …but also `inline-block`

You can also combine the qualities of *block* and *inline* with `display: inline-block;`. These elements take `height` and `width` (and vertical `margin`) like *block-level* elements, but do not start on their own line.

{% include figure.html src='/example/display-inline-block/demo' height='40rem' %}



### And sometimes `none`

Setting `display: none;` hides an element visually from the document—as well as taking it out of the *flow*. (Keep in mind the HTML is still there, if someone opens up the source code.)

This is a common way to hide/show (by setting another *display* property) elements on the page, but it will *reflow* the document when applied—as if the element is actually added/removed from the DOM.

{% include figure.html src='/example/display-none/demo' caption='Poof. Like it wasn’t even there.' height='17rem' %}



### …vs. Visibility?

You can also hide something [visually](https://developer.mozilla.org/en-US/docs/Web/CSS/visibility) without taking it out of the document *flow,* which is useful when you don’t want the page to jump/*reflow* when something appears/disappears. Setting `visibility: hidden;` keeps the space an element had before, but makes it invisible and unable to be interacted with. The value `visible` is the default.

{% include figure.html src='/example/visibility/demo' height='22rem' %}



### …vs. Opacity?

Another way to hide an element visually is to adjust [its opacity](https://developer.mozilla.org/en-US/docs/Web/CSS/opacity), which uses values on a scale from 0–1. This differs from `visibility` because elements with no (or partial) opacity can still be interacted with.

{% include figure.html src='/example/opacity/demo' caption='You can still select the text (or click links) of not-fully-opaque elements.' height='22rem' %}

Keep in mind that `display: none;`, `visibility: hidden;`, and `opacity: 0;` only hide things in the rendered browser view. The HTML is still visible in the source code!



### … `flex` and `grid`?

We’ll cover these separately! But they’ll make your (layout) life easier.
