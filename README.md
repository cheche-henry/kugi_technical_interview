# Rails Hotwire Blog

A modern blogging platform built with Ruby on Rails, Tailwind CSS, and Hotwire (Turbo + Stimulus). Users can browse posts, view full content, and comment on blog posts with live Turbo updates.

## Features

- Fully responsive Tailwind CSS layout
- Blog posts with:
  - Title, body, summary, and image URL
  - Slug-based URLs using `friendly_id`
- Comments on individual posts
  - Live update with Turbo Streams on creation
- User model (basic, no authentication)
- Admin-like ability to manually assign `user_id`
- Posts displayed as cards with image headers
- Home page hero and individual posts updated to use images instead of gradients
- Paginated blog index (Stimulus controller scaffolded)

## Tech Stack

- Ruby on Rails 8
- Hotwire
  - Turbo for live updates (comments)
  - Stimulus for client-side interactivity
- Tailwind CSS for styling
- FontAwesome for icons
- Pagy for pagination
- SQLite3 for local development

## Setup Instructions

```bash
# Clone the repository
git clone https://github.com/yourusername/blog_app.git
cd blog_app

# Install Ruby dependencies
bundle install

# Install JS dependencies
npm install

# Set up the database
rails db:setup

# (Optional) Seed data
rails db:seed

# Start the development server
bin/dev
```

## Seed Data

The `db/seeds.rb` file creates:

- 5 Users
- ~10 Posts per user (each with title, summary, body, and image_url)
- At least 5 comments per post (linked to users)

## Known Issues

- Pagination renders raw HTML instead of functional navigation. This is due to incomplete integration with Hotwire.
- CRUD actions for posts (edit, delete) are implemented using standard Rails HTML forms, not enhanced with Turbo.
- Authentication is not implemented. `user_id` is manually entered when creating comments.

## Planned Improvements

- User authentication using Devise or similar
- Turbo-enhanced post creation/edit/delete
- User profile pages
- Tags or categories for posts
- Rich text support with ActionText
- Full working Stimulus-powered pagination

## Author

Henry Gikonyo
