# PowerShell Start Script for WhatsApp Drive Assistant

Write-Host "🚀 Starting WhatsApp Drive Assistant..." -ForegroundColor Green

# Check if .env exists
if (-not (Test-Path ".env")) {
    Write-Host "❌ .env file not found!" -ForegroundColor Red
    Write-Host "Please run .\setup.ps1 first"
    exit 1
}

# Check if Docker is running
try {
    docker info 2>$null | Out-Null
} catch {
    Write-Host "❌ Docker is not running!" -ForegroundColor Red
    Write-Host "Please start Docker Desktop and try again"
    exit 1
}

Write-Host "📦 Building and starting containers..." -ForegroundColor Yellow

# Start with docker-compose
docker-compose up -d

Write-Host "⏳ Waiting for n8n to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check if n8n is healthy
$attempts = 0
$maxAttempts = 30
$isHealthy = $false

while ($attempts -lt $maxAttempts -and -not $isHealthy) {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:5678/healthz" -TimeoutSec 2 -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            Write-Host "✅ n8n is running!" -ForegroundColor Green
            $isHealthy = $true
        }
    } catch {
        $attempts++
        Write-Host "Waiting for n8n... ($attempts/$maxAttempts)"
        Start-Sleep -Seconds 2
    }
}

if (-not $isHealthy) {
    Write-Host "❌ n8n failed to start properly" -ForegroundColor Red
    Write-Host "Check logs with: docker-compose logs"
    exit 1
}

Write-Host ""
Write-Host "🎉 WhatsApp Drive Assistant is ready!" -ForegroundColor Green
Write-Host ""
Write-Host "📱 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open http://localhost:5678 in your browser"
Write-Host "2. Import the workflow.json file"
Write-Host "3. Configure credentials in n8n:"
Write-Host "   - Twilio credentials"
Write-Host "   - Google Drive OAuth2"
Write-Host "   - Google Sheets"
Write-Host "   - Cohere AI API"
Write-Host "4. Activate the workflow"
Write-Host "5. Set webhook URL in Twilio console to:"
Write-Host "   http://localhost:5678/webhook/whatsapp"
Write-Host ""
Write-Host "📝 Test Commands:" -ForegroundColor Green
Write-Host "Send these to your WhatsApp sandbox number:"
Write-Host "• HELP"
Write-Host "• LIST Documents"
Write-Host "• SUMMARY ProjectX"
Write-Host ""
Write-Host "📊 Monitor logs:" -ForegroundColor Yellow
Write-Host "docker-compose logs -f"
Write-Host ""
Write-Host "🛑 Stop service:" -ForegroundColor Yellow
Write-Host ".\stop.ps1"
