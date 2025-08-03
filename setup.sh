#!/bin/bash

set -e

echo "WhatsApp Drive Assistant Setup"
echo "=================================="

# Check if .env exists
if [ ! -f .env ]; then
    echo "Creating .env file from template..."
    cp .env.sample .env
    echo ".env file created"
else
    echo ".env file already exists"
fi

echo ""
echo "Setup Checklist:"
echo ""

echo "1. Twilio WhatsApp Setup:"
echo "   - Go to https://console.twilio.com/"
echo "   - Create account or login"
echo "   - Go to Develop > Messaging > Try it out > Send a WhatsApp message"
echo "   - Join sandbox: Send 'join <sandbox-keyword>' to +1 415 523 8886"
echo "   - Get Account SID and Auth Token from Console Dashboard"
echo "   - Update TWILIO_ACCOUNT_SID and TWILIO_AUTH_TOKEN in .env"
echo ""

echo "2. Google Drive API Setup:"
echo "   - Go to https://console.developers.google.com/"
echo "   - Create new project or select existing"
echo "   - Enable Google Drive API"
echo "   - Create OAuth 2.0 credentials"
echo "   - Add authorized redirect URI: http://localhost:5678/rest/oauth2-credential/callback"
echo "   - Download credentials JSON"
echo "   - Update GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET in .env"
echo ""

echo "3. Google Sheets for Audit Log:"
echo "   - Create a new Google Sheet"
echo "   - Add headers: timestamp, from, command, path, response, messageId"
echo "   - Get the Spreadsheet ID from URL"
echo "   - Update GOOGLE_SHEETS_SPREADSHEET_ID in .env"
echo ""

echo "4. Cohere AI Setup (Free):"
echo "   - Go to https://cohere.ai/"
echo "   - Sign up for free account (includes free tier)"
echo "   - Go to API Keys section"
echo "   - Create new API key"
echo "   - Update COHERE_API_KEY in .env"
echo ""

echo "5. Run the application:"
echo "   ./start.sh"
echo ""

echo "Quick Command Reference:"
echo "   LIST ProjectX        - List files in ProjectX folder"
echo "   DELETE file.pdf      - Delete a specific file"
echo "   MOVE source dest     - Move file from source to dest"
echo "   SUMMARY ProjectX     - AI summary of docs in ProjectX"
echo "   HELP                 - Show help message"
echo ""

read -p "Press Enter to continue after completing the setup..."

echo "Setup guide completed!"
echo "Next steps:"
echo "1. Edit .env file with your credentials"
echo "2. Run: ./start.sh"
echo "3. Import workflow.json into n8n"
echo "4. Test with WhatsApp!"
