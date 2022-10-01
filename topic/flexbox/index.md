---
title: Finally, flexbox
order: 6
published: false
---



[*Flexbox*](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Flexbox), short for *flexible boxes*—which folks will often just shorten all the way to *flex*&#8288;—is a relatively recent addition to CSS. (Is 2017 still recent? It feels like a lifetime ago.) *Flex* was created to facilitate and allow CSS layouts that the [*the box model*](/topic/box-model/) (with its *floats* and *position*) either made difficult, brittle, or even impossible. It is a *[display](https://developer.mozilla.org/en-US/docs/Web/CSS/display)* property.
{: .left }

- [A complete guide to flexbox | CSS-Tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) \
  *This page is a classic! I’ve referenced it for years. This article probably bought [Chris Coyier](https://chriscoyier.net) a house.*

- [Basic concepts of flexbox | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox) \
  *Can’t go wrong.*

- [Flexbox Froggy](https://flexboxfroggy.com/) \
  *Lil’ game.*
{: .no-marker .icon-link .right rows="2" }



And let me tell you—being a web designer was a whole lot harder before *flex* came on the scene. (Hence the “Finally.”) Notice that we haven’t yet talked about vertical centering, for instance—you don’t want to know. And you don’t have to worry about it! Flex encapsulates a lot of decent Design paradigms in its system.



## *Main* and *cross* axes

Flexbox is a *one-dimensional* layout system—meaning it is (usually) focused on arranging items either horizontally in rows, or vertically in columns:

![I [borrowed](https://medium.com/fasal-engineering/css-flexbox-explained-998ea188a351) this, it’s alright.](Untitled.png)

I [borrowed](https://medium.com/fasal-engineering/css-flexbox-explained-998ea188a351) this, it’s alright.

These are called the *axes*, and the one running in the direction of your flex items is your *main axis*. Perpendicular to this is your *cross axis*.



## Start/end

In both directions, flex also lets us position elements towards the *start* or the *end* of the *axis:*

- *For rows:* the start/end in the *main axis* are left/right, and in the *cross axis* are top/bottom.

- *For columns:* it is perpendicular—the *main* start/end means top/bottom, and the *cross* is then left/right.

![This is from the masterpiece [CSS Tricks article](https://css-tricks.com/snippets/css/a-guide-to-flexbox/). ](00-basic-terminology.svg)

This is from the masterpiece [CSS Tricks article](https://css-tricks.com/snippets/css/a-guide-to-flexbox/).



### Shorthand?

Like a lot of CSS, *flex* has [shorthand](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) [properties](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow). But I would avoid them—the system is hard enough to understand, and we aren’t being charged by the CSS line. This will be true when we get to `grid` as well—often being a little bit more verbose in your code will make things easier to understand, especially starting out.



## Container (parent) properties



Unlike most (…all?) of the CSS we’ve been introduced to, *flex* is applied on a *parent* element—but actually adjusts the layout of the *children*. An element with `display: flex;` is really telling you what its kids are going to be doing.

*There is also `display: inline-flex;` which behaves the same, but the parent behaves as an inline element while its children are flexing.*



### `flex-direction`

After specifying an element as *flex*, we can set its main axis with `[flex-direction](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction)`. By default (you don’t have to write it) this behaves as `flex-direction: row;`, so you’ll generally only be adding it when you want something going vertical—with `flex-direction: column;`.

{% include figure.html src='/example/flex-direction/demo' %}



The first section is `display: block;` by default. Also note that I gave them all a height, to show start/end!

You can also combine these with a *reverse* option, which visually reorders the items along the *main axis*, flipping the *start* and *end*.

{% include figure.html src='/example/flex-direction-reverse/demo' %}



*Keep in mind that this reordering is only visual—it does not change the order in the DOM. This means that keyboard navigation and screen readers still sequence through the items as they are in the HTML. So for good accessibility, keep in mind that semantic order!*



### `flex-wrap`

Since flexbox is *one-dimensional*, by default it is going to try and cram everything into one line—even when there is not enough room! But you [can tell it to *wrap*](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap) onto additional lines by adding a `flex-wrap: wrap;` property (which behaves as `flex-wrap: nowrap;` by default).

{% include figure.html src='/example/flex-wrap/demo' %}



*You can use this to make grids, and it is often sufficient. But but the [more recent CSS grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout) properties will give you more control! We’ll talk about it soon.*

There is also a *reverse* option here, which will wrap items from *end* to *start*. (I don’t think I have ever used these, honestly.)

{% include figure.html src='/example/flex-wrap-reverse/demo' %}



I guess you could do some weird layouts with these.



### `justify-content`

Okay, so most of what we’ve seen here is somewhat possible using *floats* and *positioning—*though not at all easily and only when you know the size/count of your content. But `[justify-content](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content)` **is where flexbox starts to allow novel layouts, by dividing up the extra/available free space  elements.

{% include figure.html src='/example/flex-justify-content/demo' %}



I’m not going to show the vertical `flex-direction: column;` here, but it works the same—*but only if it has a height to justify within*! Otherwise the container will cinch up to the content height, as usual.



### `align-items`

And then perpendicular to *justify* along the *main axis,* flexbox has **`[align-items](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items)` to position elements along the *cross axis*. It has similar values.

{% include figure.html src='/example/flex-align-items/demo' %}



Again, these also work for `flex-direction: column;`! Where they will move things left/right.



### `align-content`

When we have a flex element with `flex-wrap` set, we can also [position the *lines* within](https://developer.mozilla.org/en-US/docs/Web/CSS/align-content) the parent/container—akin to `justify-content` with individual items.

{% include figure.html src='/example/flex-align-content/demo' %}



### `gap`, `row-gap`, and `column-gap`

While you could use *margin* to separate your flex children, it would apply to the items on the outer edges, too. (Hence all my `:not(:first-child)` selectors. Flex recently gained support for `[gap` properties](https://developer.mozilla.org/en-US/docs/Web/CSS/gap), which fix this problem—by applying spacing only *between* children.

This is particularly helpful with dynamic, wrapping content and responsive designs—where you won’t always know which element ends or starts a line (to take their margin off).

{% include figure.html src='/example/flex-gap/demo' %}



Note the last one, `gap` are really *minimums* and only apply when there isn’t otherwise space.

The `justify`, `align`, and `gap` properties are also shared (in name and behavior) with `display: grid;`, when we get there!

<aside>
😵‍💫 This is a lot of stuff! Flex can be tough to wrap one’s head around, but it is *so much better* than float and width and margin shenanigans. Much of what you look at on the web is laid out in flex (and its sort-of successor which I keep hinting at, *grid*).
</aside>



## Item (child) properties



I know I said that flexbox is applied on the parent/container—and that is true. But once you’ve applied `display: flex;` on an element, there are also some individual override properties that can be given to its children, *flex items*.



### `order`

Kind of like the *reverse* properties—you can individually [apply an `order`](https://developer.mozilla.org/en-US/docs/Web/CSS/order) to a *flex item*. Items with the same/tied order (like everything with the default of `order: 0;`) will be displayed in their source order.

{% include figure.html src='/example/flex-order/demo' %}



With the last one, since the default is `order: 0;`, negative numbers move stuff up to the front!

*Other order selectors (like `:first-child`) won’t be fooled by this reordering—as you can see, I used them here. They still use the DOM order. And again, this change is only visual—so don’t use it when screen reader/content sequence accessibility is a concern!*



### `flex-grow` and `flex-shrink`

These tell the child items to… [grow](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow) or [shrink](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink), if necessary—defining the amount of available/remaining space in the container an element should take up. (This is how we get our bento boxes.)

It takes a *unitless* proportional value (think fractions or a factor/multiplier). If you give one flexed child `flex-grow: 1;` it will take up all the extra space; another element with `flex-grow: 2;` would then take twice as much of that space as the first one (the available space with 3 total units).

{% include figure.html src='/example/flex-grow-shrink/demo' %}



And `flex-shrink` works the same way—defining what proportion an element should shrink when forced to by the flex layout. The most use you’ll see of this is `flex-shrink: 0;`, which tells all the *other* items to shrink instead!



### `flex-basis`

*Flex-basis* is a little like *width* and *height*—depending on your *main axis*. This property defines what the child item’s content box size should be before any remaining space is distributed. This defaults to `auto`, which falls back to any specified `width` or `height`—and if those aren’t present, will just use the size of the content.

You specify this *basis* with normal [length units](/topic/box-model/#and-their-units) like `%` and `px`.

{% include figure.html src='/example/flex-basis/demo' %}



### `align-self`

Finally, we have an individual override for an [`align-items`](#align-items) property set on the parent—which adjusts (with the same keywords/values) the alignment of the specific child item it is applied to.

{% include figure.html src='/example/flex-align-self/demo' %}
