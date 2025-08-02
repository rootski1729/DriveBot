# PowerShell Stop Script for WhatsApp Drive Assistant

Write-Host "🛑 Stopping WhatsApp Drive Assistant..." -ForegroundColor Yellow

docker-compose down

Write-Host "✅ Services stopped successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "To start again, run: .\start.ps1"
