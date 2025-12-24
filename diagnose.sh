#!/bin/bash
# Diagnostikscript för att kontrollera om cookie-autentisering finns

echo "=========================================="
echo "SVTPlay-dl Web GUI - Diagnostik"
echo "=========================================="
echo ""

# Kontrollera aktuell branch
echo "1. Kontrollerar din branch..."
git branch --show-current
echo ""

# Kontrollera senaste commit
echo "2. Senaste commit på din lokala maskin:"
git log --oneline -1
echo ""

# Kontrollera om det finns nya commits på remote
echo "3. Hämtar information från remote..."
git fetch origin
echo ""

echo "4. Commits på remote som du inte har lokalt:"
git log HEAD..origin/$(git branch --show-current) --oneline
echo ""

# Kontrollera om cookie-sektionen finns i HTML
echo "5. Kontrollerar om cookie-autentisering finns i templates/index.html..."
if grep -q "cookieCard" templates/index.html; then
    echo "✅ Cookie-autentisering FINNS i din lokala kod"
else
    echo "❌ Cookie-autentisering SAKNAS i din lokala kod"
    echo "   Du behöver köra: git pull origin $(git branch --show-current)"
fi
echo ""

echo "=========================================="
echo "Rekommenderad åtgärd:"
echo "=========================================="
echo "1. Stoppa servern (Ctrl+C)"
echo "2. Kör: git pull origin $(git branch --show-current)"
echo "3. Kör: start.bat"
echo "4. Öppna webbläsaren och tryck Ctrl+F5"
echo ""
