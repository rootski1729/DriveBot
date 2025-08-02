#!/bin/bash

# Start script for WhatsApp Drive Assistant

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🚀 Starting WhatsApp Drive Assistant...${NC}"

# Check if .env exists
if [ ! -f .env ]; then
    echo -e "${RED}❌ .env file not found!${NC}"
    echo "Please run ./setup.sh first"
    exit 1
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker is not running!${NC}"
    echo "Please start Docker and try again"
    exit 1
fi

# Load environment variables
source .env

echo -e "${YELLOW}📦 Building and starting containers...${NC}"

# Start with docker-compose
docker-compose up -d

echo -e "${YELLOW}⏳ Waiting for n8n to start...${NC}"
sleep 10

# Check if n8n is healthy
for i in {1..30}; do
    if curl -s http://localhost:5678/healthz > /dev/null; then
        echo -e "${GREEN}✅ n8n is running!${NC}"
        break
    fi
    echo "Waiting for n8n... ($i/30)"
    sleep 2
done

echo ""
echo -e "${GREEN}🎉 WhatsApp Drive Assistant is ready!${NC}"
echo ""
echo -e "${YELLOW}📱 Next Steps:${NC}"
echo "1. Open http://localhost:5678 in your browser"
echo "2. Import the workflow.json file"
echo "3. Configure credentials in n8n:"
echo "   - Twilio credentials"
echo "   - Google Drive OAuth2"
echo "   - Google Sheets"
echo "   - Cohere AI API"
echo "4. Activate the workflow"
echo "5. Set webhook URL in Twilio console to:"
echo "   ${WEBHOOK_URL}/webhook/whatsapp"
echo ""
echo -e "${GREEN}📝 Test Commands:${NC}"
echo "Send these to your WhatsApp sandbox number:"
echo "• HELP"
echo "• LIST Documents"
echo "• SUMMARY ProjectX"
echo ""
echo -e "${YELLOW}📊 Monitor logs:${NC}"
echo "docker-compose logs -f"
echo ""
echo -e "${YELLOW}🛑 Stop service:${NC}"
echo "./stop.sh"
