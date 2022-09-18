---
title: The box model
order: 3
published: false
---



The first thing we need to understand is how CSS sizes elements. This is called the [*the box model*](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model), as everything on the web begins as a rectangle:
{: .left }

[Introduction to CSS layout | MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Introduction) \
*As usual.*
{: .right .icon-link rows="2" }

{% include figure.html src='box-model.svg' caption='With `box-sizing: content-box;` per the spec.' %}

By default, browsers are set to `box-sizing: content-box;` which means that the padding (and border) exists *outside* the content width or height—so padding is then an *outset.*

But this is often unintuitive and doesn’t fit with most web design patterns, so it is very common (nearly universal) to instead set this to `box-sizing: border-box;` which makes padding and border exist *inside* the content dimensions. Then padding is easier to think of as an *inset*. ([W3C](https://www.w3.org/TR/css-box-3/) probably got this default wrong. Good ol’ CSS!)

{% include figure.html src='box-model-border.svg' caption='With `box-sizing: border-box;` the defacto standard.' %}



Let’s take a look, going inside-to-outside.



## Content



The *content area* is the guts of the element, usually text or an image. Its dimensions are defined by that content, but also can be specified directly via `width` or `height`. (More on those soon.)

{% include figure.html src='/example/content/demo' height='28rem' %}

> I’ve pulled the [CSS reset](/topic/css#resets) into the `<head>` all of these examples, so we are only seeing styles that are expressly written out here.
{: .callout .two-above icon="🤚" }



## Padding



Next comes [*padding*](https://developer.mozilla.org/en-US/docs/Web/CSS/padding), which extends the element’s area around the content. I often think of this as an *outset* or an *inset,* depending on the next point.

*Most [CSS resets](/topic/css#resets) will do this for you! Like I said, very common.*

{% include figure.html src='/example/padding/demo' %}



### A sidebar about *shorthand*

*Padding*—and many other properties, like *border* and *margin*—can be specified with a [shorthand property](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties) to make it easier to use the same spacing all around, or shared top/bottom and left/right. (We’ll talk about units, below.)

- 1 value: *all directions/sides*
- 2 values: *top/bottom, left/right*
- 3 values: *top, left/right, bottom*
- 4 values: *top, right, bottom, left*
{: .half .two-above }

```css
p {padding: 20px;}
p {padding: 20px 40px;}
p {padding: 20px 40px 80px;}
p {padding: 20px 20px 40px 80px;}
```
{: .half }

You can always write the individual directions out, though (like `padding-top`). Three- and four-value rules are harder to read, so I tend to avoid them.



## Border



Then we have *[border](https://developer.mozilla.org/en-US/docs/Web/CSS/border)*. Border is… the border around an element. It has its own `border-width`, `border-color`, and also `border-style`:

{% include figure.html src='/example/border-style/demo' %}

Look at all those borders. Border, border, border… what does that word even mean. Border.

{% include figure.html src='/example/border/demo' %}

This uses the shorthand `border-top` property. The order of the values here doesn’t matter! Isn‘t CSS logical.



## Margin



Last is *[margin](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)*—the space *around* an element, empty/whitespace areas that is used to separate an element from its *siblings*. Like *padding* and *border*, you can specify it all around or on individual sides.

{% include figure.html src='/example/margin/demo' %}

Margin has a couple tricks up its sleeve. First, it can have *negative* values—which will eat up/remove space between elements. (*Padding* and *border* only take up space.) Just add a zero before the value and watch it bring things together.

{% include figure.html src='/example/margin-negative/demo' %}

The first element pulls the second element closer with a *negative* margin.

Also [margins *collapse*](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing), meaning that they are sometimes combined into a single value (the largest) between two elements. This happens most often on adjacent siblings, and is both useful and an absolute pain.

{% include figure.html src='/example/margin-collapse/demo' %}

You might expect the margin between the first two `div` to be `60px`, but it is only `40px`. They *collapsed.*



## Units, oh my



Okay, so we have all these box properties—but how do we specify the dimensions? CSS has many [length units](https://developer.mozilla.org/en-US/docs/Web/CSS/length), used for `width`, `height`, and also  `padding`, `border`, `margin`, and even `font-size`. (Picas, anyone?) We’ll look at some common ones.



### Absolute

Maybe the easiest to understand, fixed to a physical (well, sort of) size.

*With the many vagaries of screen size and density, the physical lengths will only be correct when you print. And maybe not even then. And who prints anymore?*

```css
.pixels {
	width: 720px;
	height: 360px;
}

.inches {
	width: 10in;
	height: 5in;
}

.mm {
	width: 400mm;
	height: 84mm;
}
```



### Relative

Otherwise you can use *relative* units, which depend on and respond to their context.

*I think these are distinctly and intrinsically web measurements.*

```css
/* Relative to nearest **sized** ancestor. */
.percentage {
	width: 85%;
	height: 90%;
}

/* Relative to the **v**iewport **w**idth or **h**eight. */
.viewport {
	width: 80vw;
  height: 75vh;
}

/* Relative to **font-size** of the **e**le**m**ent. */
.em {
	width: 4em;
	height: 14em;
}

/* Relative to the **r**oot **e**le**m**ent font size. */
.rem {
	width: 2rem;
	height: 12rem;
}
```



### Calc

Sometimes you might want to use these together! Or otherwise do some math. For this we have the [calc function](https://developer.mozilla.org/en-US/docs/Web/CSS/calc()).

```css
.absolute-and-relative {
	width: calc(50% - 20px);
}

.computer-do-the-math {
	width: calc(100% / 12);
}
```

<aside>
😥 CSS is big and massive and overwhelming and sometimes nonsensical—but remember that you can do a surprising amount with just these basic properties!

And no matter how complex it gets, it always comes back to these basics.

</aside>

## Position

---

With an idea of how elements take up space, now we’ll look at how they exist and move together in the [*document flow](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Normal_Flow).* The CSS property `position` [sets this relationship](https://developer.mozilla.org/en-US/docs/Web/CSS/position).



### `static`

By default, every element is *static—*just meaning its normal, stacked position in the document.

*You’ll rarely, if ever, actually set this yourself. It’s the default you change.*

{% include figure.html src='/example/position-static/demo' %}

Nothing changes here—`static` is the default.



### `relative`

The first thing we might want to do is adjust an element *from* that normal *static* position, which we can do with *relative* positioning.

Once you have set `position: relative;` you can use the  `top`, `right`, `bottom`, and `left` values (with any of the units, above) to move the element away from its default, normal position in the flow.

{% include figure.html src='/example/position-relative/demo' %}

The element still exists/takes up space in the *flow*.



### `absolute`

*Absolute* positioning is somewhat similar to *relative—*but instead of placing an element in relation to its own default position, it uses the position of its nearest *relatively-positioned* ancestor. So it will “go up the chain” of parents and wrapper elements until it finds one set to `position: relative;`, then uses the same offset properties to move the element around.

Importantly, `position: absolute;` also *removes* the element from the normal document flow—meaning it takes up no space in the page layout.

*This is often used for exacting, specific design elements.*

{% include figure.html src='/example/position-absolute/demo' %}

The element is out of the *flow*, and placed according to the `relative` parent.



### `fixed`

*Fixed* positioning also removes the element from the document flow, but it places elements with relation to the *browser viewport*—the boundaries of the window or device.

So `position: fixed;` brings the element completely out of the page’s normal flow, like it is sitting on its own separate layer.

*This is often used for things like navigation elements.*

{% include figure.html src='/example/position-fixed/demo' %}



### `sticky`

The most recent addition to the *position* party, `position: sticky;` elements are placed according to the normal flow of the document, like *static,* until their nearest *scrolling ancestor* (usually the viewport) moves past them. The element is then *stuck* in relation to this element.

*This is often used for headers on tables and lists.*

{% include figure.html src='/example/position-sticky/demo' %}



### `z-index`

Okay, *[z-index](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index)* is not strictly positioning—it is a separate property. You can see that all these *position* properties have given us ways to make things overlap. `z-index` is how we can decide the *front-to-back* ordering (think [*z-axis*](https://en.wikipedia.org/wiki/Cartesian_coordinate_system#Three_dimensions)).

By default, items that are lower in the DOM (coming after each other) are in front of higher, earlier elements.

{% include figure.html src='/example/z-index/demo' %}

The two `position` properties create new stacking contexts, `z-index: 1;` moves even elements in front.

A whole lot of things make a new *[stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context)* (including most `position` changes) **which is kind of like a *group* that has its own internal depth/overlap order. No amount of internal *z-index* adjustments can break something out of that group—which is one of the reasons why *z* can be really difficult to understand and a pain to use. But you can adjust the *z-index* of the group, as we do here.

## Floats

---

Sometimes you’ll want to have an image or block flow within a block of text. There are a lot of ways to do this now, but the oldest (yet sometimes trickiest) is a [*float*](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats).



### `left` and `right`

The declarations `float: left;` and `float: right;` take an element out of the normal flow and place it on the left or right side of its parent container. Any text *siblings* will then flow around the element—like a *text wrap—*filling up any available space to its side. They will go as far up as the top of the *floated element*.

{% include figure.html src='/example/float/demo' %}



### Don’t forget to `clear`

Since this takes the floated element out of the *flow*, if we want the following element (often another text block, like a `<p>`) to not move up it needs to be *cleared* with `clear: left;` , `clear: right;`, or `clear: both;`. Applied on the following element, it will make it stay entirely below (clear of) the *floated* element.

{% include figure.html src='/example/float-clear/demo' %}

Uh oh, classic *float* problem on the second one.

If you have a parent wrapper and no following element, there won’t be anything there to *clear* the float—meaning the parent will collapse down to the size of the text content. You can solve this broken look with a *[clearfix hack](https://developer.mozilla.org/en-US/docs/Web/CSS/clear#sect1)*, which uses a pseudo-element as an ersatz `last-child` to clear the container.

{% include figure.html src='/example/float-clearfix/demo' %}

Much better. `:after` is a pseudo-element—which acts here as a last child that clears the `div`.

*Generally, I try and avoid floats—they aren’t common in modern design patterns and have been giving people headaches for decades now. They require you to know how long your content is and also how big your viewport/page will be—both things that you don’t always have control over in 2022.*

*But sometimes they still are the only thing that can do what you need.* 🔥

## Display

---

In our [HTML introduction](/topic/html) we briefly talked about *block* and *inline* elements, as set by the user-agent styles. These are the first two examples of [the *display* property](https://developer.mozilla.org/en-US/docs/Web/CSS/display).



### `block`

So as we discussed, most HTML elements are *block-level* by default. But you can also set `display: block;` manually on an *inline* element, too. This would mean that it starts on a new line, takes up the full width available, and you can specify a `height`, `width`, and use `margin` above and below.

{% include figure.html src='/example/display-block/demo' %}

Whenever you are linking a whole area (like an image and text together), safe bet you want `block`.



### `inline`

And going the other way, you can make *block* elements switch to *inline* with `display: inline;`. They will no longer start on their own lines, will only take up as much space as their content/children, and don’t accept `height` and `width` properties.

{% include figure.html src='/example/display-inline/demo' %}

The `white-space` property `pre`-vents the spaces in the paragraphs from collapsing.



### …but also `inline-block`

You can also combine the qualities of *block* and *inline* with `display: inline-block;`. These elements take `height` and `width` (and vertical `margin`) like *block-level* elements, but do not start on their own line.

{% include figure.html src='/example/display-inline-block/demo' %}



### And `none`

Setting `display: none;` hides an element visually from the document—as well as taking it out of the *flow*. (Keep in mind the HTML is still there, if someone opens up their [Inspector](#LINK THIS?).

This is a common way to hide/show (by setting another *display* property) elements on the page, but it will *reflow* the document when applied—as if the element is actually added/removed from the DOM.

{% include figure.html src='/example/display-none/demo' %}

Like it wasn’t even there.



### …vs. Visibility?

You can also hide something [visually](https://developer.mozilla.org/en-US/docs/Web/CSS/visibility) without taking it out of the document *flow,* which is useful when you don’t want the page to jump/*reflow* when something appears/disappears. Setting `visibility: hidden;` keeps the space an element had before, but makes it invisible and unable to be interacted with. The value `visible` is the default.

{% include figure.html src='/example/visibility/demo' %}



### … vs. Opacity?

Another way to hide an element visually is to adjust [its opacity](https://developer.mozilla.org/en-US/docs/Web/CSS/opacity), which uses values on a scale from 0–1. This differs from `visibility` because elements with no (or partial) opacity can still be interacted with.

{% include figure.html src='/example/opacity/demo' %}

You can still select the text (or click links) of not-fully-opaque elements.

Keep in mind that `display: none;`, `visibility: hidden;`, and `opacity: 0;` only hide things in the rendered browser view. The HTML is still visible in the Inspector and source code!



### … `flex` and `grid`?

We’ll have to cover these separately! But they’ll make your (layout) life easier.
