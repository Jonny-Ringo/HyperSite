local json = require('json')

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