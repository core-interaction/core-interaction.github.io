---
title: DevTools (The Inspector)
order: 5
---



> When working locally, you’ll also want to install the [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) plugin, for quick/auto reloading in the browser! If you prefer this within the VS Code/IDE window, you can use [Live Preview](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server), instead.
{: .callout icon='🔌' }



I am definitely a “Safari guy” for my daily driver browser. But for dev work, [Chrome](https://www.google.com/chrome) is the best in town. (They are all kind of differently bad, in different ways.)
{: .left }

[Chrome DevTools](https://developer.chrome.com/docs/devtools/) \
*We’ll be using Chrome’s developer tools.*
{: .icon-link .right }

Chrome has the most robust, best-in-class set of *DevTools*—though [Safari](https://developer.apple.com/safari/tools/) and [Firefox](https://developer.mozilla.org/en-US/docs/Tools) have their own versions, too. You’ll often hear people (me) call it the “Web Inspector” or just “The Inspector”. It’s going to be your best (Web) friend, showing you everything that the browser has *parsed* to display the page.
{: .left }

{% include figure.html src='right-click.png' class='right' rows='3' %}

*In Chrome, you can bring them up by right-clicking on any element/part of a page and clicking <em>Inspect</em>.*
{: .two-above }

*You can also hit `⌘-⌥-I`, on the Mac.*



You’ll see the tools on the right side of the page. Depending on how big your screen is, they might be laid out a bit differently—but the basics are the same:
{: .four-above }

{% include figure.html src='dev-tools.png' %}

You can also undock the tools out into a separate window—often easier on a laptop/<wbr>small screen.
{: .left .one-above style="align-self: center;" }

{% include figure.html src='customize.svg' class='right' %}



## Elements panel

The top part of the tools is [the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)&#8288;—you can expand/collapse all the nested HTML *elements* on the opened page.
{: .left-narrow }

{% include figure.html src='elements.svg' class='right' rows='4' %}

The first button in the upper-left lets you mouse over on the page, and will then show you that element nested/<wbr>hierarchically within the DOM.

The second (more on this below) toggles the *Device toolbar*, “responsive mode.”

Handy tip: `⌘-F` in here will let you search for elements or text by name/<wbr>class/<wbr>contents.



## Styles pane

The middle area is for the styles. It shows whatever *CSS properties* apply to the element you have selected above, in *the DOM*/elements panel.
{: .left-narrow }

{% include figure.html src='styles.svg' class='right' rows='4' %}

These are ordered with the [most-specific](/topic/css/#specificity) at the top, with any cascading/<wbr>conflicting rules crossed out, as you go down.

On the right, you can see the sum *Computed* (or *rendered*) values of all the rules that apply—regardless of where they come from. These represent *exactly* what the browser is showing to you for the selected element.

In both areas, you can type specific CSS properties/values into the `Filter` box to quickly narrow things down.



You can make changes in the *Elements* or *Styles* areas, and the changes will be immediately visible on the page as if you had edited the source files. It’s useful to try things out quickly (or diagnose problems/<wbr>conflicts).
{: .four-above }

> Keep in mind these changes are temporary—any edits in the *DevTools* will be lost when you leave or reload the page! They are just for you.
{: .callout .two-above icon="🚨" }



## Device mode

First open the inspector, [as above](#elements-panel). Enter *device mode* with the little phone/tablet icon, in the upper left of the DevTools:

{% include figure.html src='device.png' %}

{% include figure.html src='device-bar.svg' %}


{% include figure.html src='responsive.png' class='left-narrow' caption='These devices *don’t* have accurate heights—they don’t account for the web browser’s own interface, so they are all too tall!' %}

{% capture aside %}

Be sure to *refresh* with `⌘-R` if the page doesn’t rescale correctly when you enter this mode! They somestimes don’t, depending on how they are built.

Generally, use the *Responsive* dimensions mode that lets you type in specific pixel dimensions for width/height. Or you can use the divided bar underneath to quickly jump through common/ballpark widths.  And remember that you aren’t targeting devices&#8288;—you are looking for when your content *breaks*.

You can also use the *zoom* dropdown to approximate views *larger* than your current screen! This is great for developing on a laptop. It won’t be precise, but it’s better than nothing.

The *Options* menu also has some handy tricks, like showing *rulers* or capturing *full-length screenshots*!

*Importantly there is also the <em>Console</em> tab, but we’ll talk about that when we get into JavaScript, later.*
{: .four-above }

{% endcapture %}

{% include aside.html content=aside %}



> Always check your work on the real thing, as much as possible!
>
>This is just a quicker preview, but isn’t always perfectly accurate&#8288;—and also won’t reflect any device-specific behaviors around scrolling or rotating. (I’m looking at you, [iOS Safari](https://bugs.webkit.org/show_bug.cgi?id=141832).)
{: .callout icon="🤌" }
