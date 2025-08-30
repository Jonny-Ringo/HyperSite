local json = require('json')

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