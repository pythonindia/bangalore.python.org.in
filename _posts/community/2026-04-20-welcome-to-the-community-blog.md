---
layout: post
title:  "How to Create a Blog Post for the Community Blog"
date: 2026-04-20
authors: 
  - ramgopalsiddh
categories: [ community ]
description: "A comprehensive guide on how to create and contribute blog posts to the BangPypers Community Blog."
featured: false
---

## How to Create a Blog Post for the Community Blog

Welcome to the BangPypers Community Blog! This guide will walk you through the process of creating and publishing your own blog post.

### Getting Started

The Community Blog uses GitHub and Jekyll to publish content. All blog posts are written in Markdown format and stored in the `_posts/community/` directory of our repository. This is separate from the main blog posts in `_posts/`, which are typically written by core organizers.

### Step-by-Step Guide to Creating a Blog Post

#### 1. **Fork the Repository**

First, fork the BangPypers repository from our GitHub page to your own account. This allows you to make changes without affecting the main content.

#### 2. **Create a New File**

Create a new Markdown file in the `_posts/community/` directory with the following naming convention:

```
YYYY-MM-DD-post-title.md
```

Example: `2025-02-21-my-first-post.md`

#### 3. **Add Front Matter**

Every blog post must start with YAML front matter that looks like this:

```yaml
---
layout: post
title: "Your Blog Post Title"
date: YYYY-MM-DD
authors: 
  - your-username
categories: [ community, python, tutorial ]
description: "A brief description of your blog post (appears in previews)."
featured: false
---
```

- **title**: The title of your blog post
- **date**: Publication date in YYYY-MM-DD format
- **authors**: List your author handle (add yourself in `_authors/` directory if new)
- **categories**: Relevant tags for your post (available: community, python, tutorial, workshop etc.)
- **description**: A short summary for social sharing 
- **featured**: Set to `true` to highlight your post on the homepage
- **image**: Optional URL to a featured image for social sharing

#### Author Registration

If you're a new author, create a profile in the `_authors/` directory. Create a file named `your-username.md` with YAML front matter like:

```yaml
---
username: your-username
name: "Your Full Name"
logo: https://example.com/avatar.jpg
email: your-email@example.com
twitter: https://twitter.com/yourhandle
web: https://yourwebsite.com
description: "A short bio about yourself."
---
```

This profile will appear with your posts.
```


#### 4. **Write Your Content**

Use Markdown formatting to write your blog post. Here are some useful formatting tips:


#### 5. **Preview Your Post Locally**

Before submitting, preview your post to ensure it renders correctly:

1. Install Jekyll and dependencies: `bundle install`
2. Run the site locally: `bundle exec jekyll serve`
3. Open http://localhost:4000 to view your post
4. Check formatting, links, and images

#### 6. **Submit Your Post**

Once your post is ready:

1. Commit your changes to your fork
2. Create a pull request to the main repository with a clear title.
3. Our team will review your post.
4. Reviewers check for: adherence to guidelines, quality, relevance, and technical accuracy
5. If changes are requested, update your PR accordingly
6. Once approved, it will be published to the community blog


### Content Guidelines

- Posts should be Python or community-related
- Be respectful and follow our [Code of Conduct](/coc.html)
- Avoid promotional or overly commercial content
- Attribution is important—cite your sources
- Posts should be original or properly attributed if previously published elsewhere

### Need Help?

If you have questions about creating a blog post, feel free to:
- Ask on our [Discord server](https://discord.gg/Tnhbqh33zd)
- Open an issue on [GitHub](https://github.com/bangpypers/bangalore.python.org.in)
- Join our [mailing list](http://mail.python.org/mailman/listinfo/bangpypers)

### Troubleshooting

- **Jekyll won't build?** Ensure you have Ruby and Bundler installed. Run `bundle install` to install dependencies.
- **Images not appearing?** Check the URL is correct and accessible. For local images, ensure they're in the right path.
- **Front matter errors?** Validate your YAML syntax—use a YAML validator online.
- **Post not showing?** Check the date is not in the future and `hidden` is `false`.

We look forward to your contributions!
