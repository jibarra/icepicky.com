#!/bin/bash

# Create a new post in blog/ with the given name passed as args
# Usage: ./scripts/new-post.sh <post_name>
# Example: ./scripts/new-post.sh my-post
hugo new blog/$1.md
