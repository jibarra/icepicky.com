# Overview

This is a site created using Hugo.

# Running local server

`hugo server --renderToMemory`

- `--renderToMemory` will render to memory instead of building, so localhost related stuff won't get written to disk.

# Generating content

To create new content run `hugo new <content_name>.<content_extension>`. The new content will be created in `content/`. You can also specify a path to get the content in a particular directory (e.g. `hugo new blog/test.md`).

To publish content, run `hugo` from the root directory of this project.
