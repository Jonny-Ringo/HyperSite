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
                
                <p><a href="/]=] .. id .. [=[/now/chat" class="btn">&#8592; Back to Discussion</a></p>
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