---
title: Media queries
published: false
order: 4
---



## What is responsive design?
{: .no_toc }


Let’s first take a minute to talk about *responsive design*. This term was coined in 2010 or so [by Ethan Marcotte](https://alistapart.com/article/responsive-web-design/)—wrapping a name around a [*progressive enhancement*](https://alistapart.com/article/understandingprogressiveenhancement/) and [*mobile first*](https://www.lukew.com/ff/entry.asp?933) web design approach/<wbr>philosophy that had been growing in the mid-2000s (sometimes called *liquid, flexible, fluid,* or *elastic* design). Instead of serving a desktop site and a separate, minimal mobile version (if you even did at all)—you could instead adapt one site.
{: .left }

* [Responsive design | MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design) \
  *A pretty nice overview.*

* [Beginner's guide to media queries | MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Media_queries) \
  *Slightly overlapping, but also good.*

* [Using media queries | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries#media_features) \
  *Okay, that’s probably enough MDN.*
{: .right .no-marker .icon-link rows="2" }

There was a confluence of events that allowed this: modern, self-updating browsers, and then the explosion of *the mobile web—*precipitated, in no small part, by the *iPhone* in 2007. It ran a desktop-class browser (in terms of functionality), which hadn’t been available in a small screen before. And with its crazy success—and subsequent proliferation of its paradigm in *Android*—the web, and then world, scrambled to *respond*.

{% include figure.html src='responsive.svg' caption='A typical/example *responsive* layout.' class="four-above" %}



> Empty your mind. Be formless, shapeless, like water. You put water into a cup, it becomes the cup. You put water into a bottle, it becomes the bottle.
You put it into a teapot, it becomes the teapot. Now water can flow or it can crash. Be water, my friend.
{: .quote }

<cite>[Bruce Lee](https://www.youtube.com/watch?v=fEDfznOP820)</cite>



> Content is like water. Content’s going to take many forms, flow into many different containers, many of which we haven’t even imagined yet. Build from content out, not container in.
{: .quote }

<cite>[Josh Clark](https://bigmedium.com/jhc/prez/mobile-myths.pdf)</cite>



## The *viewport*



You’ll see this in the `<head>` of most websites:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

When the iPhone came on the scene, sites didn’t have narrow/smaller (responsive) layouts so the phone would instead *scale* or *zoom out* a desktop site design to fit. Websites then were often designed to a standard `960px` width, which the phone shrank down to its `320px` screen—and then the user could zoom in or out. It worked, but it was less than ideal.

This `meta` element tells the browser not to do this. It says, *“I have a responsive design! Render me at my actual size.”*

The `width=device-width` tells the browser to use whatever the screen’s actual pixel dimension is, and `initial-scale=1` sets the starting zoom of the page to 100%. This is how the browser knows how to make the page respond, and how our CSS rules know what width to use.



![From the [iPhone introduction](https://youtu.be/VQKMoT-6XSg?t=2474), worth a watch. He definitely “dented the universe.”](CSS!%20(Media%20queries)%20d34a5ded94354f84a3ffa00b8af3454b/iphone.png)

From the [iPhone introduction](https://youtu.be/VQKMoT-6XSg?t=2474), worth a watch. He definitely “dented the universe.”

![Simpler times.](CSS!%20(Media%20queries)%20d34a5ded94354f84a3ffa00b8af3454b/6a010535fde333970c01310fa67168970c-320wi.jpg)

Simpler times.



## Media queries



Responsive design could only really flourish when CSS added the `@media` *[at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries)* around the same time. These are colloquially called *media queries*, and they allow us to check if screen is a certain width or resolution (or other features, which we’ll get to)—and then apply selective CSS only in that scenario.

Practically, these are blocks of CSS—a little bit like *[selectors](https://www.notion.so/CSS-Fundamentals-6ea128fa0cfd4b46972d85348850af70)* that contain other selectors—but which only apply conditionally when the test/criteria is met.

```css
/* Our CSS has all been out here. */

**@media some-criteria-or-rule {**
  /* CSS that only applies if the test passes. */
**}**
```

*These blocks are like any other CSS—if there are multiple conditions that are met, the rules [cascade](https://www.notion.so/CSS-Fundamentals-6ea128fa0cfd4b46972d85348850af70) down and the lowest one takes precedent.*



## Width-based *breakpoints*



There are lots of media queries we can use, but we’ll start with *width*—which is by far the most commonly used and really the core of *responsive design*. Usually when folks are talking about a page or site being *responsive*, they mean with regards to `width`.

Width will vary the most between devices—from the (now) `375px`–`428px` of your phones, through the ~`1440px`–`1680px` of your laptops, up to the ~`2560px`–`3440px` you might see on desktop displays. Since this `width` is usually our primary design constraint (`height` being handled with scrolling), we need *width-based* media queries to adjust our layouts across this wide range, lest our designs implode.

**This is done in steps, at different widths, that we call *breakpoints**—*the window/device/viewport sizes where the content *starts to break*, if it is not adjusted. This might be because lines of text get too short or too long, becoming hard to read. It might be to prevent a grid of images from becoming too small on a phone—while you can have many columns on desktop, often you can only have one or two on mobile. You can add as many *breakpoints* as you need to make your page/design work across devices.

*There are very, very few layouts that won’t need some amount of horizontal responsiveness/breakpoints!*

**In this example, we would refer to `400px` as our *breakpoint:***

[I’ve improved these little example embeds—now you can **drag the middle divider** to resize the demo/example on the right. Drag this one to the left to see it respond to the media query!](https://typography-and-interaction-too.github.io/sandbox/media-width/demo)

I’ve improved these little example embeds—now you can **drag the middle divider** to resize the demo/example on the right. Drag this one to the left to see it respond to the media query!

This width rule/test/criteria uses the same syntax as [length properties](https://www.notion.so/CSS-Layout-d3ceeaa1758a4426941cb04a2ec78714), meaning you can use `min-width`, `width`, and `max-width`.

[Again, drag the divider to see rules apply. Exact matches (like the  `width: 400px;` here) are rarely useful!](https://typography-and-interaction-too.github.io/sandbox/media-width-min-max/demo)

Again, drag the divider to see rules apply. Exact matches (like the  `width: 400px;` here) are rarely useful!



## Height-based, too



You can also use `height` in the same way—though again, with the normal, vertical scrolling paradigm, height-based adjustments aren’t as necessary or nearly as common.

**This example is the same *breakpoint* of `400px`, but now using `height`:**

[I made these embeds themselves *responsive—s*o they stack code/demo when they are narrow like this!](https://typography-and-interaction-too.github.io/sandbox/media-height-min-max/demo)

I made these embeds themselves *responsive—s*o they stack code/demo when they are narrow like this!

*In a broader code/programming context, it can be helpful to think of media queries as* [conditional **if statements](https://en.wikipedia.org/wiki/Conditional_(computer_programming))*. If this thing is true, then do this. (You may have heard “[If This Then That](https://ifttt.com).”) We’ll talk about this more [with JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else), where conditionals ubiquitous and powerful.*



## Orientation



You can also be less specific about your width/height and instead use `orientation`—like when you rotate your phone. This uses the wonderfully tenacious names/values of `portrait` or `landscape`.

*Everything was a painting before it was a photograph or a [web page](https://www.notion.so/Everything-is-a-web-page-e26167deee13412cb597754aa93450ad).*

[Drag that divider!](https://typography-and-interaction-too.github.io/sandbox/media-orientation/demo)

Drag that divider!



## And/or combinations



And speaking of *conditional statements—*you can also merge multiple media queries into one test/check, using `and`. This is often used for a range (to apply something *between* two breakpoints) or to combine `width` and `height` checks, together.

[The demo here is taller than `300px`, for the second one.](https://typography-and-interaction-too.github.io/sandbox/media-and/demo)

The demo here is taller than `300px`, for the second one.

You can also use comma-separated queries (like [*selector lists*](https://developer.mozilla.org/en-US/docs/Web/CSS/Selector_list)) to apply *or* logic—setting the same styles for different scenarios.

[Note that you could do this with `and` (in the example above) by just swapping the colors. Code logic!](https://typography-and-interaction-too.github.io/sandbox/media-or/demo)

Note that you could do this with `and` (in the example above) by just swapping the colors. Code logic!

*There is also a `[not` operator](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Media_queries#not_logic_in_media_queries)—which will reverse the meaning of the media query. But this syntax tends to be really, really confusing—especially with things like `min` / `max` rules making for double-negatives. So it is best to avoid!*

*Why say `not` `portrait` when you can just say… `landscape`?*

## *Mobile-first* design



So this can all get very complicated, very quickly—especially with complex designs, overlapping rules, and the wide ranges of devices to consider. One of the easiest methodologies to keep things understandable is practicing *mobile first* design/development. **This has become kind of *buzzwordy* in the past decade or so, but it is a good philosophy to adhere to nonetheless.

**In design, *mobile first* means considering small screens and *then* adding complexity, limits, or considerations for larger/desktop screens.**

**In HTML/CSS development, this means writing your styles for mobile… first, *then* adding `min-width` breakpoints (below them) to progressively enhance your design as it scales up.**

[The `width` here are kind of tricky—but this will be much easier with `grid`, I promise!](https://typography-and-interaction-too.github.io/sandbox/media-mobile-first/demo)

The `width` here are kind of tricky—but this will be much easier with `grid`, I promise!

*This follows the general CSS paradigm of the cascade—and is much, much, much easier than adjusting desktop front-end after the fact. Always think mobile first!*



## Other `@media` features



The most common media queries will be *width*/*height*/*orientation*—for adjusting your layouts. But `@media` has some [more tricks up its](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_features) sleeve with testing for other browser features. We’ll look at some of the handy/common ones.



### `screen` / `print`

In all of our above examples, there is an implied *[media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types)* of `screen`—since that is usually what we are concerned with on the web. But there is also one for `print`! You can use these to segment styles to one medium or the other.

[You can see the `print` style in action by clicking *Original* in the upper corner, then ⌘-P to print. It is still *A Thing*, though really often forgotten about in modern web design/projects.](https://typography-and-interaction-too.github.io/sandbox/media-print/demo)

You can see the `print` style in action by clicking *Original* in the upper corner, then ⌘-P to print. It is still *A Thing*, though really often forgotten about in modern web design/projects.



### `hover`

Another common one is `hover`, to detect whether a browser has an input device that supports *hovering*—which really just means a mouse, on laptop/desktop computers. Mobile *touch-based* systems don’t have this behavior (and sometimes react oddly to `:hover` CSS), so you might need to adjust your interfaces to work in the absence of this state.



[If you view this on your phone, the `aside` should be visible without interaction. On your computer, you’ll have to mouse over the `div`. Note how this is written with a *[mobile first](https://www.notion.so/CSS-Media-queries-d34a5ded94354f84a3ffa00b8af3454b)* style, only adding the hover later/lower for folks who have it!](https://typography-and-interaction-too.github.io/sandbox/media-hover/demo)

If you view this on your phone, the `aside` should be visible without interaction. On your computer, you’ll have to mouse over the `div`. Note how this is written with a *[mobile first](https://www.notion.so/CSS-Media-queries-d34a5ded94354f84a3ffa00b8af3454b)* style, only adding the hover later/lower for folks who have it!

*Hover states are a good thing for progressive enhancement, as we did here—to add them in after you have a working mobile design! Since maybe a third to a half of your audience (depending on your project) won’t see them.*



### `prefers-color-scheme`

You see this one more and more these days—switching up a site’s styles based on whether the user is in *light* or *dark mode.*

[You’ll see this differently depending on whether your system is in light or dark mode. (Dark mode forever!)](https://typography-and-interaction-too.github.io/sandbox/media-color-scheme/demo)

You’ll see this differently depending on whether your system is in light or dark mode. (Dark mode forever!)

*Sometimes this feels appropriate (especially in products/applications,  like maybe a messaging service). But sometimes the color scheme of a site is its brand, and probably shouldn’t change based on this query. It’s up to you! In our ongoing discussion of who has the control.*



### `prefers-reduced-motion`, `prefers-contrast`

These last two are primarily concerned with [accessiblity](https://developer.mozilla.org/en-US/docs/Web/Accessibility), for folks who run their device/browser with animations turned off, or in a high-contrast mode to help with their vision.

```css
button {
  animation: some-slick-animation;
}

@media (prefers-reduced-motion: reduce) {
  button {
    animation: none;
  }
}
```

![The corresponding setting in iOS.](CSS!%20(Media%20queries)%20d34a5ded94354f84a3ffa00b8af3454b/IMG_A6A6E23CE474-1.jpeg)

The corresponding setting in iOS.

```css
p {
	background-color: lightgray;
	color: slategray;
}

@media (prefers-contrast: more) {
	p {
		background-color: white;
		color: black;
	}
}
```

![IMG_288F80E29CEF-1.jpeg](CSS!%20(Media%20queries)%20d34a5ded94354f84a3ffa00b8af3454b/IMG_288F80E29CEF-1.jpeg)



## Testing responsive design



The easiest way to test all these things out is using [the device mode](https://www.notion.so/DevTools-The-Inspector-d0533c0133b24b168160eee046ce94b9) in Chrome’s *Inspector*. There will still be differences (like not necessarily honoring device-specific settings like `hover`), but for layout/breakpoint development it is often much faster than checking on actual devices!

[*DevTools / The Inspector*](https://www.notion.so/DevTools-The-Inspector-d0533c0133b24b168160eee046ce94b9)

*I’ve added some more notes to the end, here.*
