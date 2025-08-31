local json = require('json')

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
                    <h3><a href="/]=] .. id .. [=[/now/post_1" style="color: var(--primary); text-decoration: none;">Building Modular Websites with AO</a></h3>
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
                        <textarea id="comment" name="comment" rows="4" required maxlength="440"
                                  style="width: 100%; padding: 0.75rem; border: 1px solid var(--border); border-radius: 8px; background: var(--bg-dark); color: var(--text); font-family: inherit; resize: vertical;"></textarea>
                        <div id="charCounter" style="font-size: 0.8rem; color: var(--text-dim); margin-top: 0.25rem; text-align: right;">
                            0 / 440 characters
                        </div>
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
                // Back to original working method - let's optimize URL length differently
                const timestamp = Date.now();
                
                // No truncation - let's find the exact limit
                let processedComment = comment;
                
                const url = `${baseUrl}/push&action=add-comment&author=${encodeURIComponent(author)}&comment=${encodeURIComponent(processedComment)}&timestamp=${timestamp}&!`;
                console.log('Posting to:', url);
                console.log('Original comment length:', comment.length, 'Processed length:', processedComment.length);
                
                const response = await fetch(url, {
                    method: 'GET'
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
        
        // Character counter for comment field
        const commentField = document.getElementById('comment');
        const charCounter = document.getElementById('charCounter');
        const maxLength = 440;
        
        commentField.addEventListener('input', function() {
            const length = this.value.length;
            const remaining = maxLength - length;
            
            if (remaining < 50) {
                charCounter.style.color = '#ff4444';
            } else if (remaining < 100) {
                charCounter.style.color = '#ffaa00';
            } else {
                charCounter.style.color = 'var(--text-dim)';
            }
            
            charCounter.textContent = `${length} / ${maxLength} characters`;
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
                <p style="color: var(--text-dim); margin-bottom: 2rem;">Published: August 30, 2025</p>
                
                <p>AO's addressable endpoints feature represents a paradigm shift from traditional web architecture. Instead of files, servers, and complex deployment pipelines, we can build truly modular systems where each component is a separate variable that becomes instantly accessible via HTTP.</p>
                
                <h2>The Death of Traditional Web Architecture</h2>
                <p>For decades, we've been trapped in a cycle of increasing complexity:</p>
                <ul style="margin: 1rem 0; padding-left: 2rem; color: var(--text-dim);">
                    <li>Static files &#8594; Dynamic pages &#8594; Single Page Apps &#8594; Micro-frontends</li>
                    <li>Simple servers &#8594; Load balancers &#8594; CDNs &#8594; Edge computing</li>
                    <li>FTP uploads &#8594; Git deployments &#8594; CI/CD pipelines &#8594; Serverless functions</li>
                </ul>
                <p>What if we could skip all of this complexity and go directly from <em>idea</em> to <em>live endpoint</em>?</p>
                
                <h2>The Revolutionary Approach</h2>
                <p>With AO's addressable endpoints, every Lua variable automatically becomes a web endpoint. Here's how this site works:</p>
                
                <div class="code">
-- This variable IS the homepage<br/>
home = [[ &lt;!DOCTYPE html&gt;...&lt;/html&gt; ]]<br/>
<br/>
-- Instantly accessible at:<br/>
-- https://workshop.forward.computer/{process-id}/now/home<br/>
<br/>
-- Want to update it? Just reassign:<br/>
home = [[ &lt;h1&gt;Updated!&lt;/h1&gt; ]]<br/>
-- Changes are live immediately - no deployment, no build, no downtime
                </div>
                
                <h2>Real-World Architecture</h2>
                <p>This HyperSite demonstrates several architectural patterns:</p>
                
                <div class="grid" style="margin: 2rem 0;">
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#128196; Modular Pages</h3>
                        <div class="code" style="font-size: 0.8rem;">
home = create_page("Home", content)<br/>
about = create_page("About", content)<br/>
chat = create_page("Chat", content)
                        </div>
                    </div>
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#129513; Reusable Components</h3>
                        <div class="code" style="font-size: 0.8rem;">
nav = [[ &lt;nav&gt;...&lt;/nav&gt; ]]<br/>
footer = [[ &lt;footer&gt;...&lt;/footer&gt; ]]<br/>
styles = [[ &lt;style&gt;...&lt;/style&gt; ]]
                        </div>
                    </div>
                    <div class="card" style="background: rgba(0, 255, 136, 0.05);">
                        <h3>&#128190; Built-in Data Layer</h3>
                        <div class="code" style="font-size: 0.8rem;">
comments = json.encode(comments_table)<br/>
config = {site_name = "HyperSite"}<br/>
-- No external database needed!
                        </div>
                    </div>
                </div>
                
                <h2>The Technical Breakthrough</h2>
                <p>Traditional websites require multiple systems working together:</p>
                <div style="background: rgba(255, 0, 0, 0.1); border-left: 3px solid #ff4444; padding: 1rem; margin: 1rem 0;">
                    <strong>Old Way:</strong> HTML Files + Web Server + Database + CDN + DNS + SSL Certificates + Deployment Pipeline + Monitoring...
                </div>
                
                <div style="background: rgba(0, 255, 136, 0.1); border-left: 3px solid var(--primary); padding: 1rem; margin: 1rem 0;">
                    <strong>New Way:</strong> Just Lua variables. That's it.
                </div>
                
                <h2>Beyond Static: Dynamic Endpoints</h2>
                <p>Variables can be more than static content. They can be functions, data structures, or computed values:</p>
                
                <div class="code">
-- Dynamic API endpoint<br/>
api_stats = json.encode({<br/>
&nbsp;&nbsp;comments_count = #comments_table,<br/>
&nbsp;&nbsp;last_updated = "Updated via message handlers",<br/>
&nbsp;&nbsp;version = "1.0"<br/>
})<br/>
<br/>
-- Real-time data feed (updated by handlers)<br/>
live_comments = json.encode({<br/>
&nbsp;&nbsp;recent = "Last 5 comments via comments endpoint",<br/>
&nbsp;&nbsp;endpoint = "/now/comments"<br/>
})<br/>
<br/>
-- Handler updates variables in real-time<br/>
Handlers.add('UpdateStats', 'update-stats', function(msg)<br/>
&nbsp;&nbsp;api_stats = json.encode({<br/>
&nbsp;&nbsp;&nbsp;&nbsp;comments_count = #comments_table,<br/>
&nbsp;&nbsp;&nbsp;&nbsp;timestamp = msg.Timestamp,<br/>
&nbsp;&nbsp;&nbsp;&nbsp;version = "1.0"<br/>
&nbsp;&nbsp;})<br/>
end)
                </div>
                
                <h2>Why This Matters</h2>
                <ul style="margin: 1rem 0; padding-left: 2rem; line-height: 1.8;">
                    <li><strong>Zero Infrastructure:</strong> No servers to maintain, scale, or secure</li>
                    <li><strong>Instant Updates:</strong> Change a variable, update the website - no deployment lag</li>
                    <li><strong>Perfect Modularity:</strong> Each component has its own URL and can be developed independently</li>
                    <li><strong>Built-in Persistence:</strong> All data is stored on-chain automatically</li>
                    <li><strong>Composable Architecture:</strong> Mix and match components like LEGO blocks</li>
                    <li><strong>Version Control:</strong> Every change is cryptographically signed and timestamped</li>
                </ul>
                
                <h2>The Future of Web Development</h2>
                <p>We're not just building websites differently - we're fundamentally reimagining what the web can be. When every variable becomes addressable, the boundary between code and content, between backend and frontend, disappears.</p>
                
                <p>This is just the beginning. Imagine:</p>
                <ul style="margin: 1rem 0; padding-left: 2rem; color: var(--primary); line-height: 1.8;">
                    <li>Multi-process websites that span multiple AO nodes</li>
                    <li>Real-time collaborative editing of live websites</li>
                    <li>Programmable content that adapts based on who's viewing it</li>
                    <li>Websites that evolve and improve themselves autonomously</li>
                </ul>
                
                <p style="margin-top: 2rem; font-style: italic; color: var(--text-dim);">The web isn't broken - it's just been waiting for the right architecture. Welcome to the HyperSite era.</p>
                
                <!-- Comments Section for this Blog Post -->
                <div style="border-top: 2px solid var(--border); margin-top: 3rem; padding-top: 2rem;">
                    <h2>&#128172; Comments on This Post</h2>
                    <div id="post-comments-list">
                        <!-- Comments will be loaded here -->
                    </div>
                    
                    <h3 style="margin-top: 2rem; color: var(--primary);">Leave a Comment</h3>
                    <form id="postCommentForm" style="margin-top: 1rem;">
                        <div style="margin-bottom: 1rem;">
                            <label for="post-author" style="display: block; margin-bottom: 0.5rem; color: var(--text);">Name:</label>
                            <input type="text" id="post-author" name="author" required 
                                   style="width: 100%; padding: 0.75rem; border: 1px solid var(--border); border-radius: 8px; background: var(--bg-dark); color: var(--text); font-family: inherit;">
                        </div>
                        <div style="margin-bottom: 1rem;">
                            <label for="post-comment" style="display: block; margin-bottom: 0.5rem; color: var(--text);">Comment:</label>
                            <textarea id="post-comment" name="comment" rows="4" required maxlength="440"
                                      style="width: 100%; padding: 0.75rem; border: 1px solid var(--border); border-radius: 8px; background: var(--bg-dark); color: var(--text); font-family: inherit; resize: vertical;"></textarea>
                            <div id="postCharCounter" style="font-size: 0.8rem; color: var(--text-dim); margin-top: 0.25rem; text-align: right;">
                                0 / 440 characters
                            </div>
                        </div>
                        <button type="submit" class="btn">Post Comment</button>
                    </form>
                </div>
                
                <p style="margin-top: 2rem;"><a href="/]=] .. id .. [=[/now/chat" class="btn">&#8592; Back to Discussion</a></p>
            </div>
        </div>
    </main>
    
    <script>
        const processId = window.location.pathname.split('/')[1];
        const baseUrl = `/${processId}`;
        
        // Load blog post comments
        async function loadPostComments() {
            try {
                const response = await fetch(`${baseUrl}/now/post_1_comments`);
                const comments = await response.json();
                const commentsList = document.getElementById('post-comments-list');
                
                if (comments.length === 0) {
                    commentsList.innerHTML = '<p style="color: var(--text-dim); font-style: italic;">No comments yet. Be the first to comment on this post!</p>';
                    return;
                }
                
                // Sort comments by timestamp (newest first)
                const sortedComments = comments.sort((a, b) => {
                    const aTime = a.timestamp || new Date(a.date).getTime();
                    const bTime = b.timestamp || new Date(b.date).getTime();
                    return bTime - aTime;
                });
                
                commentsList.innerHTML = `
                    <h3 style="color: var(--primary); margin-bottom: 1rem;">Comments (${sortedComments.length})</h3>
                    ${sortedComments.map(comment => `
                        <div style="border-left: 3px solid var(--primary); padding: 1rem; margin: 1.5rem 0; background: rgba(0, 255, 136, 0.05); border-radius: 8px;">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem;">
                                <strong style="color: var(--primary);">@${comment.author}</strong>
                                <small style="color: var(--text-dim);">
                                    ${comment.timestamp ? new Date(comment.timestamp).toLocaleString() : comment.date}
                                </small>
                            </div>
                            <p style="margin: 0; line-height: 1.6; color: var(--text);">${comment.content}</p>
                        </div>
                    `).join('')}
                `;
            } catch (error) {
                console.error('Error loading post comments:', error);
            }
        }
        
        // Handle blog post comment form submission
        document.getElementById('postCommentForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const author = document.getElementById('post-author').value;
            const comment = document.getElementById('post-comment').value;
            
            try {
                const url = `${baseUrl}/push&action=add-post-comment&post_id=post_1&author=${encodeURIComponent(author)}&comment=${encodeURIComponent(comment)}&timestamp=${Date.now()}&!`;
                console.log('Posting to:', url);
                
                const response = await fetch(url, {
                    method: 'GET'
                });
                
                if (response.ok) {
                    document.getElementById('postCommentForm').reset();
                    document.getElementById('postCharCounter').textContent = '0 / 440 characters';
                    document.getElementById('postCharCounter').style.color = 'var(--text-dim)';
                    setTimeout(loadPostComments, 1000);
                    alert('Comment posted successfully!');
                } else {
                    alert('Error posting comment. Please try again.');
                }
            } catch (error) {
                console.error('Error posting comment:', error);
                alert('Error posting comment. Please try again.');
            }
        });
        
        // Character counter for blog post comment field
        const postCommentField = document.getElementById('post-comment');
        const postCharCounter = document.getElementById('postCharCounter');
        const maxLength = 440;
        
        postCommentField.addEventListener('input', function() {
            const length = this.value.length;
            const remaining = maxLength - length;
            
            if (remaining < 50) {
                postCharCounter.style.color = '#ff4444';
            } else if (remaining < 100) {
                postCharCounter.style.color = '#ffaa00';
            } else {
                postCharCounter.style.color = 'var(--text-dim)';
            }
            
            postCharCounter.textContent = `${length} / ${maxLength} characters`;
        });
        
        // Load comments on page load
        loadPostComments();
    </script>
    
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

-- Blog post comments storage
post_1_comments_table = post_1_comments_table or {}

-- JSON endpoint for blog post comments (accessible at /now/post_1_comments)
post_1_comments = json.encode(post_1_comments_table)

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