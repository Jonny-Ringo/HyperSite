-- HyperSite System
-- Each variable becomes an addressable endpoint at /now/{variable_name}
-- Example: https://workshop.forward.computer/{process-id}/now/page
--          https://workshop.forward.computer/{process-id}/now/about
--          https://workshop.forward.computer/{process-id}/now/nav

local json = require('json')

-- Basic variable definitions (updated by other files when loaded)
styles = styles or ""
nav = nav or ""
footer = footer or ""

-- Website Configuration
config = {
    site_name = "HyperSite",
    site_description = "Revolutionary website built on AO addressable endpoints",
    base_url = "https://workshop.forward.computer/" .. (id) .. "/now",
    theme_color = "#00ff88",
    owner = "JOnny Ringo",
    social = {
        twitter = "@ao_computer",
        github = "https://github.com/Jonny-Ringo/HyperSite"
    }
}

-- Meta Tags Function (creates comprehensive meta tags for any page)
function create_meta(title, description, image_url, page_path)
    local full_url = config.base_url .. "/" .. page_path
    local meta_image = image_url or og_image
    
    return [=[
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>]=] .. title .. [=[</title>
    <meta name="description" content="]=] .. description .. [=[">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>&#127752;</text></svg>">
    
    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="]=] .. full_url .. [=[">
    <meta property="og:title" content="]=] .. title .. [=[">
    <meta property="og:description" content="]=] .. description .. [=[">
    <meta property="og:image" content="]=] .. meta_image .. [=[">
    <meta property="og:site_name" content="]=] .. config.site_name .. [=[">
    
    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="]=] .. full_url .. [=[">
    <meta property="twitter:title" content="]=] .. title .. [=[">
    <meta property="twitter:description" content="]=] .. description .. [=[">
    <meta property="twitter:image" content="]=] .. meta_image .. [=[">
    <meta property="twitter:creator" content="]=] .. config.social.twitter .. [=[">
    
    <!-- Additional SEO -->
    <meta name="author" content="]=] .. config.owner .. [=[">
    <meta name="theme-color" content="]=] .. config.theme_color .. [=[">
    <link rel="canonical" href="]=] .. full_url .. [=[">
    ]=]
end

-- Open Graph Image (accessible at /now/og_image)
og_image = "https://arweave.net/R8StYmJlAaDdHU0dNcjtoaAYURX_cjsiY2pNaVdcmGg"


-- Navigation Component (accessible at /now/nav)
nav = [=[
<nav>
    <div class="container">
        <div class="nav-container">
            <a href="/]=] .. id .. [=[/now/home" class="logo">AO HyperSite</a>
            <ul class="nav-links">
                <li><a href="/]=] .. id .. [=[/now/home">Home</a></li>
                <li><a href="/]=] .. id .. [=[/now/about">About</a></li>
                <li><a href="/]=] .. id .. [=[/now/template">Template</a></li>
                <li><a href="/]=] .. id .. [=[/now/chat">Discussion</a></li>
            </ul>
        </div>
    </div>
</nav>
]=]

-- Footer Component (accessible at /now/footer)
footer = [=[
<footer>
    <div class="container">
        <p>2025 HyperSite. Built with revolutionary addressable endpoints.</p>
        <p>Each page is a separate variable accessible at <code>/now/{page_name}</code></p>
        <p style="margin-top: 1rem;">
            <a href="https://github.com/Jonny-Ringo/HyperSite" target="_blank" style="color: var(--primary); text-decoration: none; margin-right: 1rem; font-size: 1.2rem;" title="GitHub Repository">&#128187; GitHub</a>
            <a href="https://x.com/jonnyringo711" target="_blank" style="color: var(--primary); text-decoration: none; font-size: 1.2rem;" title="Follow on X">&#128038; @jonnyringo711</a>
        </p>
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
                    <h2>&#129518; Modular Architecture</h2>
                    <p>Every component is a separate variable accessible at unique endpoints.</p>
                    <a href="/]=] .. id .. [=[/now/about" class="btn">Learn More</a>
                </div>
                
                <div class="card">
                    <h2>&#128640; Direct Access</h2>
                    <p>Access any page directly: <code>/now/home</code>, <code>/now/about</code>, <code>/now/chat</code></p>
                    <a href="/]=] .. id .. [=[/now/template" class="btn">Use Template</a>
                </div>
                
                <div class="card">
                    <h2>&#127760; No More Servers</h2>
                    <p>Built-in data hosting and management - no external databases or hosting required.</p>
                    <a href="/]=] .. id .. [=[/now/chat" class="btn">Join Discussion</a>
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
    
    -- Back to working method with URL parameters
    local author = msg.author or tags.author or msg.From or "Anonymous"
    local content = msg.comment or tags.comment or msg.Data or ""
    local browserTimestamp = tonumber(msg.timestamp) or os.time() * 1000
    
    -- Ensure comments_table exists
    if not comments_table then
        comments_table = {}
    end
    
    -- Function to clean existing duplicates
    local function removeDuplicates()
        local cleaned = {}
        local seen = {}
        
        for i, comment in ipairs(comments_table) do
            local key = comment.author .. "|" .. comment.content
            local commentTime = comment.timestamp / 1000
            
            -- Check if we've seen this author+content combo recently
            local isDuplicate = false
            if seen[key] then
                local timeDiff = math.abs(commentTime - seen[key].time)
                if timeDiff < 30 then
                    isDuplicate = true
                    print("Removing existing duplicate comment from: " .. comment.author)
                end
            end
            
            if not isDuplicate then
                table.insert(cleaned, comment)
                seen[key] = {time = commentTime, index = #cleaned}
            end
        end
        
        comments_table = cleaned
        -- Update the JSON endpoint
        comments = json.encode(comments_table)
    end
    
    -- Clean existing duplicates first
    removeDuplicates()
    
    -- Check for duplicates against cleaned table (prevent new duplicate)
    for i, existing in ipairs(comments_table) do
        if existing.author == author and existing.content == content then
            local time_diff = math.abs((browserTimestamp / 1000) - (existing.timestamp / 1000))
            if time_diff < 30 then
                print("Duplicate comment detected within 30 seconds - ignoring")
                send({
                    target = msg.From,
                    data = json.encode({
                        status = "duplicate",
                        message = "Duplicate comment detected - not added"
                    })
                })
                return
            end
        end
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

-- Dynamic Blog Post Comments Handler
Handlers.add('AddPostComment', 'add-post-comment', function(msg)
    print("=== BLOG POST COMMENT DEBUG ===")
    print("msg.Tags:", json.encode(msg.Tags or {}))
    
    local timestamp = tostring(os.time())
    local tags = msg.Tags or {}
    
    -- Parse comment data
    local author = msg.author or tags.author or msg.From or "Anonymous"
    local content = msg.comment or tags.comment or msg.Data or ""
    local browserTimestamp = tonumber(msg.timestamp) or os.time() * 1000
    local post_id = msg.post_id or tags.post_id or "post_1" -- Default to post_1
    
    -- Dynamic table names
    local comments_table_name = post_id .. "_comments_table"
    local comments_json_name = post_id .. "_comments"
    
    -- Initialize the comments table for this post if it doesn't exist
    if not _G[comments_table_name] then
        _G[comments_table_name] = {}
    end
    
    -- Function to clean existing duplicates for this specific post
    local function removeDuplicates()
        local cleaned = {}
        local seen = {}
        local comments_table = _G[comments_table_name]
        
        for i, comment in ipairs(comments_table) do
            local key = comment.author .. "|" .. comment.content
            local commentTime = comment.timestamp / 1000
            
            local isDuplicate = false
            if seen[key] then
                local timeDiff = math.abs(commentTime - seen[key].time)
                if timeDiff < 30 then
                    isDuplicate = true
                    print("Removing duplicate comment from " .. post_id .. ": " .. comment.author)
                end
            end
            
            if not isDuplicate then
                table.insert(cleaned, comment)
                seen[key] = {time = commentTime, index = #cleaned}
            end
        end
        
        _G[comments_table_name] = cleaned
        _G[comments_json_name] = json.encode(cleaned)
    end
    
    -- Clean existing duplicates first
    removeDuplicates()
    
    local comments_table = _G[comments_table_name]
    
    -- Check for duplicates
    for i, existing in ipairs(comments_table) do
        if existing.author == author and existing.content == content then
            local time_diff = math.abs((browserTimestamp / 1000) - (existing.timestamp / 1000))
            if time_diff < 30 then
                print("Duplicate " .. post_id .. " comment detected - ignoring")
                send({
                    target = msg.From,
                    data = json.encode({
                        status = "duplicate",
                        message = "Duplicate comment detected - not added"
                    })
                })
                return
            end
        end
    end
    
    local comment = {
        id = #comments_table + 1,
        author = author,
        content = content,
        timestamp = browserTimestamp,
        serverTimestamp = timestamp,
        date = os.date("%Y-%m-%d %H:%M", math.floor(browserTimestamp / 1000))
    }
    
    -- Add comment to the specific post's table
    table.insert(_G[comments_table_name], comment)
    
    -- Update the JSON endpoint for this post
    _G[comments_json_name] = json.encode(_G[comments_table_name])
    
    -- Send confirmation
    send({
        target = msg.From,
        data = json.encode({
            status = "success",
            message = "Comment added to " .. post_id .. " successfully!",
            comment = comment
        })
    })
    
    print("New comment added to " .. post_id .. " by " .. comment.author .. ": " .. comment.content)
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