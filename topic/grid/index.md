---
title: And (CSS) grid
order: 7
published: false
---



[CSS grid layout](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Grids#line-based_placement) (from here on, just *grid*) is another, even more recent addition to CSS, continuing on from [*flexbox*](/topic/flexbox/). While flex is a *one-dimensional* layout system—focused on horizontal *or* vertical arrangements—grid is *two-dimensional* system, integrating the two directions together.
{: .left }

- [A complete guide to grid | CSS-Tricks](https://css-tricks.com/snippets/css/complete-guide-grid/) \
	*The <em>grid</em> version of the <em>flexbox</em> classic.*

- [CSS Grid Layout: A New Layout Module for the Web](https://webkit.org/blog/7434/css-grid-layout-a-new-layout-module-for-the-web/) \
	*WebKit (Safari’s) overview/introduction, from 2017.*

- [Basic concepts of grid layout | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout) \
	*Back to MDN.*

- [Basics of CSS Grid](https://www.youtube.com/watch?v=FEnRpy9Xfes) \
	*Web guru [Jen Simmons](https://jensimmons.com) breaks it down.*

- [Flexbox vs. CSS Grid](https://www.youtube.com/watch?v=hs3piaN4b5I) \
	*And also helps unpack when to use flex/grid.*

- [Grid Garden](https://cssgridgarden.com) \
	*Like the Froggy game, but for grid.*
{: .no-marker .icon-link .right rows="6" }

Grid supplants many of the previous box model layout systems (like floats, margin-centering, etc.) and, like flex, works much closer to how we think about layouts *as designers*. It can get complicated, but makes most layouts (especially responsive ones) much, much easier to implement.

*We had some of this two-dimensionality with [<nobr>flex-wrap</nobr>](/topic/flexbox/#flex-wrap), but grid offers much more control.*



Grid is *a lot* like flex (this will be a running theme)—<wbr>a [*display*](https://developer.mozilla.org/en-US/docs/Web/CSS/display) property applied on a parent/<wbr>container element. This `display: grid;` tells its (immediate) children/<wbr>*grid items* how they should be laid out.
{: .two-above }

And again like flex, there is also `display: inline-grid;` which behaves the same internally—<wbr>but with the parent behaving as an inline element.



## Grid terminology

Grid introduces us to some new vocabulary:

![Borrowed from the [WebKit post](https://webkit.org/blog/7434/css-grid-layout-a-new-layout-module-for-the-web/).](grid-concepts.svg)

Borrowed from the [WebKit post](https://webkit.org/blog/7434/css-grid-layout-a-new-layout-module-for-the-web/).

Line
: The dividing lines that define the grid, vertical or horizontal. (Think *gutters*.)

Track
: The horizontal or vertical space between the lines. (Think *rows* and *columns*.)

Cell
: The intersection of a horizontal and vertical track. This is different from a *grid item—*the cell is the spot/placement, the item is the actual element—since as you’ll see, you can position *items* in an arbitrary *cell*.

Area
: You can combine one or more adjacent grid cells into a rectangular *area.* Often you give these a name, for convenience.



## New units and functions



Grid also introduces some specific new [length units](/topic/box-model/#and-their-units) and functions to use them:

`fr`

: This [new unit](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout#the_fr_unit) represents a *fraction* of the available space in the grid container—usually, *width*. This is kind of like using *percentages*, except we no longer have to do the maths and any *padding* or *gap* (gutter) is already accounted for. This is very handy; you’ll use it a lot.

	```css
.two-thirds-one-third {
	display: grid;
	grid-template-columns: 2fr 1fr;
}
	```

`min-content`
: The [intrinsic minimum width](https://developer.mozilla.org/en-US/docs/Web/CSS/min-content) of an element. With text, this is the longest single word.

	```css
.narrow-sidebar {
	display: grid;
	grid-template-columns: 1fr min-content;
}
	```

`max-content`
: Same for [the maximum](https://developer.mozilla.org/en-US/docs/Web/CSS/max-content). With text, this is the whole sentence/line.

	```css
.wider-sidebar {
	display: grid;
	grid-template-columns: 1fr max-content;
}
	```


`fit-content`

: A [combo of the min/max](https://developer.mozilla.org/en-US/docs/Web/CSS/fit-content). Uses available space—but never less than `min-content` and never more than `max-content`.

	```css
.fit-sidebar {
	display: grid;
	grid-template-columns: 1fr fit-content;
}
	```

*You can use these three values in grid properties, as we’ll see <nobr>below—</nobr>but they are also usable anywhere length units work—like `width`.*

`minmax()`

: A function that [defines a range](https://developer.mozilla.org/en-US/docs/Web/CSS/minmax) for a *track*, setting a minimum and maximum length together. These are really useful for setting reasonable limits on responsive grid designs!

	```css
.flexible-sidebar {
	display: grid;
	grid-template-columns: 1fr minmax(200px, 400px);
}
	```

`repeat()`

: This function [repeats a *track* list](https://developer.mozilla.org/en-US/docs/Web/CSS/repeat), so you don’t have to write it over and over.

	```css
.twelve-columns {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
}
 
.also-twelve-columns {
	display: grid;
	grid-template-columns: repeat(12, 1fr); /* Much better. */
}
	```

*Whenever you are writing the same exact code over and over, there is probably a shorter way. [Don’t repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)!*



## Container (parent) properties

Again, *grid* is a lot like *flex*—primarily properties that are applied on a container/parent element.



### `grid-template-columns` / `grid-template-rows`

Setting `display: grid;` won’t do much until you also declare some [columns](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns) or [rows](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-rows), with *grid template*. You can specify `grid-template-columns`, `grid-template-rows`, or both. These properties are followed by a *track list* of the size for each track:

{% include figure.html src='/example/grid-template/demo' caption='Notice in the second example, the items do not *wrap* to a new column—because `grid-auto-flow: row;` is the default setting. The third example sets this to `column` to make it flow to a new one.' height='52rem' %}

Again like *flex*, there is similar behavior on the horizontal/vertical *axes—*with the defaults around horizontal/row based behavior since width is usually our constraint (with pages scrolling vertically).

So for many uses, you will only need to specify your column <nobr>structure—</nobr><wbr>leaving the rows to create themselves, as needed. This is called an *implicit grid* (vs. an *explicit grid* that we set/define):

{% include figure.html src='/example/grid-template-columns/demo' caption='The additional rows are automatically added, as needed. Note that they size vertically to their content.' height='20rem' %}



### `grid-auto-columns` / `grid-auto-rows`

By default, these *implicit grid* tracks are sized `auto` (to their content), but you can also specify their size—often [a *height*](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-rows) for the `grid-auto-rows`:

{% include figure.html src='/example/grid-auto-row/demo' height='29rem' %}


But `grid-auto-columns` only comes up if you force the columns to wrap with `grid-auto-flow: column;` as in the earlier example. Again, height is usually not our main constraint, with scrolling!



### `gap` / `column-gap` / `row-gap`

*Grid* also shares the `gap`, `column-gap`, and `row-gap` [properties with *flex*](/topic/flexbox/#gap-row-gap-and-column-gap)—to add gutters between the *tracks*. The syntax and behavior is the same!

{% include figure.html src='/example/grid-gap/demo' height='57rem' %}





### `justify-items`

Also [like *flex*](/topic/flexbox/#justify-content) (there’s a pattern here), we can position items within the tracks—but now we have control over both axes and the overall placement. To start, `justify-items` positions all the *grid items* along their row axis.

The terminology here is always a bit confusing, but think of it this way—in *grid*, the main axis is always the horizontal row. So *justify* always means left/right, and *align* always means top/bottom. Easier to remember than flex!

{% include figure.html src='/example/grid-justify-items/demo' height='70rem' %}





### `align-items`

And `align-items` directly corresponds to the [flex values](/topic/flexbox/#align-items), to position all the *items* vertically along their column axis:

{% include figure.html src='/example/grid-align-items/demo' caption='Note that there isn’t any change on the last *implicit* row with the default `auto`/content height.' height='70rem' %}

There are [also baseline align values](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items), but I don’t think I’ve ever seen them used in grid—your layouts are often too nested/complicated for them to work.



### `justify-content` / `align-content`

If the total size of your grid is less than the container (because of your *explicit* column or row sizes), you can set the *overall* justification and alignment within the container. Again, [this is just](/topic/flexbox/#justify-content) [like flex](/topic/flexbox/#align-items)! Same syntax, same behavior—you get the idea. Grid is like *Flex+*.

{% comment %} TODO: VISUAL {% endcomment %}



### Shorthand?

*Grid* also has [shorthand properties](https://developer.mozilla.org/en-US/docs/Web/CSS/grid) for many of these, like `grid`, `grid-template`, `place-items`, and `place-content`. However, grid is complicated enough as it is! The shorthands really obfuscate the behavior, and aren’t worth the tighter syntax.

> Okay, so this is mostly like flex! To the point where you can use them interchangeably for some layouts. You get it. But now let’s look at where grid offers more specific and powerful control.
{: .callout icon="🤨" }



### Using repeat

*Grid’s* `repeat` function is very commonly used to make even-width grids. And of course, they can be made responsive with [media queries](/topic/media-queries) and [CSS variables](/topic/responsive/#briefly-css-variables)!

{% include figure.html src='/example/grid-template-columns-repeat/demo' caption='Notice that the *items* always stick to the grid structure—independent of their content—unlike our previous `flex-wrap` pseudo-grids.' height='38rem' %}

*Flex* is [sometimes referred](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Relationship_of_Grid_Layout) to in this way as *content-out*, while *grid* is a *layout-in* system.


### `auto-fill` / `auto-fit`

You can also use the `repeat` function without specifying an exact number of columns, instead using `auto-fill` or `auto-fit` to [automatically define](https://css-tricks.com/auto-sizing-columns-css-grid-auto-fill-vs-auto-fit/) your columns—making a grid inherently responsive without any media queries! These are great for controlling an even-column layout without much overhead:

{% include figure.html src='/example/grid-template-columns-repeat-auto/demo' caption='Drag the divider over to see the difference in `auto-fill` / `auto-fit` behaviors' height='53rem' %}



### `grid-template-areas`

*Grid* is really useful for scaffolding out layouts, and sometimes it is helpful to give your [*grid areas* qualitative/descriptive names](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-areas) that reflect their usage. This also makes it possible for the *grid items* (children) to reference them, below.

This is done with a bit of [ASCII art](https://en.wikipedia.org/wiki/ASCII_art) to reflect the layout! Repeating the name of a *grid area* makes the content span those cells. The syntax itself then provides an ergonomic visualization of the grid structure (for us humans):

```css
section {
	display: grid;
	grid-template-columns: 2fr 1fr;
	grid-template-areas:
		"header header "
		"main   sidebar"
		"footer sidebar";
}
```
{: .half }

You can also [name grid lines](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-rows#syntax) with `[linename] length` syntax, but I’ve never found this very useful.



## Item (child) properties



You can really start to see the power of *grid* when you use these properties on the individual *grid items* (children) within the containers. While the container (parent) properties usually make for uniform layouts, item (child) properties allow for unique structures.



### `grid-area`

If you’ve defined `grid-template-areas` (as [above](#grid-template-areas)), you can then assign individual children to these areas:

{% include figure.html src='/example/grid-area/demo' height='66rem' %}

This is the [kind of common layout](https://en.wikipedia.org/wiki/Holy_grail_(web_design)) that was unnecessarily hard before grid!



### `grid-column` / `grid-row`

You can also control *item* placement in unnamed (and *implicit*) grid areas with the `grid-column` and `grid-row` properties. These take two values, divided with a `/` (because CSS is inconsistent), which specify the *start line* and *end line*. (These are technically [shorthand](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column) [properties](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row), but I’ll allow it—they are easier to read!) There is also a `span` value for bridging across tracks:

{% include figure.html src='/example/grid-column-row/demo' caption='Notice that we can leave off the *end line* if it doesn’t `span` multiple tracks, and also that you either add a `span` *or* a specific *end line* number.' height='48rem' %}

You can also leave off the *start line* if you just want to specify a `span`, regardless of where the item falls in the grid:

{% include figure.html src='/example/grid-template-columns-span/demo' caption='I’ve added `grid-auto-flow: dense;` to the container—allowing the fifth item to [scoot up](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-flow) “before” the bigger one.' height='30rem' %}

Keep in mind that with both `grid-area` and `grid-column` / `grid-row`, you are able to tell multiple *grid items* to land in the same *cell*—there isn’t any kind of fancy collision-proofing. If this is what you want, you can use `z-index` to specify which one is visually [in front](/topic/box-model/#depth)!



### `justify-self` / `align-self`

Again, just like flex—you can position individual *grid items* within their *tracks* using `justify-self` and `align-self`. The syntax is the same as [align in flex](/topic/flexbox/#align-self), except the `flex-start` and `flex-end` values are just `start` and `end`. (The default, as before, is `stretch`.)

{% comment %} TODO: VISUAL {% endcomment %}
