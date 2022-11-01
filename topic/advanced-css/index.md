---
title: Additional, advanced CSS
published: false
order: 9
---



Our HTML/CSS focus up to this point has been relatively broad, to start with the basics. Here we want to begin to sand down some of the rough edges, and introduce you to specific, advanced techniques you can use to refine and enliven your work—still with just CSS, no JavaScript (yet)!
{: .left }

* [Overflowing content](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Overflowing_content) \
  *There are going to be a lot of MDNs, here.*

* [Font metrics, line-height and vertical-align](https://iamvdo.me/en/blog/css-font-metrics-line-height-and-vertical-align) \
  *A deep-dive on type positioning.*

* [CSS Tricks :before and :after](https://css-tricks.com/almanac/selectors/a/after-and-before/) \
  *Another great CSS Tricks article.*

* [CSS Transforms &#124; MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/transform) \
  *Back to MDN.*

* [CSS Transitions &#124; MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions)

* [CSS Animations &#124; MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations)
{: .icon-link .no-marker .right rows="3" }

A good pattern to follow in web development is to let each technology do what it does best—using HTML for semantic meaning, CSS to handle how we form a page, and JavaScript to introduce interaction. But much of what you’ll use JavaScript for, to start, is simply adding or removing classes—and ahead of that, there is still a lot we can do in CSS. Let’s look at some examples.



## Overflows and scrolling

An [*overflow*](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow) in CSS happens when there is too much content to fit in a container—usually because you have manually constrained its `height` or `width`. (By default, the browser will try to show you everything!)

We can use this behavior *intentionally* to crop our content or create scrolling areas:

{% include figure.html src='/example/overflow/demo' height='96rem' caption='Some of you have already discovered this!' %}

Importantly, this creates a new [*stacking context*](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context)—which means things with `position` (and some other properties) will now use the overflow container as their reference/origin:

{% include figure.html src='/example/overflow-sticky/demo' height='31rem' %}



## Precise text positioning

HTML renders a lot of extra space around text elements, called the [*line box*](https://iamvdo.me/en/blog/css-font-metrics-line-height-and-vertical-align) (or, in design software parlance, the *bounding box*).

It is based on the `font-family`, the `font-size`, and the `line-height`, which basically means it is different all the time—and different from Adobe/Figma to HTML. This makes it difficult to position type precisely—especially at large, expressive sizes like your headings! It’s always annoying, and you’ll often be adding/subtracting your spacing (`margin` or `padding`) to account for it, if you want to line everything up *just right*, optically.

Let’s avoid it. We can use [pseudo-elements](/topic/css/#pseudo-elements), `:after` / `:before`—which are entirely created by CSS, not in your DOM—to negate this (vertical) space with negative margin. By doing this on the pseudo elements, we can still position the parent element normally, otherwise!

{% include figure.html src='/example/bounding-box/demo' height='62rem' caption='Here we also move the text with `margin-left` and `margin-right`, though usually this adjustment is much more minor (to the point of ignoring).' %}

*Eric and I will often call this tactic “negating the bounding box.”*



## Text ragging (sorta)

We’ve gone on-and-on about how you can’t treat the web like print—always [perfectly ragging](/topic/typography/#ragging) your text for nice, smooth blocks. In modern (responsive) web design we don’t always know what our text will be, nor where it will wrap!

But we can do a handful of things to make for *better* ragging/wraps, given the unknowns—judiciously using `hyphens`/`&shy;`, `<wbr>`, `<nobr>`, and `&nbsp;` to *somehwat* control your line breaks.

### `hyphens` / `&shy;` and `<wbr>`

The [hyphens](https://developer.mozilla.org/en-US/docs/Web/CSS/hyphens) property allows long, multi-syllable words to be [hyphenated](https://en.wikipedia.org/wiki/Hyphen#Justification_and_line-wrapping) when they wrap across multiple lines. This can be done automatically by the browser, or by manually inserting `&shy;` (for [*soft hyphen*](https://en.wikipedia.org/wiki/Soft_hyphen)) as an [HTML entity](https://developer.mozilla.org/en-US/docs/Glossary/Entity):

{% include figure.html src='/example/hyphens/demo' height='44rem' caption='Note `<html lang="en">` is needed for Chrome—as the `auto` property works from each browser’s different, internal (and usually, only English) dictionary—so this all has somewhat limited utility/reliability.' %}

{% comment %} > Bah, our reset actually [breaks this](https://stackoverflow.com/questions/72061454/when-im-using-css-hyphens-after-remove-all-style-with-all-unset-css-hyphen) in Chrome, right now! Bear with for a fix.
{: .callout icon='M' } {% endcomment %}

Somewhat similar to `&shy;`, the [*wbr*](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr) is a (void/empty) HTML element that denotes a *word break* opportunity. (A bit like an optional `<br>`!) You can use these to control where single long word will wrap, *without* a hyphen:

{% include figure.html src='/example/wbr/demo' height='45rem' %}


### `<nobr>` and `&nbsp;`

More often, you’ll want to keep certain words *together*—to avoid a [widow or orphan](/topic/typography/#widows-and-orphans), or to keep important/related text together—like in dates, *November 2*, or with  names like *Eric Li*.

You can wrap multiple words (or whole phrases) in an [*nobr*](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/nobr) tag—keeping in mind that like `<em>` or `<strong>`, the default behavior is cleared by most [resets](/topic/css/#resets) (ours included)—so you have to restore the property in CSS. You can also use a manual `&nbsp;` entity between words:

{% include figure.html src='/example/nobr-nbsp/demo' height='46rem' caption='On a Mac, you can insert an *encoded* `&nbsp;` with `⌥` (option)-spacebar. This works in many programs, not just your IDE! It’s harder to see, but easier to read.' %}

Beyond these manual interventions, you [need JavaScript](https://github.com/adobe/balance-text) to [fully balance](https://www.ctrl.blog/entry/text-wrap-balance.html) your lines! (Which is a whole can of worms, ask Eric.)



> When in doubt, [*The Elements of Typographic Style*](https://readings.design/PDF/the_elements_of_typographic_style.pdf) has many of the answers you need about where to break text apart or keep it together! But also, as Bringhurst says, *“read the text before designing it.”* Put yourself in the mind of your reader!
>
> These strategies only work if you can manually edit your text content, which is not always feasible. Do it when you can, and give more attention to your headings, then your body copy, etc.
{: .callout icon='&' }



{% comment %} Mix blend modes? {% endcomment %}



## Transforms!

Beyond our standard sizing and layout afforded by CSS, you can also *visually* manipulate elements using CSS [transforms](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)—scaling, skewing, translating, or rotating elements *after* they are laid out in the DOM. It’s like grabbing the “corner handles” in Adobe/Figma!

`scale()` / `scaleX()` / `scaleY()` / `scaleZ()` / `scale3d()`
: Change the displayed size of the element—as if it is an image.

`skew()` / `skewX()` / `skewY()`
: Tilt an element to the left or right, like turning a rectangle into a parallelogram.

`translate()` / `translateX()` / `translateY()` / `translate3d()`
: Move an element left/right and up/down, and also in three-dimensional space.

`rotate()` / `rotate3d()`
: Rotate the element.

`perspective()`
: Doesn’t affect the element itself, sets the distance between the user and the <nobr>three-dimensional</nobr> plane.

The units for these are all a bit different; [MDN is your friend](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function) here, as usual. You can apply single or multiple transforms, which are written *space-separated* and applied one after the other:

```css
.rotated {
  transform: rotate(-5deg);
}
```
{: .half }

```css
.rotated-and-scaled {
  transform: rotate(-5deg) scale(120%);
}
```
{: .half }

Keep in mind that these transformations are applied *after* the rest of the CSS is parsed, and thus treat your element a bit like an image. And like `overflow`, above, `transform` also creates a new [*stacking context*](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context) for its children.

{% include figure.html src='/example/transform/demo' height='44rem' caption='Note how the elements *don’t* take up more space in the document flow/layout—but they *do* cause an overflow! ' %}

You shouldn’t use `transform` for layout, per se—as in, don’t use `translate` when `margin`, `padding`, `flex`, or `grid` is appropriate. (This is bad practice, and usually very brittle.) Use `transform` for what they *can’t* accomplish!



## Transitions!



CSS [transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions) allow us to more seamlessly move between CSS property values. Instead of having a property take effect *immediately* when a pseudo-class class is applied (or later—with <nobr>JS—</nobr><wbr>a proper class), we can tell a CSS property to *transition* from one value to another over a given amount of time (`duration`), and with a specific acceleration (`timing-function`), or a delay. Motion can quickly get very complex!

You’ll often see a `transition` in shorthand:
{: .two-above }

```css
.some-cool-transition {
  transition: all 2s 1s linear;
}
```
{: .half .one-above }

```css
.some-cool-transition {
  transition-delay: 1s;
  transition-duration: 2s;
  transition-property: all;
  transition-timing-function: linear;
}
```
{: .half}

{% comment %} Timing-function list? {% endcomment %}

You can also control how different properties of an element transition independently, with a *comma-separated* list:
{: .one-below}

```css
.some-cool-transition {
  transition: background-color 2s linear, transform 1s ease-in-out;
}
```

```css
.some-cool-transition {
  transition-duration: 2s, 1s;
  transition-property: background-color, transform;
  transition-timing-function: linear, ease-in-out;
}
```
{: .left .one-above }

Sometimes the shorthand here is easier than discrete properties, where you have to maintain the same order across all of them. It’s all the same to the computer!
{: .right }

Often, CSS transitions will be used *with* JavaScript adding/removing classes, to make a state change less abrupt. For now, we’ll use [pseudo-classes](/topic/css/#pseudo-classes) to demonstrate:
{: .two-above }

{% include figure.html src='/example/transition/demo' height='32rem' caption='You can get even more control over the easing with a [custom curve function](https://easings.net).' %}

Essentially *any* CSS property can be transitioned—but keep in mind that changes that cause a *reflow* (re-triggering *layout*, sometimes called *paint*) [are slow](https://web.dev/animations-guide/#triggers) and can make your page feel glitchy—especially when you start having many of them. Each in-between state causes the browser to re-render your entire document! So stick to changes of `color`, `opacity`, and `transform` for the smoothest performance.



## And animations!

Sometimes, transitioning a property from one value to another isn’t enough—you may need more complicated (or repeating) motion behavior. CSS [animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations) allow precise state sequencing with `@keyframes` (akin to… *keyframes* or a timeline in other software contexts).

To create a keyframe animation, we define an element’s initial state in CSS—then an `animation` property, which includes timing and behavior, as well as an animation name (something that you make up). Again, you’ll often see these in shorthand:

```css
section {
  animation: blinking 3s infinite ease-in-out;
}
```
{: .half .one-above }


```css
section {
  animation-duration: 3s;
  animation-iteration-count: infinite;
  animation-name: blinking;
  animation-timing-function: ease-in-out;
}
```
{: .half }

Importantly, we then define the actual keyframes of an animation in a separate *at-rule*. Each *keyframe* is specified with a percentage of the animation’s duration, and can specify multiple properties—a bit like *selectors* for the time:

{% include figure.html src='/example/animation/demo' height='50rem' caption='Don’t go overboard! A little animation goes a long way.' %}
