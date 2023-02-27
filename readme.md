# Focus Retreat Center website

## Tech

This is a static website generated with the [zola](https://getzola.org) static site generator. We use zola primarily because Pete likes the rust programming language and it has a nice template inheritance system and nice features like shortcodes, image processing, hot reloading, good documentation. It is definitely a more niche tool and there are many more popular alternatives we could use.

* HTML is plain but marked up with the [tera template language](https://tera.netlify.app).  
* CSS uses the [SASS/SCSS](https://sass-lang.com) preprocessor with SCSS syntax for nesting
* Content is primarily [markdown](https://www.markdownguide.org/)

## Filesystem Layout

**templates** has the main HTML stuff. This started as a 1-pager so there was only index.html but as we add varying page types it will grow.

**content/** has most page content as markdown files. The directory structure under `content` maps to web URL paths so this will be filling out organically as we add to the site. It is recommended to keep images and other linked assets alongside the content. Zola supports using a file for a page as well as a directory, and we prefer the directory so **pagename/index.md** so the assets can be linked in with plain filenames.

**content/blog/** has the blog articles.

**copy/** are smaller sections/excerpts of content mostly for populating the home page just to keep them separate from the HTML so editors can change the words without having to deal with HTML.

**bin/** has some basic scripts for deploying and running in development.

**static/** has assorted other files and images that get copied into the website root directory.

## Blog Post Guidelines

Try to have at least on image in each blog post. The image file can go in the blog post's directory. Reference the image file name in the markdown frontmatter under `[extra]` as `image = "photo.jpg"`.

## Code Formatting

We format HTML/tera, SCSS, and JavaScript source files with [prettier](https://prettier.io/). It doesn't understand tera so the template markup often looks wonky, but the autoformatting is more valuable so for now we deal with it.

## Hosting

Hosted by [netlify](https://app.netlify.com/). This integrates with github. Code that lands in the _main_ branch will be automatically deployed to production.

## Design

Web design and logo art created by [Emphasis Creative](https://emphasiscreative.com/).
