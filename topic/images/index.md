---
title: Working with images
order: 11
---



We kind of breezed past this, so let’s look at some more specifics around using images on the web.
{: .left }

* [Images in HTML | MDN](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Images_in_HTML) \
	*Pretty good overview.*

* [Choose the right image format - web.dev](https://web.dev/choose-the-right-image-format/) \
	*Also discusses “High DPI” (HiDPI) screens.*
{: .icon-link .no-marker .right rows="2" }

Remember that images weren’t a part of the [early web](/topic/everything/#when-was-the-web-invented), and so like CSS, feel somewhat “bolted on” and are still somewhat tricky to work with. It has gotten much better recently, though!


> I'd like to propose a new, optional HTML tag:
>
> IMG
>
> Required argument is SRC=&Prime;url&Prime;.
>
> This names a bitmap or pixmap file for the browser to attempt to pull over the network and interpret as an image, to be embedded in the text at the point of the tag's occurrence. An example is:
>
> \<IMG SRC=&Prime;file://foobar.com/foo/bar/blargh.xbm&Prime;\>
{: .quote }

<cite>[Marc Andreessen](http://1997.webhistory.org/www.lists/www-talk.1993q1/0182.html)</cite>

(I DON’T KNOW IF WE TOLD YOU BUT HTML [USED TO SHOUT](https://www.w3.org/TR/html40/struct/global.html).)
{: .two-above }



## Image formats!

There are several commonly used image formats on the web, each with their own purpose:

`.GIF` [(Graphics Interchange Format)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#gif_graphics_interchange_format)
: An early [raster/bitmap format](https://en.wikipedia.org/wiki/Raster_graphics), heavily compressed with reduced palettes. It survives now because it does animations! This is the only reason to use this format, nowadays.

: GIF compression is primitive and so they can quickly have *huge* file-sizes—and can still slow down computers (downloading and rendering) even now. Be careful with these.

: I say *GIF* with a hard *G* (as in *gift*), and I am your instructor and am right.

`.JPG` / `.JPEG` [(Joint Photographic [Experts] Group)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Ancient-but-timeless raster/bitmap format that is good for photos. JPGs can compress images down to much smaller file sizes with adjustable, lossy [compression ratios](https://en.wikipedia.org/wiki/JPEG#Effects_of_JPEG_compression).

: The busyness of photos tends to hide the resulting *compression artifacts* better than simple illustrations/graphics, so JPG lives on as a common, widely-used image format.

`.PNG` [(Portable Network Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Still raster/bitmap, but much better than GIFs (if you don’t need animation) as they can use [lossless compression](https://en.wikipedia.org/wiki/Portable_Network_Graphics#Advantages) and have alpha-channel transparency.

: Use PNGs for illustrations and graphics—things with large areas of repeated colors—or where you need exact color accuracy. (But many of these should be SVGs, up next.)

`.SVG` [(Scaleable Vector Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#svg_scalable_vector_graphics)
: Finally, a [vector format](https://en.wikipedia.org/wiki/Vector_graphics)! SVGs should be used for any icons, logos, or illustrations—provided you have access to the original source artwork for the vectors (shapes).

: They store the vectors in code (a bit like HTML, we’ll see), and can be scaled cleanly for different sizes/resolutions. You can also target them with CSS, if they are *inlined* (embedded) into your DOM.

: When targeting (or editing) SVG contents, note they have [slightly different syntax](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Fills_and_Strokes) than HTML CSS—using `fill` and `stroke` instead of `color` and `border`, for example. Also remember that `width` and `height` attributes will fix the SVG size (just like `<img>`); use the [viewBox attribute](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox) if you want them to scale.



## Sizing and containers



If you remember way back to our [HTML intro](/topic/html/), images are a special HTML element:

```html
<img src="tim.jpg" alt="Tim Berners-Lee at a computer.">
```
{: style="max-width: 60rem;" }
*A JPG in the same folder as the HTML (relative path/URL). Always write an `alt` text for accessibility.*
{: .four-below style="margin-top: var(--typography--between);" }



By default, images will scale to their *intrinsic* size—the (*1x*) pixel dimensions—and are *inline* elements:

{% include figure.html src='/example/image/demo' height='36rem' caption='This image file is 250 pixels wide. Note the extra space at the bottom, from `display: inline;`' %}

Most [resets (like ours)](/topic/css/#resets) include a `max-width: 100%` for <nobr>images—</nobr>otherwise they would poke out of their containers!

This intrinsic/inline behavior is rarely what you <nobr>want—</nobr>more often your image should be sized *from* your design, not vice-versa. Also by default the image is scaled to [CSS pixels](https://tomroth.com.au/dpr/), so it is blurry on modern *HiDPI* (a.k.a. [*retina*](https://en.wikipedia.org/wiki/Retina_display), *2x*, *3x*) screens—which is most of us, these days.

In the past, you would manually set an image size within your HTML via special `width` and `height` attributes:
{: .two-above }

```html
<img src="tim.jpg" alt="Tim Berners-Lee at a computer." width="230" height="150">
```
{: .one-above style="max-width: 86rem;" }
*No units, even.*
{: style="margin-top: var(--typography--between);" }

But this forces the image into a fixed size, which doesn’t work well in our modern, responsive, many-device-width context. We don’t do this much anymore.

So often you’ll want to set images to `display: block;`, and then control their size/positioning via CSS, just like any other elements. Make sure your actual actual image dimensions are (at least) roughly twice their displayed, *CSS pixel* size, so nothing is blurry:
{: .two-above }

{% include figure.html src='/example/image-block/demo' height='34rem' caption='This image file is 1600 pixels wide. Drag that divider.' %}



## Object-fit



CSS also added the [object-fit](https://developer.mozilla.org/en-US/docs/Web/CSS/object-fit) and [object-position](https://developer.mozilla.org/en-US/docs/Web/CSS/object-position) properties for sizing images *within* their containers—as if the image file is a child of `<img>`. This is usually when setting an `<img>` to fill a container:

{% include figure.html src='/example/image-object-fit/demo' height='59rem' caption='Note the height on the section, otherwise the container would still resize to the image. Adjust the divider to see the behavior!' %}



## Aspect-ratio



Recently (just last year) CSS also added an [aspect-ratio property](https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio), to control the width-to-height ratio of an element—maintaining this relationship as an element scales. (This used to be [unnecessarily hard](https://css-tricks.com/aspect-ratio-boxes/) to achieve. CSS heights are always weird!)

This is not *just* for images (you can use it on anything!), but commonly comes up when using them:

{% include figure.html src='/example/image-aspect-ratio/demo' height='30rem' caption='Note that without the `object-fit: cover;`, Tim would be distorted to the ratio! Don’t distort Tim (or generally, most images) unless you really mean to.' %}



## Background-image



You can also use images as backgrounds on elements with the [background-image](https://developer.mozilla.org/en-US/docs/Web/CSS/background-image), [<nobr>background-size</nobr>](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size), and [background-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin) <nobr>properties—</nobr>particularly if you want to put something in front of them, like text.

However this isn’t very semantic, as it blurs the content/<wbr>presentation boundaries—since the image paths are moved into your CSS, and there is no `alt` text description for screen-readers. So you should *only* use this for contextual or decorative images—not your actual content:

{% include figure.html src='/example/image-background/demo' height='32rem' caption='I wouldn’t use something like this as a background. Mind your legibility!' %}



> Think, “would this page make sense if I couldn’t see this image?” If the answer is “no,” then use an `<img>` with an `alt`, instead. Use the `alt` text to convey the meaning.
{: .callout icon="🤔" }



## Figure / figcaption



Speaking of semantics—HTML also has a [figure](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure) element that you can use to associate an image (or other visual) with a visible [figcaption](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption) description or legend. These containers formally link the meaning/context of the elements together.

{% include figure.html src='/example/image-figure/demo' height='38rem' caption='These can also be used to group things like videos, illustrations, and diagrams with their captions.' %}

> Including visible captions/descriptions is a good example of the [“curb-cut” approach/<wbr>philosophy](https://dceg.cancer.gov/about/diversity-inclusion/inclusivity-minute/2021/curb-cut-effect) towards accessibility—your `alt` text description could be useful for more than just folks using screen readers! Strive for this broad benefit in all your accessibility work.
{: .callout icon="🤝" }



## Picture, source, and responsive images



With regards to their layout, you make images responsive in the same way you make all your page structure responsive—by writing [*mobile-first*](/topic/responsive/#mobile-first-design) front-end for their containers. You can change their flow, size, shape, and so-on.

But images introduce some additional considerations, going across breakpoints. You might want to serve/<wbr>show different images at different sizes—whether for dimensional (file-size, bandwidth, performance) or art-direction (scale, crop) reasons. The exact same image `src` file is *rarely* ideal at both `375px` and `2560px`.

Our venerable `<img>` element added some control for this with the addition of the [srcset ](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-srcset) and [sizes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-sizes) attributes. But I think it is much easier, at least ergonomically, to skip right into using the modern [picture element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture).

The `<picture>` element is a wrapper/<wbr>container for an `<img>`, giving it alternate `<source>` tags that offer different image files for different scenarios. They use [media-query-like](/topic/responsive/#media-queries) syntax to change what image is loaded and displayed:

{% include figure.html src='/example/image-picture/demo' height='50rem' caption='This is all in the HTML; there is no (relevant) CSS. Adjust the divider to see the swaps!' %}

Note that you still include the `<img>` as a *fallback*—put your largest size there. I find it helpful to follow the same *mobile-first* philosophy here as you do in the rest of your code—putting your smaller images first, and your larger lower. You can have as many `<source>` elements as you need—for image sizing or content.

> Responsive images (like the rest of this) can get [very complicated](https://web.dev/learn/design/picture-element/), very quickly—so always start with the basics (and mobile) first, like in the example here.
{: .callout icon="🤌" }



<!-- Talk about file-sizes? -->
<!-- How you make images? -->
