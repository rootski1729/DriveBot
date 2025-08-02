# PowerShell Setup Script for WhatsApp Drive Assistant
# Run this script in PowerShell as Administrator

Write-Host "🚀 WhatsApp Drive Assistant Setup (Windows)" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green

# Check if .env exists
if (-not (Test-Path ".env")) {
    Write-Host "Creating .env file from template..." -ForegroundColor Yellow
    Copy-Item ".env.sample" ".env"
    Write-Host "✓ .env file created" -ForegroundColor Green
} else {
    Write-Host "ℹ .env file already exists" -ForegroundColor Blue
}

Write-Host ""
Write-Host "📋 Setup Checklist:" -ForegroundColor Blue
Write-Host ""

Write-Host "1. Twilio WhatsApp Setup:" -ForegroundColor Yellow
Write-Host "   - Go to https://console.twilio.com/"
Write-Host "   - Create account or login"
Write-Host "   - Go to Develop > Messaging > Try it out > Send a WhatsApp message"
Write-Host "   - Join sandbox: Send 'join <sandbox-keyword>' to +1 415 523 8886"
Write-Host "   - Get Account SID and Auth Token from Console Dashboard"
Write-Host "   - Update TWILIO_ACCOUNT_SID and TWILIO_AUTH_TOKEN in .env"
Write-Host ""

Write-Host "2. Google Drive API Setup:" -ForegroundColor Yellow
Write-Host "   - Go to https://console.developers.google.com/"
Write-Host "   - Create new project or select existing"
Write-Host "   - Enable Google Drive API"
Write-Host "   - Create OAuth 2.0 credentials"
Write-Host "   - Add authorized redirect URI: http://localhost:5678/rest/oauth2-credential/callback"
Write-Host "   - Download credentials JSON"
Write-Host "   - Update GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET in .env"
Write-Host ""

Write-Host "3. Google Sheets for Audit Log:" -ForegroundColor Yellow
Write-Host "   - Create a new Google Sheet"
Write-Host "   - Add headers: timestamp, from, command, path, response, messageId"
Write-Host "   - Get the Spreadsheet ID from URL"
Write-Host "   - Update GOOGLE_SHEETS_SPREADSHEET_ID in .env"
Write-Host ""

Write-Host "4. Cohere AI Setup (Free):" -ForegroundColor Yellow
Write-Host "   - Go to https://cohere.ai/"
Write-Host "   - Sign up for free account (includes free tier)"
Write-Host "   - Go to API Keys section"
Write-Host "   - Create new API key"
Write-Host "   - Update COHERE_API_KEY in .env"
Write-Host ""

Write-Host "5. Run the application:" -ForegroundColor Yellow
Write-Host "   .\start.ps1"
Write-Host ""

Write-Host "📝 Quick Command Reference:" -ForegroundColor Green
Write-Host "   LIST ProjectX        - List files in ProjectX folder"
Write-Host "   DELETE file.pdf      - Delete a specific file"
Write-Host "   MOVE source dest     - Move file from source to dest"
Write-Host "   SUMMARY ProjectX     - AI summary of docs in ProjectX"
Write-Host "   HELP                 - Show help message"
Write-Host ""

Read-Host "Press Enter to continue after completing the setup..."

Write-Host "✅ Setup guide completed!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Blue
Write-Host "1. Edit .env file with your credentials"
Write-Host "2. Run: .\start.ps1"
Write-Host "3. Import workflow.json into n8n"
Write-Host "4. Test with WhatsApp!"
