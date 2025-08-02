#!/bin/bash

# WhatsApp Drive Assistant Setup Script
# This script helps you set up all the required credentials and services

set -e

echo "🚀 WhatsApp Drive Assistant Setup"
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if .env exists
if [ ! -f .env ]; then
    echo -e "${YELLOW}Creating .env file from template...${NC}"
    cp .env.sample .env
    echo -e "${GREEN}✓ .env file created${NC}"
else
    echo -e "${BLUE}ℹ .env file already exists${NC}"
fi

echo ""
echo -e "${BLUE}📋 Setup Checklist:${NC}"
echo ""

echo -e "${YELLOW}1. Twilio WhatsApp Setup:${NC}"
echo "   - Go to https://console.twilio.com/"
echo "   - Create account or login"
echo "   - Go to Develop > Messaging > Try it out > Send a WhatsApp message"
echo "   - Join sandbox: Send 'join <sandbox-keyword>' to +1 415 523 8886"
echo "   - Get Account SID and Auth Token from Console Dashboard"
echo "   - Update TWILIO_ACCOUNT_SID and TWILIO_AUTH_TOKEN in .env"
echo ""

echo -e "${YELLOW}2. Google Drive API Setup:${NC}"
echo "   - Go to https://console.developers.google.com/"
echo "   - Create new project or select existing"
echo "   - Enable Google Drive API"
echo "   - Create OAuth 2.0 credentials"
echo "   - Add authorized redirect URI: http://localhost:5678/rest/oauth2-credential/callback"
echo "   - Download credentials JSON"
echo "   - Update GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET in .env"
echo ""

echo -e "${YELLOW}3. Google Sheets for Audit Log:${NC}"
echo "   - Create a new Google Sheet"
echo "   - Add headers: timestamp, from, command, path, response, messageId"
echo "   - Get the Spreadsheet ID from URL"
echo "   - Update GOOGLE_SHEETS_SPREADSHEET_ID in .env"
echo ""

echo -e "${YELLOW}4. Cohere AI Setup (Free):${NC}"
echo "   - Go to https://cohere.ai/"
echo "   - Sign up for free account (includes free tier)"
echo "   - Go to API Keys section"
echo "   - Create new API key"
echo "   - Update COHERE_API_KEY in .env"
echo ""

echo -e "${YELLOW}5. Run the application:${NC}"
echo "   ./start.sh"
echo ""

echo -e "${GREEN}📝 Quick Command Reference:${NC}"
echo "   LIST ProjectX        - List files in ProjectX folder"
echo "   DELETE file.pdf      - Delete a specific file"
echo "   MOVE source dest     - Move file from source to dest"
echo "   SUMMARY ProjectX     - AI summary of docs in ProjectX"
echo "   HELP                 - Show help message"
echo ""

read -p "Press Enter to continue after completing the setup..."

echo -e "${GREEN}✅ Setup guide completed!${NC}"
echo -e "${BLUE}Next steps:${NC}"
echo "1. Edit .env file with your credentials"
echo "2. Run: ./start.sh"
echo "3. Import workflow.json into n8n"
echo "4. Test with WhatsApp!"
