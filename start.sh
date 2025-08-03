#!/bin/bash

# Start script for WhatsApp Drive Assistant

set -e

echo "Starting WhatsApp Drive Assistant..."

# Check if .env exists
if [ ! -f .env ]; then
    echo ".env file not found!"
    echo "Please run ./setup.sh first"
    exit 1
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running!"
    echo "Please start Docker and try again"
    exit 1
fi

# Load environment variables
source .env

echo "Building and starting containers..."

# Start with docker-compose
docker-compose up -d

echo "Waiting for n8n to start..."
sleep 10

# Check if n8n is healthy
for i in {1..30}; do
    if curl -s http://localhost:5678/healthz > /dev/null; then
        echo "n8n is running!"
        break
    fi
    echo "Waiting for n8n... ($i/30)"
    sleep 2
done

echo ""
echo "WhatsApp Drive Assistant is ready!"
echo ""
echo "Next Steps:"
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
echo "Test Commands:"
echo "Send these to your WhatsApp sandbox number:"
echo "• HELP"
echo "• LIST Documents"
echo "• SUMMARY ProjectX"
echo ""
echo "Monitor logs:"
echo "docker-compose logs -f"
echo ""
echo "Stop service:"
echo "./stop.sh"
