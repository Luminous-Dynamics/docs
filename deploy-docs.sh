#!/usr/bin/env bash
# Deploy Luminous Dynamics Documentation

echo "================================================"
echo "  DEPLOYING DOCUMENTATION TO GITHUB PAGES"
echo "================================================"

# Check if we're in the right directory
if [ ! -f "mkdocs.yml" ]; then
    echo "❌ Error: mkdocs.yml not found. Run from docs-site directory."
    exit 1
fi

# Install dependencies if needed
echo "📦 Checking dependencies..."
pip show mkdocs-material > /dev/null 2>&1 || {
    echo "Installing MkDocs Material..."
    pip install mkdocs-material mkdocs-minify-plugin pillow cairosvg
}

# Build the documentation
echo "🔨 Building documentation..."
mkdocs build --clean

# Initialize git repo if needed
if [ ! -d ".git" ]; then
    echo "📝 Initializing git repository..."
    git init
    git remote add origin https://github.com/Luminous-Dynamics/docs.git
fi

# Create gh-pages branch if it doesn't exist
git checkout -b gh-pages 2>/dev/null || git checkout gh-pages

# Add built files
echo "📤 Preparing deployment..."
cp -r site/* .
git add -A
git commit -m "Deploy documentation - $(date +%Y-%m-%d)"

# Push to GitHub
echo "🚀 Deploying to GitHub Pages..."
git push -u origin gh-pages --force

echo ""
echo "✅ Documentation deployed!"
echo "🌐 View at: https://docs.luminousdynamics.org"
echo ""
echo "Note: It may take a few minutes for changes to appear."