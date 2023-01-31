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

Remember that images weren’t a part of the [early web](/topic/everything/#when-was-the-web-invented), and so like CSS, feel somewhat “bolted on” and are still somewhat tricky to work with. It has gotten better recently, though!



## Image formats!

There are several commonly used image formats on the web, each with their own purpose:

.GIF [(Graphics Interchange Format)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#gif_graphics_interchange_format)
: An early [raster/bitmap](https://en.wikipedia.org/wiki/Raster_graphics) format, heavily compressed with reduced palettes. It survives now because it has animations! This is the only reason to use this format, nowadays. (I say GIF with a hard *G*, and I am right.)

.PNG [(Portable Network Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Still raster/bitmap, but much better than GIFs (if you don’t need animation) as they are [lossless](https://en.wikipedia.org/wiki/Portable_Network_Graphics#Advantages). Use PNGs for illustrations and graphics—things with large areas of repeated colors—or where you need color accuracy. (But many of these should be SVGs, below.)

.JPG / .JPEG [(Joint Photographic [Experts] Group)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Raster/bitmap format that is good for photos. JPGs can compress photos down to much smaller file sizes, but the compression is [lossy](https://en.wikipedia.org/wiki/JPEG#Effects_of_JPEG_compression). Photos tend to hide these *compression artifacts* better than illustrations/graphics.

.SVG [(Scaleable Vector Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#svg_scalable_vector_graphics)
: Finally, a [vector](https://en.wikipedia.org/wiki/Vector_graphics) format! SVGs should be used for any icons, logos, or illustrations. They store the vectors in code (a bit like HTML), and can be scaled cleanly for different sizes/resolutions.



## Sizing and containers



If you remember way back to our [HTML intro](/topic/html/), images are a special HTML element:

```html
<img src="tim.jpg" alt="Tim Berners-Lee at a computer.">
```
{: style="max-width: 60rem;" }
*A JPG in the same folder as the HTML (relative path/URL). Always write an `alt` text for accessibility.*
{: .four-below style="margin-top: var(--typography--between);" }



By default, images will scale to their *intrinsic* size—the pixel dimensions—and are *inline* elements.

{% include figure.html src='/example/image/demo' height='36rem' caption='This image file is 250 pixels wide. Note the extra space at the bottom, from `display: inline;`' %}

Most resets (like ours) include a `max-width: 100%` for <nobr>images—</nobr>otherwise they would poke out of their containers!

This intrinsic/inline behavior is rarely what you <nobr>want—</nobr>more often your image will be sized *from* your design, not vice-versa. Also the image is sized to [CSS pixels](https://tomroth.com.au/dpr/), so it is blurry on *HiDPI* screens, which is most of us these days.

So often you’ll want to set images to `display: block;`, and then control their size/positioning via CSS, just like any other elements. Make sure your actual actual image dimensions are roughly twice their displayed size, so nothing is blurry:

{% include figure.html src='/example/image-block/demo' height='34rem' caption='This image file is 1600 pixels wide.' %}



## Object-fit



CSS also added the [object-fit](https://developer.mozilla.org/en-US/docs/Web/CSS/object-fit) and [object-position](https://developer.mozilla.org/en-US/docs/Web/CSS/object-position) properties for sizing images *within* their containers—as if the image file is a child of `<img>`. This is usually when setting an `<img>` to fill a container:

{% include figure.html src='/example/image-object-fit/demo' height='38rem' caption='Note the height on the section, otherwise the container would still resize to the image. Adjust the divider to see the behavior!' %}



## Aspect-ratio



Recently (just last year) CSS also added an [aspect-ratio property](https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio), to control the width-to-height ratio of an element—maintaining this relationship as an element scales.

This is not *just* for images (you can use it on anything!), but commonly comes up when using them:

{% include figure.html src='/example/image-aspect-ratio/demo' height='32rem' caption='Note that without the `object-fit: cover;`, Tim would be distorted to the ratio!' %}



## Background-image



You can also use images as backgrounds on elements with the [background-image](https://developer.mozilla.org/en-US/docs/Web/CSS/background-image), [background-size](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size), and [background-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin) <nobr>properties—</nobr>particularly if you want to put something in front of them, like text.

However this isn’t very semantic, as it blurs the content/<wbr>presentation boundaries—since the image paths are moved into your CSS, and there is no `alt` text description for screen-readers. So you should *only* use this for contextual or decorative images—not your actual content:

{% include figure.html src='/example/image-background/demo' height='32rem' caption='I wouldn’t use something like this as a background. Mind your legibility!' %}



Think, “would this page make sense if I couldn’t see this image?” If the answer is “no”, then use an `<img>` with an `alt`, instead.



## Figure / figcaption



Speaking of semantics—HTML also has a [figure](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure) element that you can use to associate an image (or other visual) with a visible [figcaption](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption) description or legend.

{% include figure.html src='/example/image-figure/demo' height='38rem' caption='These can also be used to group things like videos, illustrations, and diagrams with their captions.' %}

These are good examples of a [“curb-cut” approach/<wbr>philosophy](https://dceg.cancer.gov/about/diversity-inclusion/inclusivity-minute/2021/curb-cut-effect) towards accessibility—your `alt` text description is useful for more than just folks using screen readers!




{% comment %}
- Working with images

	- GIF/PNG/JPG/SVGs
	- Containers/sizing
	- `object-fit` properties
	- aspect-ratio
	- background-image
	- `figure`/`figcaption`

- Metadata, social images, favicons
{% endcomment %}