# Overview

This is a site created using Hugo.

# Scripts

Scripts for common actions are contained in the `scripts` directory.

- `scripts/local.sh`: Runs a local version of Hugo to verify changes locally.
- `scripts/new-post.sh`: Creates a new blog post. The first argument is the name of the file (without extension).
- `scripts/build.sh`: Builds a production version of the site.

# Theme

Currently, I use a fork of [hugo-theme-console.](https://github.com/jibarra/hugo-theme-console) I've made changes to the theme to fix bugs and support my personal needs.

Other themes that I've found nice:

- [Minima theme from Jekyll](https://github.com/jekyll/minima) - may be nice to port to Hugo.

# TODO

- Add created at & updated at to blog pages.
- Add tags to blog pages.
- Fix CORS request failing for Cloudflare analytics: https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSDidNotSucceed
