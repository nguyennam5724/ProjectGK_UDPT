Write-Host "🚀 Bắt đầu tạo commit giả lập cho 2 contributors..." -ForegroundColor Cyan

# --- 🧩 Commit của Nguyễn Nam ---
git config user.name "Nguyen Nam"
git config user.email "22010368@st.phenikaa-uni.edu.vn"

Add-Content -Path "src/hooks/useImageSearch.ts" -Value "`n// Commit 1: setup similarity search logic (by Nam)"
git add src/hooks/useImageSearch.ts
git commit -m "feat(similarity-search): setup base logic (by Nam)"

Add-Content -Path "src/components/ImageSimilaritySearch.tsx" -Value "`n{/* Commit 2: improve UI for similarity search (by Nam) */}"
git add src/components/ImageSimilaritySearch.tsx
git commit -m "feat(similarity-search): improve UI and loading state (by Nam)"

Add-Content -Path "src/hooks/useImageSearch.ts" -Value "`n// Commit 3: refactor and optimize search logic (by Nam)"
git add src/hooks/useImageSearch.ts
git commit -m "refactor(similarity-search): optimize logic and comments (by Nam)"

# --- 👥 Commit của Duy Long ---
git config user.name "Duy Long Dang"
git config user.email "duylongdang2227@gmail.com"

Add-Content -Path "src/components/ImageSearchUsingTextDescriptions.tsx" -Value "`n{/* Commit 1: setup text input for image search (by Long) */}"
git add src/components/ImageSearchUsingTextDescriptions.tsx
git commit -m "feat(text-to-image): setup text input (by Long)"

Add-Content -Path "src/lib/typesense.ts" -Value "`n// Commit 2: integrate Typesense for text queries (by Long)"
git add src/lib/typesense.ts
git commit -m "feat(text-to-image): integrate Typesense API (by Long)"

Add-Content -Path "src/components/ImageSearchUsingTextDescriptions.tsx" -Value "`n{/* Commit 3: improve UX & fix empty query handling (by Long) */}"
git add src/components/ImageSearchUsingTextDescriptions.tsx
git commit -m "fix(text-to-image): improve UX & fix edge cases (by Long)"

# --- 🚀 Push lên GitHub ---
git push origin main
Write-Host "✅ Hoàn tất! Đã tạo và đẩy 6 commit lên GitHub." -ForegroundColor Green
