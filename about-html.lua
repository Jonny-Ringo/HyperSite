local json = require('json')

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