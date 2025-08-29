-- AO Modular Website System
-- Each variable becomes an addressable endpoint at /now/{variable_name}
-- Example: https://workshop.forward.computer/{process-id}/now/page
--          https://workshop.forward.computer/{process-id}/now/about
--          https://workshop.forward.computer/{process-id}/now/nav

local json = require('json')

-- Website Configuration
config = {
    site_name = "AO Modular Site",
    site_description = "Revolutionary website built on AO addressable endpoints",
    base_url = "https://workshop.forward.computer/" .. (id or "PROCESS_ID") .. "/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now",
    theme_color = "#00ff88",
    owner = "AO Developer",
    social = {
        twitter = "@ao_computer",
        github = "ao-org"
    }
}

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
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/projects">Projects</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/blog">Blog</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/contact">Contact</a></li>
                <li><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/docs">API Docs</a></li>
            </ul>
        </div>
    </div>
</nav>
]=]

-- Footer Component (accessible at /now/footer)
footer = [=[
<footer>
    <div class="container">
        <p>&copy; 2025 AO Modular Website. Built with revolutionary addressable endpoints.</p>
        <p>Each page is a separate variable accessible at <code>/now/{page_name}</code></p>
    </div>
</footer>
]=]

-- Main Homepage (accessible at /now/home)
home = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AO Modular Website</title>
    <meta name="description" content="Revolutionary website built on AO addressable endpoints">
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
                    <p>Access any page directly: <code>/now/home</code>, <code>/now/about</code>, <code>/now/contact</code></p>
                    <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/docs" class="btn">View API</a>
                </div>
                
                <div class="card">
                    <h2>&#9889; Real-Time Updates</h2>
                    <p>Update any component by modifying its variable - changes are instant.</p>
                    <a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/projects" class="btn">See Projects</a>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - AO Modular Website</title>
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
                        <p><code>home</code>, <code>about</code>, <code>contact</code>, <code>projects</code></p>
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

-- Projects Page (accessible at /now/projects)
projects = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects - AO Modular Website</title>
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>Our Projects</h1>
                <p>Showcasing the power of AO's addressable endpoints</p>
            </div>
            
            <div class="grid">
                <div class="card">
                    <h2>&#127919; Price Tracker Agent</h2>
                    <p>Real-time cryptocurrency price tracking using CoinGecko API with enhanced market data display.</p>
                    <div class="code">
Variable: <span class="highlight">PriceData</span><br/>
Access: <code>/now/PriceData</code>
                    </div>
                    <a href="/now/PriceData" class="btn">View Live Data</a>
                </div>
                
                <div class="card">
                    <h2>&#127760; Modular Website System</h2>
                    <p>This very website! Each page and component is a separate addressable variable.</p>
                    <div class="code">
Variables: <span class="highlight">home, about, nav, footer</span><br/>
Access: <code>/now/home</code>, <code>/now/about</code>
                    </div>
                    <a href="/now/docs" class="btn">View Documentation</a>
                </div>
                
                <div class="card">
                    <h2>&#128221; Dynamic Blog System</h2>
                    <p>Blog posts stored as individual variables with automatic indexing.</p>
                    <div class="code">
Variables: <span class="highlight">blog_posts, post_1, post_2</span><br/>
Access: <code>/now/blog</code>, <code>/now/post_1</code>
                    </div>
                    <a href="/now/blog" class="btn">Read Blog</a>
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Blog Index (accessible at /now/blog)
blog = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - AO Modular Website</title>
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>Blog</h1>
                <p>Thoughts on AO, addressable endpoints, and the future of web development</p>
            </div>
            
            <div class="card">
                <h2>&#128221; Latest Posts</h2>
                
                <div style="border-left: 3px solid var(--primary); padding-left: 1rem; margin: 2rem 0;">
                    <h3><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/post_1" style="color: var(--primary); text-decoration: none;">Building Modular Websites with AO</a></h3>
                    <p style="color: var(--text-dim); margin: 0.5rem 0;">How addressable endpoints revolutionize web architecture</p>
                    <small>Published: 2025-01-28</small>
                </div>
                
                <div style="border-left: 3px solid var(--primary); padding-left: 1rem; margin: 2rem 0;">
                    <h3><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/post_2" style="color: var(--primary); text-decoration: none;">The Power of Direct Variable Access</a></h3>
                    <p style="color: var(--text-dim); margin: 0.5rem 0;">Why /now/variable_name changes everything</p>
                    <small>Published: 2025-01-27</small>
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Individual Blog Posts
post_1 = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Building Modular Websites with AO</title>
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
                
                <p><a href="/esifyCnU7dWKzFAfhQpz2UWV0Wlaa-jOMKqCXwlyHvg/now/blog" class="btn">&#8592; Back to Blog</a></p>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Contact Page (accessible at /now/contact)
contact = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - AO Modular Website</title>
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>Get In Touch</h1>
                <p>Connect with us about AO development and addressable endpoints</p>
            </div>
            
            <div class="grid">
                <div class="card">
                    <h2>&#128231; Email</h2>
                    <p>hello@ao-website.dev</p>
                </div>
                
                <div class="card">
                    <h2>&#128038; Twitter</h2>
                    <p>@ao_computer</p>
                </div>
                
                <div class="card">
                    <h2>&#128187; GitHub</h2>
                    <p>github.com/ao-org</p>
                </div>
                
                <div class="card">
                    <h2>&#127760; Process ID</h2>
                    <div class="code">]=] .. (id or "PROCESS_ID") .. [=[</div>
                    <p>This website's AO process</p>
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- API Documentation (accessible at /now/docs)
docs = [=[<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Documentation - AO Modular Website</title>
    ]=] .. styles .. [=[
</head>
<body>
    ]=] .. nav .. [=[
    
    <main>
        <div class="container">
            <div class="hero">
                <h1>API Documentation</h1>
                <p>Direct access to all website components via addressable endpoints</p>
            </div>
            
            <div class="card">
                <h2>&#128225; Base URL</h2>
                <div class="code">
https://workshop.forward.computer/]=] .. (id or "PROCESS_ID") .. [=[/now/{variable_name}
                </div>
            </div>
            
            <div class="card">
                <h2>&#127760; Available Endpoints</h2>
                
                <h3>&#128196; Pages</h3>
                <div class="code">
GET /now/home        # Homepage<br/>
GET /now/about       # About page<br/>
GET /now/projects    # Projects showcase<br/>
GET /now/blog        # Blog index<br/>
GET /now/contact     # Contact information<br/>
GET /now/docs        # This documentation
                </div>
                
                <h3>&#129513; Components</h3>
                <div class="code">
GET /now/nav         # Navigation component<br/>
GET /now/footer      # Footer component<br/>
GET /now/styles      # CSS styles
                </div>
                
                <h3>&#128202; Data</h3>
                <div class="code">
GET /now/config      # Site configuration<br/>
GET /now/PriceData   # Live price data (from agent)<br/>
GET /now/blog_posts  # Blog posts index
                </div>
                
                <h3>&#128221; Blog Posts</h3>
                <div class="code">
GET /now/post_1      # Individual blog post<br/>
GET /now/post_2      # Another blog post
                </div>
            </div>
            
            <div class="card">
                <h2>&#128295; Usage Examples</h2>
                
                <h3>Fetch Page Content</h3>
                <div class="code">
curl https://workshop.forward.computer/]=] .. (id or "PROCESS_ID") .. [=[/now/about
                </div>
                
                <h3>Get Site Configuration</h3>
                <div class="code">
curl https://workshop.forward.computer/]=] .. (id or "PROCESS_ID") .. [=[/now/config
                </div>
            </div>
        </div>
    </main>
    
    ]=] .. footer .. [=[
</body>
</html>]=]

-- Blog Posts Data (accessible at /now/blog_posts)
blog_posts = {
    {
        id = "post_1",
        title = "Building Modular Websites with AO",
        excerpt = "How addressable endpoints revolutionize web architecture",
        date = "2025-01-28",
        url = "/now/post_1"
    },
    {
        id = "post_2", 
        title = "The Power of Direct Variable Access",
        excerpt = "Why /now/variable_name changes everything",
        date = "2025-01-27",
        url = "/now/post_2"
    }
}

-- Initialize message
print("&#127760; AO Modular Website System Initialized!")
print("&#128225; Available endpoints:")
print("  &#8226; Homepage: /now/home")
print("  &#8226; About: /now/about") 
print("  &#8226; Projects: /now/projects")
print("  &#8226; Blog: /now/blog")
print("  &#8226; Contact: /now/contact")
print("  &#8226; API Docs: /now/docs")
print("  &#8226; Components: /now/nav, /now/footer, /now/styles")
print("  &#8226; Data: /now/config, /now/blog_posts")
print("&#128640; Each variable is directly accessible via HTTP!")

-- Handler to list all available endpoints
Handlers.add('GetSitemap', 'GetSitemap', function(msg)
    local sitemap = {
        pages = {
            "home", "about", "projects", "blog", "contact", "docs"
        },
        components = {
            "nav", "footer", "styles"
        },
        data = {
            "config", "blog_posts", "PriceData"
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