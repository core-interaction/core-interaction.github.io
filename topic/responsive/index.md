---
title: Media queries
order: 4
---



> Empty your mind. Be formless, shapeless, like water. You put water into a cup, it becomes the cup. You put water into a bottle, it becomes the bottle.
You put it into a teapot, it becomes the teapot. Now water can flow or it can crash. Be water, my friend.
{: .quote }

<cite>[Bruce Lee](https://www.youtube.com/watch?v=fEDfznOP820)</cite>

> Content is like water. Content’s going to take many forms, flow into many different containers, many of which we haven’t even imagined yet. Build from content out, not container in.
{: .quote .two-above }

<cite>[Josh Clark](https://bigmedium.com/jhc/prez/mobile-myths.pdf)</cite>



## What is *responsive design*?



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

{% include figure.html src='responsive.svg' caption='A typical/example *responsive* layout, adjusting the layout to reflow based on the device width.' class='four-above' height='90vh' %}



## The *viewport*

You’ll see this in the `<head>` of most websites, these days:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```
{: style="max-width: 77.8rem" }

When the iPhone came on the scene, most websites didn’t have narrow/smaller (responsive) layouts so the phone would instead [*scale* or *zoom out*](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/UsingtheViewport/UsingtheViewport.html) a desktop site design to fit.
{: .left .four-above }



{% capture aside %}

{% include figure.html src='wap.jpg' caption='Prior to the iPhone, some sites had barebones <em>[WAP](https://en.wikipedia.org/wiki/Wireless_Application_Protocol)</em> mobile versions.' credit='https://wapreview.com/164/' %}

{% include figure.html src='nytimes.png' caption='The full desktop site, scaled down, in 2007. Simpler times.' credit='https://web.archive.org/web/20070111094339/http://www.apple.com/iphone/internet/' class='one-above' %}

{% include figure.html src='intro.png' caption='The iPhone introduction, worth a watch. Jobs definitely “dented the universe.”' credit='https://youtu.be/VQKMoT-6XSg?t=2474' class='one-above' %}

{% include figure.html src='redesign.png' caption='The *Times* wasn’t fully responsive until 2018, if you can believe it. (They had a separate mobile site and apps.)' credit='https://open.nytimes.com/a-faster-and-more-flexible-home-page-that-delivers-the-news-readers-want-1522ff64aa86' class='one-above' %}

{% endcapture %}

{% include aside.html content=aside rows="11" %}



Websites at the time were often designed to a [standard width](https://960.gs) (usually `960px`), which the phone shrank down to its `320px` screen—and then the user could zoom in or out. It worked—and all the content was there, unlike most mobile sites—but it was less than ideal.

This `meta` element tells the browser not to do this. It says, *“I have a responsive design! Render me at my actual size.”*

The `width=device-width` tells the browser to use whatever the screen’s actual pixel dimension is, and `initial-scale=1` sets the starting zoom for the page to 100%. This is how the browser knows how to make the page respond, and how our CSS rules know what width to use.

We call the portion of the page visible at one time [the viewport](https://developer.mozilla.org/en-US/docs/Web/CSS/Viewport_concepts).



## Media queries



Responsive design could only really flourish when CSS added the `@media` [*at-rule*](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries) around the same time.

These are colloquially called *media queries*, and they allow us to check if screen is a certain width or resolution (or other features, which we’ll get to)—and then apply selective CSS only in that scenario. These let site layouts *respond* intentionally to different devices, for the first time.

Practically, these are blocks of CSS—a little bit like [*selectors*](/topic/css/#basic-selectors) that contain other selectors—but which only apply conditionally when the test/criteria is met.

```css
/* Our CSS has all been out here! */

@media some-criteria-or-rule {
  /* CSS that only applies if the test passes. */
}
```

These blocks are like any other CSS—if there are multiple conditions that are met, or there is a tie between properties—the rules [cascade](/topic/css/#oh-right-the-cascade) down and the lowest/last one takes precedent.



## Width-based *breakpoints*



There are lots of media queries we can use, but we’ll start with *width*—which is by far the most commonly used and really the core of *responsive design*. Usually when folks are talking about a page or site being *responsive*, they mean with regards to `width`.



{% include figure.html src='devices.jpg' caption='This is from about ten years ago. It’s only gotten worse.' credit='https://www.flickr.com/photos/brad_frost/7387824246' %}



> If you think responsive's simple, I feel bad for you son. We got 99 viewports, but the iPhone's just one.
{: .quote }

<cite>[Josh Brewer](https://twitter.com/jbrewer/status/178528003402379265)</cite>



Width will vary the most between devices—from the `375px`–`428px` of your phones, through the ~ `1440px`–`1680px` of your laptops, up to the ~ `2560px`–`3440px` you might see on desktop displays. Since this `width` is usually our primary design constraint (`height` being handled with scrolling), we need *width-based* media queries to adjust our layouts across this wide range, lest our designs implode.
{: .four-above }

This is done in steps, at different widths, that we call *breakpoints*&#8288;—the window/device/viewport sizes where the content *starts to break*, if it is not adjusted. This might be because lines of text get too short or too long, becoming hard to read. It might be to prevent a grid of images from becoming too small on a phone—while you can have many columns on desktop, often you can only have one or two on mobile. You can add as many *breakpoints* as you need to make your page/design work across devices. Don’t write *for* specific devices; write *for* your design and your content!

*There are very, very few layouts that won’t need some amount of horizontal responsiveness/breakpoints!*

In this example, we would refer to `400px` as our *breakpoint*:
{: .four-above }

{% include figure.html src='/example/media-width/demo' caption='Drag the code/example divider to the left to see it respond to the media query! Double-click to reset it.' height='20rem' %}



This width rule/test/criteria uses the same syntax as [length properties](/topic/box-model/#and-their-units), meaning you can use `min-width`, `width`, and `max-width`.
{: .four-above }

{% include figure.html src='/example/media-width-min-max/demo' caption='Again, drag the divider to see rules apply. Exact matches (like the  `width: 400px;` here) are rarely useful!' height='36rem' %}



## Height-based, too



You can also use `height` in the same way—though again, with the normal, vertical scrolling paradigm, height-based adjustments aren’t as necessary or nearly as common.

This example is the same *breakpoint* of `400px`, but now using `height`:
{: .half .two-above  }

{% include figure.html src='/example/media-height-min-max/demo' class='half' height='62rem' caption='These code examples are responsive, themselves—stacking like this when they are narrow.' %}

In a broader code/programming context, it can be helpful to think of media queries as [conditional *if* statements](https://en.wikipedia.org/wiki/Conditional_(computer_programming)). “If this thing is true, then do this.” (You may have heard of [*If This Then That*](https://ifttt.com).) We’ll talk about this later [with JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else), where conditionals are ubiquitous and powerful.
{: .four-above }



## Orientation



You can also be less specific about your width/height and instead use `orientation`—like when you rotate your phone. The queries use the wonderfully tenacious names/values of `portrait` or `landscape`.

*(Everything was a painting before it was a photograph or a [web page](/topic/everything).)*

{% include figure.html src='/example/media-orientation/demo' caption='Drag the divider to make the example narrower.' height='31rem' %}



## And/or combinations



And speaking of *conditional statements—*you can also merge multiple media queries into one test/check, using `and`. This is often used for a range (to apply something *between* two breakpoints) or to combine `width` and `height` checks, together.

{% include figure.html src='/example/media-and/demo' caption='The demo here is taller than `300px`, for the second one.' height='32rem' %}


You can also use comma-separated queries (like [*selector lists*](/topic/css/#fancy-selectors)) to apply *or* logic—setting the same styles for different scenarios.
{: .four-above }

{% include figure.html src='/example/media-or/demo' caption='Note that you could do this with `and`, as in the example above, by just swapping the colors. Code logic!' height='25rem' %}



There is also a `not` [logic operator](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Media_queries#not_logic_in_media_queries)—which will reverse the meaning of the media query. But this syntax tends to be really, really confusing&#8288;—especially with things like `min` / `max` rules making for double-negatives. So it is easier to avoid!

*Why say `not` `portrait` when you can just say… `landscape`?*



## *Mobile-first* design



So this can all get very complicated, very quickly—especially with complex designs, overlapping rules, and the wide ranges of devices to consider. One of the easiest methodologies to keep things understandable is practicing [*mobile first*](https://www.lukew.com/resources/mobile_first.asp) design/development. This has become kind of *buzzwordy* in the past decade or so, but it is a good philosophy to adhere to nonetheless.

Your design constraints will be tighter, by tackling your smallest layout first—but it is almost always easier to scale things up than down. A mobile design can always work as a passable desktop one; the reverse is rarely true.

(Another way to think of it: *if it doesn’t work on mobile, it doesn’t work.*)

- In your design, *mobile first* means considering small screens and *then* adding complexity, limits, or considerations for larger/desktop screens.

- In your HTML/CSS development, this means writing your styles for mobile… first, *then* adding `min-width` breakpoints (below them) to progressively enhance your design as it scales up.

{% include figure.html src='/example/media-mobile-first/demo' caption='The `width` here are kind of tricky—but this will be much easier with `grid`, I promise!' height='52rem' %}




This follows the general CSS paradigm of the cascade—and is much, much, much easier than adjusting desktop front-end after the fact. Always think *mobile first*!



## Other media features



The most common media queries, by far, will be *width*/<wbr>*height*/<wbr>*orientation*&#8288;—for adjusting your layouts. But `@media` has some [more tricks](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_features) up its sleeve with testing for other browser features. We’ll look at some of the handy/common ones.



### `screen` vs. `print`

In all of our above examples, there is an implied *[media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types)* of `screen`—since that is usually what we are concerned with on the web. But there is also one for `print`! You can use these to segment styles to one medium or the other.

{% include figure.html src='/example/media-print/demo' caption='You can see the `print` style in action by the arrow in the upper corner, then ⌘-P to print. It is still *A Thing*, though often forgotten about in modern web design/projects.' height='44rem' %}



### `hover`

Another common one is `hover`, to detect whether a browser has an input device that supports *hovering*—which really just means a mouse, on laptop/desktop computers. Mobile *touch-based* systems don’t have this behavior (and sometimes react oddly to `:hover` CSS), so you should adjust your interfaces to work in the absence of this state.

{% include figure.html src='/example/media-hover/demo' caption='If you view this on your phone, the `aside` should be visible without interaction. On your computer, you’ll have to mouse over the `div`. Note how this is written with a [*mobile first*](#mobile-first-design) style, only adding the hover state later/lower for folks who have it!' height='29rem' %}

Hover states are a good thing for progressive enhancement, as we did here—to add them in after you have a working mobile design! Since maybe a third to a half of your audience (depending on your project) won’t see them.



### `prefers-color-scheme`

You see this one more and more these days—switching up a site’s styles based on whether the user is in *light* or *dark mode*, popularized by the ol’ iPhone again.

{% include figure.html src='/example/media-color-scheme/demo' caption='You’ll see this differently depending on whether your system is in light or dark mode. (Vive le dark mode!)' height='30rem' %}


Sometimes this feels appropriate (especially in products/<wbr>applications,  like maybe a messaging service). But sometimes the color scheme of a site is its *brand*, and probably shouldn’t change based on this query. It’s up to you! In our ongoing discussion of who has the control.



### `prefers-reduced-motion`, `prefers-contrast`

These last two are primarily concerned with [accessiblity](https://developer.mozilla.org/en-US/docs/Web/Accessibility), for folks who run their device/browser with animations turned off, or in a high-contrast mode to help with their vision.

```css
button {
  animation: some-slick-animation;
}

@media (prefers-reduced-motion: reduce) {
  button { animation: none; }
}
```
{: .left style="align-self: center;"}

{% include figure.html src='motion.jpg' class="right" %}

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
{: .left style="align-self: center;"}

{% include figure.html src='contrast.jpg' caption='The corresponding settings in iOS.' class="right" %}



> The power of the Web is in its universality. Access by everyone regardless of disability is an essential aspect.
{: .quote }

<cite>[Tim Berners-Lee](https://www.w3.org/Press/IPO-announce)</cite>
