document.addEventListener('DOMContentLoaded', function() {
    const postsContainer = document.querySelector('.posts-container');
    
    // Load posts from localStorage or use default posts
    const posts = JSON.parse(localStorage.getItem('blogPosts')) || [
        {
            id: 1,
            title: "First Blog Post",
            content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            author: "Author 1",
            date: "2025-07-12"
        },
        {
            id: 2,
            title: "Second Blog Post",
            content: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            author: "Author 2",
            date: "2025-07-11"
        }
    ];
    
    // Save default posts to localStorage if not already saved
    if (!localStorage.getItem('blogPosts')) {
        localStorage.setItem('blogPosts', JSON.stringify(posts));
    }

    // Display posts
    posts.forEach(post => {
        const postDiv = document.createElement('div');
        postDiv.classList.add('post-card');
        postDiv.innerHTML = `
            <h4>${post.title}</h4>
            <p>${post.content.substring(0, 150)}...</p>
            <div class="post-meta">By ${post.author} on ${post.date}</div>
            <a href="#" class="read-more">Read more</a>
        `;
        postsContainer.appendChild(postDiv);
    });
});

