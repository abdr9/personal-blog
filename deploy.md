# Deployment Instructions

## Step 1: Create GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click "New" to create a new repository
3. Name it "personal-blog" or any name you prefer
4. Make it public (required for free GitHub Pages)
5. Don't initialize with README (we already have files)

## Step 2: Connect Local Repository to GitHub

Run these commands in your terminal (from the blog directory):

```bash
git remote add origin https://github.com/YOUR_USERNAME/personal-blog.git
git branch -M main
git push -u origin main
```

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click on "Settings" tab
3. Scroll down to "Pages" section
4. Under "Source", select "Deploy from a branch"
5. Choose "main" branch and "/ (root)" folder
6. Click "Save"

## Step 4: Get Free Domain (Optional)

1. Go to [Freenom.com](https://www.freenom.com)
2. Search for "abdullahblog" or your preferred name
3. Select a free domain (.tk, .ml, .ga, .cf)
4. Register the domain (free for 12 months)
5. Go to domain management and add these DNS records:
   - Type: CNAME
   - Name: www
   - Target: YOUR_USERNAME.github.io
   - Type: A
   - Name: @
   - Target: 185.199.108.153
   - Type: A
   - Name: @
   - Target: 185.199.109.153
   - Type: A
   - Name: @
   - Target: 185.199.110.153
   - Type: A
   - Name: @
   - Target: 185.199.111.153

## Step 5: Configure Custom Domain in GitHub

1. Go to your repository Settings > Pages
2. Under "Custom domain", enter your domain (e.g., abdullahblog.tk)
3. Click "Save"
4. Wait for DNS check to complete

## Your Website Will Be Live At:

- GitHub Pages URL: https://YOUR_USERNAME.github.io/personal-blog/
- Custom Domain: https://abdullahblog.tk (if configured)

## Features of Your Blog:

✅ Responsive design
✅ Admin panel (login: admin/admin)
✅ Contact form
✅ SEO optimized
✅ 404 error page
✅ Local storage for posts
✅ Modern UI/UX

## Admin Access:
- Username: admin
- Password: admin

## Adding New Posts:
1. Go to /admin.html
2. Login with admin credentials
3. Use the "Add New Post" form
4. Posts are saved in browser's local storage

## Support:
If you need help, check the README.md file or create an issue on GitHub.

