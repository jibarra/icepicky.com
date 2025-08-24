# Overview

This is a site created using Hugo.

# Running local server

`hugo server --renderToMemory`

- `--renderToMemory` will render to memory instead of building, so localhost related stuff won't get written to disk.

# Generating content

To create new content run `hugo new <content_name>.<content_extension>`. The new content will be created in `content/`. You can also specify a path to get the content in a particular directory (e.g. `hugo new blog/test.md`).

To publish content, run `hugo build` from the root directory of this project.

You can also minify the output via `hugo build --minify`.

# TODO

- Add github links to someplace (maybe the footer)
- Explore other configuration options for the new website theme: https://github.com/mrmierzejewski/hugo-theme-console
- See if we want another base color scheme (purple).
- See if we can remove the ` around inline code tags.
- Fix gaps at the end of block code elements.
