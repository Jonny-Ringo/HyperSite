# HyperSite

Current process demonstration on esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvgLIVE

Revolutionary website built on AO's addressable endpoints feature, where every Lua variable becomes a directly accessible web endpoint.

## Features

- **Variable-Based Architecture**: Each page is a separate Lua variable accessible via HTTP
- **Dynamic Process IDs**: All links use dynamic `id` variable for portability
- **Modular Components**: Reusable navigation, footer, and styles
- **Real-Time Updates**: Change variables to instantly update the website
- **Interactive Comments**: Built-in discussion system with comment storage
- **SEO Optimized**: Complete meta tags and Open Graph integration
- **Custom OG Image**: Uses Arweave-hosted image for social sharing

## File Structure

```
├── index-html.lua          # Main configuration, homepage, and handlers
├── about-html.lua          # About page content
├── discussion-html.lua     # Discussion/chat page with comments
├── template-html.lua       # Template and tutorial page
├── hyperstyles-css.lua     # CSS styles for the entire site
└── README.md              # This file
```

## Available Endpoints

- `/now/home` - Homepage
- `/now/about` - About page
- `/now/template` - Template and tutorial
- `/now/chat` - Discussion with comments
- `/now/nav` - Navigation component
- `/now/footer` - Footer component
- `/now/styles` - CSS styles
- `/now/og_image` - Open Graph image
- `/now/comments` - Comments JSON API

## Quick Start

1. Load the files into your AO process:
   ```
   .load index-html.lua
   .load about-html.lua
   .load discussion-html.lua
   .load template-html.lua
   .load hyperstyles-css.lua
   ```

2. Your website is instantly live at:
   ```
   https://workshop.forward.computer/{your-process-id}/now/home
   ```

3. Customize by editing the Lua variables and reloading

## Technical Details

- **Framework**: AO Addressable Endpoints
- **Language**: Lua
- **Styling**: CSS with custom properties
- **Comments**: JSON storage with real-time updates
- **Images**: Arweave integration for OG image hosting

## About

Built by Jonny Ringo as a demonstration of AO's revolutionary addressable endpoints feature. No servers, no deployments - just pure, addressable variables that become instant web endpoints.