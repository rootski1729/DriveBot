# PowerShell Stop Script for WhatsApp Drive Assistant

Write-Host "Stopping WhatsApp Drive Assistant..."

docker-compose down

Write-Host "Services stopped successfully!"
Write-Host ""
Write-Host "To start again, run: .\start.ps1"
