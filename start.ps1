# PowerShell Start Script for WhatsApp Drive Assistant

Write-Host "Starting WhatsApp Drive Assistant..."

# Check if .env exists
if (-not (Test-Path ".env")) {
    Write-Host ".env file not found!"
    Write-Host "Please run .\setup.ps1 first"
    exit 1
}

# Check if Docker is running
try {
    docker info 2>$null | Out-Null
} catch {
    Write-Host "Docker is not running!"
    Write-Host "Please start Docker Desktop and try again"
    exit 1
}

Write-Host "Building and starting containers..."

# Start with docker-compose
docker-compose up -d

Write-Host "Waiting for n8n to start..."
Start-Sleep -Seconds 10

# Check if n8n is healthy
$attempts = 0
$maxAttempts = 30
$isHealthy = $false

while ($attempts -lt $maxAttempts -and -not $isHealthy) {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:5678/healthz" -TimeoutSec 2 -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            Write-Host "n8n is running!"
            $isHealthy = $true
        }
    } catch {
        $attempts++
        Write-Host "Waiting for n8n... ($attempts/$maxAttempts)"
        Start-Sleep -Seconds 2
    }
}

if (-not $isHealthy) {
    Write-Host "n8n failed to start properly"
    Write-Host "Check logs with: docker-compose logs"
    exit 1
}

Write-Host ""
Write-Host "WhatsApp Drive Assistant is ready!"
Write-Host ""
Write-Host "Next Steps:"
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
Write-Host "Test Commands:"
Write-Host "Send these to your WhatsApp sandbox number:"
Write-Host "• HELP"
Write-Host "• LIST Documents"
Write-Host "• SUMMARY ProjectX"
Write-Host ""
Write-Host "Monitor logs:"
Write-Host "docker-compose logs -f"
Write-Host ""
Write-Host "Stop service:"
Write-Host ".\stop.ps1"
