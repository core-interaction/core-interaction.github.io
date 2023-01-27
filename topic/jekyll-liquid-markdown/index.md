---
title: Jekyll, Liquid, and Markdown
order: 8
---



We’re going to cover several topics here, under a sort of umbrella topic of *making it less annoying to work with HTML*.
{: .left }

- [Jekyll - Simple, blog-aware, static sites](https://jekyllrb.com) \
*We’ll be using Jekyll as our CMS/static site generator.*

- [Creating a site | Jekyll](https://www.youtube.com/watch?v=pxua_1vyFck&list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB&index=4) \
*Series of videos with a very chipper guy going through features.*

- [Liquid template language](https://shopify.github.io/liquid/) \
*The templating language/syntax that Jekyll uses.*

- [Getting Started | Markdown Guide](https://www.markdownguide.org/getting-started/) \
*The <em>lingua franca</em> markup language these days. Also, the site was [made in Jekyll](https://github.com/mattcone/markdown-guide)!*
{: .no-marker .icon-link  .right rows='5' }

Everything you’ve been working on up to this point has been *hand-written*, meaning every line of code the browser renders is something you have typed (or copied/pasted), “by hand.”

This is how the web started, and is still (I think) the best way to learn the basics—but it is rarely how modern web pages are actually put together anymore. At scale, hand-coding is quickly [*brittle*](https://en.wikipedia.org/wiki/Software_brittleness), especially when you are iterating across many pages.

Instead, almost all websites use some form of *templating*, where one piece of HTML (in a single file) is used repeatedly—either assembled by your computer or by the server—across multiple web pages. Sometimes they are put together (we’ll say *compiled* or *built*) once; other times they are created every time someone goes to the page.

And as we’ve said before, when you are writing the same exact code over and over, there is probably a shorter way. [Don’t repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)!



## First, what is a CMS?

You’ll often hear people talk about [*content management systems*](https://en.wikipedia.org/wiki/Content_management_system) (CMSes). These are software programs that, well… manage content.
{: .left }

*Most CMSes run on a server and use a [database](https://en.wikipedia.org/wiki/Database) to store content, like  [WordPress](https://wordpress.com), [Squarespace](https://www.techradar.com/reviews/squarespace), [Wix](https://www.wix.com/), [Webflow](https://webflow.com), [Cargo](https://cargo.site). There are many.*
{: .right rows="2" }

There are many reasons to use a CMS—for our purposes we’ll use one to separate your *content* from your *templates* (in HTML) and *styles*. To some extent you can think of HTML as *an* expression of your content—but your content is really the text, images, and links—not the syntax of elements and tags. (Another expression could be a PDF, let’s say.)

{% comment %} Quote or visual? {% endcomment %}



## Jekyll and static site generators

[Jekyll](https://jekyllrb.com) was created by Tom Preston-Werner [in 2008](https://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html), and started a trend towards a slightly nuanced/<wbr>different take on the CMS idea—<wbr>something called a [*static site generator*](https://www.cloudflare.com/learning/performance/static-site-generator/).
{: .left }

*Other popular static site generators include [Hugo](https://gohugo.io), [Gatsby](https://www.gatsbyjs.com), [Next.js](https://nextjs.org) (…sorta), [Nuxt](https://jamstack.org/generators/nuxt/) (…also sorta), [Eleventy](https://jamstack.org/generators/eleventy/). Jekyll is the most popular, since it runs on GitHub.*
{: .right rows="2" }

This software (written in [Ruby](https://www.ruby-lang.org/en/)) runs discrete *builds* on your machine (or on a server, GitHub’s in our use)—cobbling together your different source content files and templates and outputting HTML, CSS, and JavaScript—ultimately no different from if you wrote them by hand, as we have. But it can assemble them *for us*, reusing smaller parts.

{% comment %} Visual could be nice. {% endcomment %}



You can use Jekyll as a proper CMS/blogging-type platform, like Wordpress. It has support for all that stuff—[drafts/posts](https://jekyllrb.com/docs/posts/), [themes](https://jekyllthemes.io/), [authors](https://jekyllrb.com/docs/step-by-step/09-collections/), and so on. But we’re going to focus just on how it can make building our simple websites much easier.

> We’ll primarily be using the [template repo](https://github.com/core-interaction/harmonic-collection) to go through the code, but we’ll cover some of the bigger concepts here.
>
> You’ll need to [install Jekyll](/week/8/#jekyll) on your machine, if you haven’t yet!
{: .callout icon='🤚' }

### Front-matter

Jekyll uses a special text block at the start of files called [*front matter*](https://jekyllrb.com/docs/front-matter/) to specify layouts and other information about the page:

```markdown
---
layout: entry
title: This is the first entry
---

<!-- The rest of the file. -->
```
{: .left }

This is saved at the very top of your `.html` and `.md` files (more on this, [below](#and-markdown)), in a data format called [YAML](https://en.wikipedia.org/wiki/YAML)—for *Yet Another Markup Language*. (So many languages, I know.) This data can then be accessed in your `layouts` and `includes` for consistent structure and formatting!

*Note that `YAML` / `YML` uses spaces for indentation, even if the rest of the file uses tabs, and will break with tabs! I do this all the time.*



###  Layouts

Jekyll’s *templates* are called [*layouts*](https://jekyllrb.com/docs/layouts/). You can think of these as page *types* that your content will be inserted into:

{% raw %}
```html
<!DOCTYPE html>
<html>
	<head>
		<title>{{ page.title | default: site.title }}</title>
	</head>
	<body>
		{{ content }}
	</body>
</html>
```
{% endraw %}

A very simplified layout/template. These normally live under the `_layouts` directory in your Jekyll repo, as in our example. The double-handlebars are [*liquid*](#liquid-template-language) <nobr>syntax—</nobr>more on that, shortly. Note that {% raw %}`{{ content }}`{% endraw %} is a special variable, which renders the… content of the page being wrapped.

### Includes

Jekyll can also insert arbitrary, reused pieces of HTML within layouts or pages, called [*includes*](https://jekyllrb.com/docs/includes/).

{% raw %}
```liquid
{% include header.html %}
```
{: .half }
{% endraw %}

(You’ll probably hear me call these *partials*, which is what they are called in some other languages.)

Jekyll will look for the referenced file (in this case, `header.html`) in the `_includes` directory in your repo, and then include/insert its contents. You can also pass content to an include, as a [*parameter*](https://jekyllrb.com/docs/includes/#passing-parameters-to-includes):

{% raw %}
```liquid
{% include header.html link="/topic/jekyll-liquid-markdown" %}
```
{% endraw %}

The value of the parameter can be accessed (inserted) inside the `header.html` as {% raw %}`{{ include.link }}`{% endraw %}.


## Liquid template language

All this curly-bracket/handlebar/mustache syntax is the [Liquid template language](https://shopify.github.io/liquid/), which Jekyll uses to process templates and text.

In Liquid, you generally *output* (insert) content using two curly braces around it, like {% raw %}`{{ page.title }}`{% endraw %}. If you see a *pipe* `|` after something, it means the text is being *filtered* (manipulated), like {% raw %}`{{ page.title | upcase }}`{% endraw %}.

Logic statements are surrounded in a curly-brace-with-percentage-sign combination:

{% raw %}
```liquid
{% if page.title contains "Harmonic" %}
	<!-- Do something for “Harmonic” titles. -->
{% endif %}
```
{% endraw %}

Liquid is also used by [*Shopify*](https://www.shopify.com/), a pretty widely-used e-commerce <nobr>platform—</nobr>so there are lots of examples online! Their [dev documentation](https://shopify.dev/api/liquid) is also a good resource.



## And Markdown!

Last but not least, Jekyll can use [Markdown](https://www.markdownguide.org/getting-started/) for marking… up text. It has a special *syntax* that is *parsed* into basic HTML, instead of manually writing it all out by hand.

It’s used by *many, many* things now: [Google chats][chats], [Slack][slack], [Reddit][reddit], [GitHub][github], [Are.na][arena], [Notion][notion], etc. Sometimes they have their own *flavors* that add special syntax, but the base stuff is the same. Often [WYSIWYG][wysiwyg] text editors are just adding Markdown syntax around things!

[chats]: https://support.google.com/chat/answer/7649118?hl=en
[slack]: https://slack.com/help/articles/202288908-Format-your-messages
[reddit]: https://www.reddit.com/wiki/markdown
[github]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
[arena]: https://support.are.na/help/what-types-of-content-can-i-save-to-are-dot-na
[notion]: https://www.notion.so/help/writing-and-editing-basics
[wysiwyg]: https://en.wikipedia.org/wiki/WYSIWYG

- It’s **much easier** to read the source.
- It is usually much quicker to write.
- Your changes (Git’s `diff`) are clear.
- And overall it is less error-prone.

…compared to writing all the elements/tags yourself! Markdown does have to be compiled/parsed out into HTML, but a lot of software does this behind the scenes.

> I *love* Markdown. If there is only one thing you take away from our class, let it be some fluency in `.md`. It’s the [lingua franca](https://en.wikipedia.org/wiki/Lingua_franca) for basic text formatting.
{: .callout .two-above icon='🤓' }

This very site uses Markdown for our lectures and topics. Here is the section above with its corresponding parsed HTML output:



```markdown
## And Markdown!

Last but not least, Jekyll can use [Markdown](https://www.markdownguide.org/getting-started/) for marking… up text. It has a special *syntax* that is *parsed* into basic HTML, instead of manually writing it all out by hand.

<!-- Note the inline link. -->

It’s used by *many, many* things now: [Google chats][chats], [Slack][slack], [Reddit][reddit], [GitHub][github], [Are.na][arena], [Notion][notion], etc. Sometimes they have their own *flavors* that add special syntax, but the base stuff is the same. Often [WYSIWYG][wysiwyg] text editors are just adding Markdown syntax around things!

<!-- Compared to these “reference style” ones. -->

[chats]: https://support.google.com/chat/answer/7649118?hl=en
[slack]: https://slack.com/help/articles/202288908-Format-your-messages
[reddit]: https://www.reddit.com/wiki/markdown
[github]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
[arena]: https://support.are.na/help/what-types-of-content-can-i-save-to-are-dot-na
[notion]: https://www.notion.so/help/writing-and-editing-basics
[wysiwyg]: https://en.wikipedia.org/wiki/WYSIWYG

- It’s often **much easier** to read the source.
- It is usually much quicker to write.
- Your changes (Git’s `diff`) are clear.
- And overall it is less error-prone.

…compared to writing all the elements/tags yourself! Markdown does have to be compiled/parsed out into HTML, but a lot of software does this behind the scenes.

> I *love* Markdown. If there is only one thing you take away from our class, let it be some fluency in `.md`. It’s the [lingua franca](https://en.wikipedia.org/wiki/Lingua_franca) for basic text formatting.
```
{: style="max-height: 25vh; overflow: scroll; --white-space: pre-wrap;" }



```html
<h2 id="and-markdown">And Markdown!</h2>

<p>Last but not least, Jekyll can use <a href="https://www.markdownguide.org/getting-started/">Markdown</a> for marking… up text. It&nbsp;has a&nbsp;special <em>syntax</em> that is <em>parsed</em> into basic HTML, instead of manually writing it all out by hand.</p>

<p>It’s used by <em>many, many</em> things now: <a href="https://support.google.com/chat/answer/7649118?hl=en">Google chats</a>, <a href="https://slack.com/help/articles/202288908-Format-your-messages">Slack</a>, <a href="https://www.reddit.com/wiki/markdown">Reddit</a>, <a href="https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax">GitHub</a>, <a href="https://support.are.na/help/what-types-of-content-can-i-save-to-are-dot-na">Are.na</a>, <a href="https://www.notion.so/help/writing-and-editing-basics">Notion</a>, etc. Sometimes they have their own <em>flavors</em> that add special syntax, but the base stuff is the same. Often <a href="https://en.wikipedia.org/wiki/WYSIWYG">WYSIWYG</a> text editors are just adding Markdown syntax around things!</p>

<ul>
	<li>It’s often <strong>much easier</strong> to read the source.</li>
	<li>It is usually much quicker to write.</li>
	<li>Your changes (Git’s <code>diff</code>) are clear.</li>
	<li>And overall it is less error-prone.</li>
</ul>

<p>…compared to writing all the elements/tags yourself! Markdown does have to be compiled/parsed out into HTML, but a lot of software does this behind the scenes.</p>

<blockquote>
	<p>I <em>love</em> Markdown. If there is only one thing you take away from our class, let it be some fluency in <code>.md</code>. It’s the <a href="https://en.wikipedia.org/wiki/Lingua_franca">lingua franca</a> for basic text&nbsp;formatting.</p>
</blockquote>
```
{: style="max-height: 25vh; overflow: scroll; --white-space: pre-wrap;" }

