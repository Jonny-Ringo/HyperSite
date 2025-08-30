-- HyperSite System
-- Each variable becomes an addressable endpoint at /now/{variable_name}
-- Example: https://workshop.forward.computer/{process-id}/now/page
--          https://workshop.forward.computer/{process-id}/now/about
--          https://workshop.forward.computer/{process-id}/now/nav

local json = require('json')

-- Website Configuration
config = {
    site_name = "HyperSite",
    site_description = "Revolutionary website built on AO addressable endpoints",
    base_url = "https://workshop.forward.computer/" .. (id or "PROCESS_ID") .. "/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now",
    theme_color = "#00ff88",
    owner = "AO Developer",
    social = {
        twitter = "@ao_computer",
        github = "ao-org"
    }
}

-- Meta Tags Function (creates comprehensive meta tags for any page)
function create_meta(title, description, image_url, page_path)
    local base_url = config.base_url:gsub("/now", "")
    local full_url = base_url .. "/now/" .. page_path
    local default_image = base_url .. "/now/og_image" -- Default Open Graph image endpoint
    
    return [=[
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>]=] .. title .. [=[</title>
    <meta name="description" content="]=] .. description .. [=[">
    
    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="]=] .. full_url .. [=[">
    <meta property="og:title" content="]=] .. title .. [=[">
    <meta property="og:description" content="]=] .. description .. [=[">
    <meta property="og:image" content="]=] .. (image_url or default_image) .. [=[">
    <meta property="og:site_name" content="]=] .. config.site_name .. [=[">
    
    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="]=] .. full_url .. [=[">
    <meta property="twitter:title" content="]=] .. title .. [=[">
    <meta property="twitter:description" content="]=] .. description .. [=[">
    <meta property="twitter:image" content="]=] .. (image_url or default_image) .. [=[">
    <meta property="twitter:creator" content="]=] .. config.social.twitter .. [=[">
    
    <!-- Additional SEO -->
    <meta name="author" content="]=] .. config.owner .. [=[">
    <meta name="theme-color" content="]=] .. config.theme_color .. [=[">
    <link rel="canonical" href="]=] .. full_url .. [=[">
    ]=]
end

-- Default Open Graph Image (accessible at /now/og_image)
og_image = [=[
<svg width="1200" height="630" xmlns="http://www.w3.org/2000/svg">
    <defs>
        <linearGradient id="gradient" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" style="stop-color:#00ff88;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#00cc6a;stop-opacity:1" />
        </linearGradient>
    </defs>
    <rect width="1200" height="630" fill="#0a0a0a"/>
    <circle cx="600" cy="315" r="200" fill="url(#gradient)" opacity="0.1"/>
    <text x="600" y="280" font-family="Arial, sans-serif" font-size="72" font-weight="bold" fill="url(#gradient)" text-anchor="middle">AO HyperSite</text>
    <text x="600" y="350" font-family="Arial, sans-serif" font-size="32" fill="#888888" text-anchor="middle">Revolutionary Addressable Endpoints</text>
    <text x="600" y="400" font-family="Arial, sans-serif" font-size="24" fill="#555555" text-anchor="middle">Variables → Websites</text>
</svg>
]=]

-- Shared CSS Styles (accessible at /now/styles)
styles = [=[
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap');
    
    :root {
        --primary: #00ff88;
        --primary-dark: #00cc6a;
        --bg-dark: #0a0a0a;
        --bg-card: #1a1a1a;
        --text: #ffffff;
        --text-dim: #888888;
        --border: #333333;
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Inter', sans-serif;
        background: var(--bg-dark);
        color: var(--text);
        line-height: 1.6;
        min-height: 100vh;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }
    
    /* Navigation Styles */
    nav {
        background: rgba(26, 26, 26, 0.95);
        backdrop-filter: blur(10px);
        border-bottom: 1px solid var(--border);
        position: sticky;
        top: 0;
        z-index: 100;
    }
    
    .nav-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem 0;
    }
    
    .logo {
        font-weight: 700;
        font-size: 1.5rem;
        color: var(--primary);
        text-decoration: none;
    }
    
    .nav-links {
        display: flex;
        list-style: none;
        gap: 2rem;
    }
    
    .nav-links a {
        color: var(--text);
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }
    
    .nav-links a:hover {
        color: var(--primary);
    }
    
    /* Content Styles */
    main {
        flex: 1;
        padding: 2rem 0;
    }
    
    .hero {
        text-align: center;
        padding: 4rem 0;
        background: linear-gradient(135deg, rgba(0, 255, 136, 0.1), rgba(0, 204, 106, 0.05));
        border-radius: 20px;
        margin-bottom: 3rem;
    }
    
    .hero h1 {
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 1rem;
        background: linear-gradient(135deg, var(--primary), var(--primary-dark));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }
    
    .hero p {
        font-size: 1.2rem;
        color: var(--text-dim);
        max-width: 600px;
        margin: 0 auto;
    }
    
    .card {
        background: var(--bg-card);
        border: 1px solid var(--border);
        border-radius: 12px;
        padding: 2rem;
        margin-bottom: 2rem;
    }
    
    .card h2 {
        color: var(--primary);
        margin-bottom: 1rem;
    }
    
    .btn {
        display: inline-block;
        background: var(--primary);
        color: var(--bg-dark);
        padding: 0.75rem 1.5rem;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: background 0.3s ease;
    }
    
    .btn:hover {
        background: var(--primary-dark);
    }
    
    .grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
        margin: 2rem 0;
    }
    
    footer {
        background: var(--bg-card);
        border-top: 1px solid var(--border);
        padding: 2rem 0;
        margin-top: 4rem;
        text-align: center;
        color: var(--text-dim);
    }
    
    .code {
        font-family: 'JetBrains Mono', monospace;
        background: var(--bg-card);
        border: 1px solid var(--border);
        border-radius: 8px;
        padding: 1rem;
        font-size: 0.9rem;
        overflow-x: auto;
    }
    
    .highlight {
        color: var(--primary);
        font-weight: 600;
    }
    
    @media (max-width: 768px) {
        .nav-container {
            flex-direction: column;
            gap: 1rem;
        }
        
        .nav-links {
            gap: 1rem;
        }
        
        .hero h1 {
            font-size: 2rem;
        }
        
        .grid {
            grid-template-columns: 1fr;
        }
    }
</style>
]=]

-- Navigation Component (accessible at /now/nav)
nav = [=[
<nav>
    <div class="container">
        <div class="nav-container">
            <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/home" class="logo">AO HyperSite</a>
            <ul class="nav-links">
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/home">Home</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/about">About</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/template">Template</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/chat">Discussion</a></li>
            </ul>
        </div>
    </div>
</nav>
]=]

-- Footer Component (accessible at /now/footer)
footer = [=[
<footer>
    <div class="container">
        <p>&copy; 2025 HyperSite. Built with revolutionary addressable endpoints.</p>
        <p>Each page is a separate variable accessible at <code>/now/{page_name}</code></p>
    </div>
</footer>
]=]

-- Main Homepage (accessible at /now/home)
home = [=[<!DOCTYPE html>
<html lang="en">
<head>
    ]=] .. create_meta(
        "HyperSite", 
        "Revolutionary website built on AO addressable endpoints. Each variable becomes directly accessible via HTTP.",
        nil, -- Uses default og_image
        "home"
    ) .. [=[
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>Welcome to the Future</h1>
                <p>This website is built using AO's revolutionary addressable endpoints. Each page is a separate variable that becomes directly accessible via HTTP.</p>
            </div>
            
            <div class="grid">
                <div class="card">
                    <h2>&#127760; Modular Architecture</h2>
                    <p>Every component is a separate variable accessible at unique endpoints.</p>
                    <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/about" class="btn">Learn More</a>
                </div>
                
                <div class="card">
                    <h2>&#128640; Direct Access</h2>
                    <p>Access any page directly: <code>/now/home</code>, <code>/now/about</code>, <code>/now/chat</code></p>
                    <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/template" class="btn">Use Template</a>
                </div>
                
                <div class="card">
                    <h2>&#9889; Real-Time Updates</h2>
                    <p>Update any component by modifying its variable - changes are instant.</p>
                    <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/template" class="btn">Use Template</a>
                </div>
            </div>
            
            <div class="card">
                <h2>&#128225; How It Works</h2>
                <div class="code">
-- Define a page as a variable<br/>
about = [[ &lt;html&gt;...&lt;/html&gt; ]]<br/>
<br/>
-- Instantly accessible at:<br/>
-- https://workshop.forward.computer/{process-id}/now/about
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- About Page (accessible at /now/about)
about = [=[<!DOCTYPE html>
<html lang="en">
<head>
    ]=] .. create_meta(
        "About - HyperSite", 
        "Learn about AO's revolutionary addressable endpoints feature where every Lua variable becomes a directly accessible web endpoint.",
        nil,
        "about"
    ) .. [=[
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="card">
                <h1>About This Revolutionary Website</h1>
                <p>This website demonstrates the power of AO's addressable endpoints feature, where every Lua variable becomes a directly accessible web endpoint.</p>
                
                <h2>&#127919; Key Features</h2>
                <ul style="margin: 1rem 0; padding-left: 2rem;">
                    <li>Each page is a separate Lua variable</li>
                    <li>Direct HTTP access to any component</li>
                    <li>Modular and maintainable architecture</li>
                    <li>Real-time updates without deployments</li>
                    <li>Built-in API documentation</li>
                </ul>
                
                <h2>&#128295; Architecture</h2>
                <p>The website consists of several key components:</p>
                
                <div class="grid">
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#128196; Pages</h3>
                        <p><code>home</code>, <code>about</code>, <code>chat</code>, <code>template</code></p>
                    </div>
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#129513; Components</h3>
                        <p><code>nav</code>, <code>footer</code>, <code>styles</code></p>
                    </div>
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#128202; Data</h3>
                        <p><code>config</code>, <code>blog_posts</code>, <code>projects_data</code></p>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Template & Tutorial Page (accessible at /now/template)
template = [=[<!DOCTYPE html>
<html lang="en">
<head>
    ]=] .. create_meta(
        "Website Template - HyperSite", 
        "Copy this template to create your own AO addressable endpoint website. Complete 3-page template with navigation and styling.",
        nil,
        "template"
    ) .. [=[
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>&#128640; Website Template</h1>
                <p>Copy this template to create your own AO HyperSite in minutes!</p>
            </div>
            
            <div class="card">
                <h2>&#128161; How It Works</h2>
                <p>In HyperBEAM, every Lua variable automatically becomes a web endpoint. Instead of files and servers, you simply define variables:</p>
                
                <div class="code" style="margin: 1rem 0;">
-- This variable becomes accessible at /now/homepage<br/>
homepage = [[ &lt;html&gt;&lt;body&gt;Hello World!&lt;/body&gt;&lt;/html&gt; ]]<br/><br/>
-- This variable becomes accessible at /now/about<br/>
about = [[ &lt;html&gt;&lt;body&gt;About Us&lt;/body&gt;&lt;/html&gt; ]]
                </div>
                
                <p><strong>That's it!</strong> No servers, no deployments, no build processes. Change a variable, update your website instantly.</p>
            </div>
            
            <div class="card">
                <h2>&#128221; Basic Website Template</h2>
                <p>Here's a complete 3-page website template you can copy and customize:</p>
                
                <div class="code" style="font-size: 0.85rem; line-height: 1.4;">
-- Basic styles (accessible at /now/css)<br/>
css = [[<br/>
&lt;style&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;body {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;font-family: Arial, sans-serif;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: 40px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: #f5f5f5;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;nav {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: #333;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 10px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin: -40px -40px 20px -40px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;nav a {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: white;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;margin-right: 20px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text-decoration: none;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;nav a:hover {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #4CAF50;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;.container {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max-width: 800px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background: white;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding: 30px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-radius: 8px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;h1 {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color: #333;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;border-bottom: 2px solid #4CAF50;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;padding-bottom: 10px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
&lt;/style&gt;<br/>
]]<br/><br/>
-- Navigation component (accessible at /now/navigation)<br/>
navigation = [[<br/>
&lt;nav&gt;<br/>
&nbsp;&nbsp;&lt;a href="/{PROCESS_ID}/now/main"&gt;Home&lt;/a&gt;<br/>
&nbsp;&nbsp;&lt;a href="/{PROCESS_ID}/now/about"&gt;About&lt;/a&gt;<br/>
&lt;/nav&gt;<br/>
]]<br/><br/>
-- Homepage (accessible at /now/main)<br/>
main = [[<br/>
&lt;!DOCTYPE html&gt;<br/>
&lt;html&gt;<br/>
&lt;head&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta charset="UTF-8"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&gt;My AO Website&lt;/title&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta name="description" content="My website built with AO addressable endpoints"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;!-- Open Graph --&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta property="og:title" content="My AO Website"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta property="og:description" content="Revolutionary variable-based website"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta property="og:image" content="/{PROCESS_ID}/now/og_image"&gt;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta property="og:url" content="/{PROCESS_ID}/now/main"&gt;<br/>
&lt;/head&gt;<br/>
&lt;body&gt;<br/>
]] .. css .. navigation .. [[<br/>
&lt;div class="container"&gt;<br/>
&nbsp;&nbsp;&lt;h1&gt;Welcome to My Website&lt;/h1&gt;<br/>
&nbsp;&nbsp;&lt;p&gt;This website is built using AO's revolutionary addressable endpoints!&lt;/p&gt;<br/>
&nbsp;&nbsp;&lt;p&gt;Each page is simply a Lua variable that becomes directly accessible via HTTP.&lt;/p&gt;<br/>
&lt;/div&gt;<br/>
&lt;/body&gt;<br/>
&lt;/html&gt;<br/>
]]<br/><br/>
-- About page (accessible at /now/about)<br/>
about = css .. navigation .. [[<br/>
&lt;div class="container"&gt;<br/>
&nbsp;&nbsp;&lt;h1&gt;About Us&lt;/h1&gt;<br/>
&nbsp;&nbsp;&lt;p&gt;We're pioneers in the new era of variable-based web architecture.&lt;/p&gt;<br/>
&nbsp;&nbsp;&lt;p&gt;No servers, no deployments - just pure, addressable variables!&lt;/p&gt;<br/>
&lt;/div&gt;<br/>
]]<br/><br/>
                </div>
            </div>
            
            <div class="card">
                <h2>&#128295; How to Use This Template</h2>
                <ol style="padding-left: 2rem; line-height: 1.8;">
                    <li><strong>Save the code above</strong> as index.lua</li>
                    <li><strong>Replace {PROCESS_ID}</strong> in the navigation links with your actual AO process ID</li>
                    <li><code><strong>.load index.lua</strong></code> into your AO process</li>
                    <li><strong>Your website is instantly live!</strong> Access pages at:
                        <ul style="margin: 10px 0; padding-left: 20px;">
                            <li><code>/now/main</code> - Homepage</li>
                            <li><code>/now/about</code> - About page</li>
                        </ul>
                    </li>
                    <li><strong>Customize content:</strong> Edit the HTML inside the variables</li>
                    <li><strong>Add more pages:</strong> Create new variables like <code>services = css .. navigation .. [[ ... ]]</code></li>
                    <li><strong>Update instantly:</strong> Change any variable and your website updates immediately</li>
                </ol>
            </div>
            
            <div class="card">
                <h2>&#127919; Advanced Features</h2>
                <p>Once you understand the basics, you can add:</p>
                <ul style="padding-left: 2rem; line-height: 1.8;">
                    <li><strong>Data endpoints:</strong> <code>products = {name="Widget", price=10}</code> → accessible at <code>/now/products</code></li>
                    <li><strong>Dynamic content:</strong> Variables can contain functions that generate content</li>
                    <li><strong>API responses:</strong> Return JSON, XML, or any format</li>
                    <li><strong>Real-time updates:</strong> Change variables programmatically based on events</li>
                </ul>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Chat/Discussion Page (accessible at /now/chat)
chat = [=[<!DOCTYPE html>
<html lang="en">
<head>
    ]=] .. create_meta(
        "Discussion - HyperSite", 
        "Community discussion about AO, addressable endpoints, and the future of web development. Share your thoughts and ideas.",
        nil,
        "chat"
    ) .. [=[
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>Discussion</h1>
                <p>Community discussion about AO, addressable endpoints, and the future of web development</p>
            </div>
            
            <div class="card">
                <h2>&#128221; Latest Posts</h2>
                
                <div style="border-left: 3px solid var(--primary); padding-left: 1rem; margin: 2rem 0;">
                    <h3><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/post_1" style="color: var(--primary); text-decoration: none;">Building Modular Websites with AO</a></h3>
                    <p style="color: var(--text-dim); margin: 0.5rem 0;">How addressable endpoints revolutionize web architecture</p>
                    <small>Published: 2025-01-28</small>
                </div>
            </div>
            
            <!-- Comments Section -->
            <div class="card">
                <h2>&#128172; Comments & Discussion</h2>
                <div id="comments-list">
                    <!-- Comments will be loaded here -->
                </div>
                
                <h3 style="margin-top: 2rem; color: var(--primary);">Add a Comment</h3>
                <form id="commentForm" style="margin-top: 1rem;">
                    <div style="margin-bottom: 1rem;">
                        <label for="author" style="display: block; margin-bottom: 0.5rem; color: var(--text);">Name:</label>
                        <input type="text" id="author" name="author" required 
                               style="width: 100%; padding: 0.75rem; border: 1px solid var(--border); border-radius: 8px; background: var(--bg-dark); color: var(--text); font-family: inherit;">
                    </div>
                    <div style="margin-bottom: 1rem;">
                        <label for="comment" style="display: block; margin-bottom: 0.5rem; color: var(--text);">Comment:</label>
                        <textarea id="comment" name="comment" rows="4" required 
                                  style="width: 100%; padding: 0.75rem; border: 1px solid var(--border); border-radius: 8px; background: var(--bg-dark); color: var(--text); font-family: inherit; resize: vertical;"></textarea>
                    </div>
                    <button type="submit" class="btn">Post Comment</button>
                </form>
            </div>
        </div>
    </main>
    
    <script>
        const processId = window.location.pathname.split('/')[1];
        const baseUrl = `/${processId}`;
        
        // Load comments
        async function loadComments() {
            try {
                const response = await fetch(`${baseUrl}/now/comments`);
                const comments = await response.json();
                const commentsList = document.getElementById('comments-list');
                
                if (comments.length === 0) {
                    commentsList.innerHTML = '<p style="color: var(--text-dim); font-style: italic;">No comments yet. Be the first to comment!</p>';
                    return;
                }
                
                // Sort comments by timestamp (newest first) - handle both old and new timestamp formats
                const sortedComments = comments.sort((a, b) => {
                    const aTime = a.timestamp || new Date(a.date).getTime();
                    const bTime = b.timestamp || new Date(b.date).getTime();
                    return bTime - aTime;
                });
                
                commentsList.innerHTML = `
                    <h3 style="color: var(--primary); margin-bottom: 1rem;">Comments (${sortedComments.length})</h3>
                    ${sortedComments.map(comment => `
                        <div style="border-left: 3px solid var(--primary); padding: 1rem; margin: 1.5rem 0; background: rgba(0, 255, 136, 0.05); border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem;">
                                <strong style="color: var(--primary); font-size: 1.1rem;">@${comment.author}</strong>
                                <small style="color: var(--text-dim); font-size: 0.85rem;">
                                    ${comment.timestamp ? new Date(comment.timestamp).toLocaleString() : comment.date}
                                </small>
                            </div>
                            <p style="margin: 0; line-height: 1.6; color: var(--text); font-size: 0.95rem;">${comment.content}</p>
                        </div>
                    `).join('')}
                `;
            } catch (error) {
                console.error('Error loading comments:', error);
            }
        }
        
        // Handle comment form submission
        document.getElementById('commentForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const author = document.getElementById('author').value;
            const comment = document.getElementById('comment').value;
            
            try {
                // Try the exact format from the developer's example
                const url = `${baseUrl}/push&action=add-comment&author=${encodeURIComponent(author)}&comment=${encodeURIComponent(comment)}&!`;
                console.log('Posting to:', url);
                
                const response = await fetch(url, {
                    method: 'GET', // Try GET instead of POST
                });
                
                if (response.ok) {
                    document.getElementById('commentForm').reset();
                    setTimeout(loadComments, 1000); // Reload comments after 1 second
                    alert('Comment posted successfully!');
                } else {
                    alert('Error posting comment. Please try again.');
                }
            } catch (error) {
                console.error('Error posting comment:', error);
                alert('Error posting comment. Please try again.');
            }
        });
        
        // Load comments on page load
        loadComments();
    </script>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Individual Blog Posts
post_1 = [=[<!DOCTYPE html>
<html lang="en">
<head>
    ]=] .. create_meta(
        "Building Modular Websites with AO", 
        "AO's addressable endpoints feature opens up entirely new possibilities for web architecture. Build truly modular systems where each component is a separate variable.",
        nil,
        "post_1"
    ) .. [=[
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="card">
                <h1>Building Modular Websites with AO</h1>
                <p style="color: var(--text-dim); margin-bottom: 2rem;">Published: January 28, 2025</p>
                
                <p>AO's addressable endpoints feature opens up entirely new possibilities for web architecture. Instead of traditional file-based websites, we can build truly modular systems where each component is a separate variable.</p>
                
                <h2>The Revolutionary Approach</h2>
                <p>Consider this simple example:</p>
                
                <div class="code">
-- Define a page<br/>
homepage = [[ &lt;html&gt;...&lt;/html&gt; ]]<br/>
<br/>
-- Instantly accessible at:<br/>
https://workshop.forward.computer/{process-id}/now/homepage
                </div>
                
                <h2>Benefits</h2>
                <ul style="margin: 1rem 0; padding-left: 2rem;">
                    <li><strong>Instant Updates:</strong> Change a variable, update the website</li>
                    <li><strong>Modular Components:</strong> Reusable navigation, footers, styles</li>
                    <li><strong>Direct Access:</strong> Each component has its own URL</li>
                    <li><strong>Version Control:</strong> All changes are recorded on-chain</li>
                </ul>
                
                <p><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/chat" class="btn">&#8592; Back to Discussion</a></p>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]



-- Internal comment storage 
comments_table = comments_table or {}

-- Migrate existing comments if they exist in the old format
if comments and type(comments) == "table" and #comments > 0 and not comments_table[1] then
    comments_table = comments
    print("Migrated " .. #comments_table .. " existing comments")
end

-- JSON endpoint for comments (accessible at /now/comments)
comments = json.encode(comments_table)

-- Blog Posts Data (accessible at /now/blog_posts)
blog_posts = {
    {
        id = "post_1",
        title = "Building Modular Websites with AO",
        excerpt = "How addressable endpoints revolutionize web architecture",
        date = "2025-01-28",
        url = "/now/post_1"
    }
}

-- Initialize message
print("&#127760; HyperSite System Initialized!")
print("&#128225; Available endpoints:")
print("  &#8226; Homepage: /now/home")
print("  &#8226; About: /now/about") 
print("  &#8226; Template: /now/template")
print("  &#8226; Discussion: /now/chat")
print("  &#8226; Components: /now/nav, /now/footer, /now/styles")
print("  &#8226; Data: /now/config, /now/blog_posts")
print("&#128640; Each variable is directly accessible via HTTP!")

-- Comment Handler (responds to /push&action=add-comment)
Handlers.add('AddComment', 'add-comment', function(msg)
    -- Debug: Print all available data
    print("=== DEBUG COMMENT DATA ===")
    print("msg.Tags:", json.encode(msg.Tags or {}))
    print("msg.Data:", msg.Data or "nil")
    print("msg.From:", msg.From or "nil")
    
    -- Check if parameters are in other fields
    for k, v in pairs(msg) do
        if type(k) == "string" and (k:find("author") or k:find("comment")) then
            print("Found param - " .. k .. ":", v)
        end
    end
    
    local timestamp = tostring(os.time())
    local tags = msg.Tags or {}
    
    -- Get parameters from message fields (they come through as direct properties)
    local author = msg.author or tags.author or msg.From or "Anonymous"
    local content = msg.comment or tags.comment or msg.Data or ""
    local browserTimestamp = tonumber(msg.timestamp) or os.time() * 1000
    
    -- Ensure comments_table exists
    if not comments_table then
        comments_table = {}
    end
    
    local comment = {
        id = #comments_table + 1,
        author = author,
        content = content,
        timestamp = browserTimestamp,
        serverTimestamp = timestamp,
        date = os.date("%Y-%m-%d %H:%M", math.floor(browserTimestamp / 1000))
    }
    
    -- Add comment to internal storage
    table.insert(comments_table, comment)
    
    -- Update JSON endpoint
    comments = json.encode(comments_table)
    
    -- Send confirmation

    
    send({
        target = msg.From,
        data = json.encode({
            status = "success",
            message = "Comment added successfully!",
            comment = comment
        })
    })
    
    print("New comment added by " .. comment.author .. ": " .. comment.content)
end)

-- Handler to list all available endpoints
Handlers.add('GetSitemap', 'GetSitemap', function(msg)
    local sitemap = {
        pages = {
            "home", "about", "template", "chat"
        },
        components = {
            "nav", "footer", "styles"
        },
        data = {
            "config", "blog_posts", "comments", "og_image"
        },
        posts = {
            "post_1", "post_2"
        },
        base_url = config.base_url
    }
    
    send({
        target = msg.from,
        data = json.encode(sitemap)
    })
end)
