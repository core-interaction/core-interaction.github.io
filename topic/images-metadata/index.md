---
title: Images and metadata
order: 11
---



## Images



We kind of breezed past this, so let’s look at some more specifics around using images on the web.
{: .left }

* [Images in HTML | MDN](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Images_in_HTML) \
	*Pretty good overview.*

* [Choose the right image format - web.dev](https://web.dev/choose-the-right-image-format/) \
	*Also discusses “High DPI” (HiDPI) screens.*
{: .icon-link .no-marker .right }



### Formats!

There are several commonly used image formats on the web, each with their own purpose:

.GIF [(Graphics Interchange Format)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#gif_graphics_interchange_format)
: An early [raster/bitmap](https://en.wikipedia.org/wiki/Raster_graphics) format, heavily compressed with reduced palettes. It survives now because it has animations! This is the only reason to use this format, nowadays. (I say GIF with a hard *G*, and I am right.)

.PNG [(Portable Network Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Still raster/bitmap, but much better than GIFs (if you don’t need animation) as they are [lossless](https://en.wikipedia.org/wiki/Portable_Network_Graphics#Advantages). Use PNGs for illustrations and graphics—things with large areas of repeated colors—or where you need color accuracy.

.JPG / .JPEG [(Joint Photographic [Experts] Group)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#png_portable_network_graphics)
: Raster/bitmap format that is good for photos. JPGs can compress photos down to much smaller file sizes, but the compression is [lossy](https://en.wikipedia.org/wiki/JPEG#Effects_of_JPEG_compression). Photos tend to hide these *compression artifacts* better than illustrations/graphics.

.SVG [(Scaleable Vector Graphics)](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#svg_scalable_vector_graphics)
: Finally, a [vector](https://en.wikipedia.org/wiki/Vector_graphics) format! SVGs should be used for any icons, logos, or illustrations. They store the vectors in code (a bit like HTML), and can be scaled cleanly for different sizes/resolutions.






{% comment %}
- Working with images

	- Containers/sizing
	- `object-fit` properties
	- GIF/PNG/JPG/SVGs

- Metadata, social images, favicons
{% endcomment %}
