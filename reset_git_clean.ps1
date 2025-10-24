# ==============================
# reset_git_clean.ps1
# Script: Làm sạch lịch sử Git và tạo commit mới từ đầu
# Author: Nam
# ==============================

Write-Host "🧹 Xóa thư mục .git cũ..."
if (Test-Path ".git") {
    Remove-Item -Recurse -Force .git
    Write-Host "✅ Đã xóa .git cũ"
} else {
    Write-Host "⚠️ Không tìm thấy .git, bỏ qua bước xóa"
}

# Khởi tạo lại git
Write-Host "🚀 Khởi tạo lại Git..."
git init

# Cấu hình thông tin cho Nam
git config user.name "Nguyen Nam"
git config user.email "22010368@st.phenikaa-uni.edu.vn"

# Thêm tất cả file
git add .

# Commit đầu tiên
git commit -m "Initial commit: setup base project structure"

# Gắn remote (chỉnh lại nếu bạn dùng HTTPS)
$remoteUrl = "git@github-nam:nguyennam5724/showcase-ai-typesense.git"

git remote add origin $remoteUrl

# Đặt nhánh chính là main
git branch -M main

# Push commit đầu tiên, ghi đè toàn bộ lịch sử cũ nếu có
Write-Host "⬆️ Đang push lên GitHub..."
git push -u origin main --force

Write-Host "✅ Hoàn tất reset và push repo mới!"
