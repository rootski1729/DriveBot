#!/bin/bash

# Stop script for WhatsApp Drive Assistant

echo "🛑 Stopping WhatsApp Drive Assistant..."

docker-compose down

echo "✅ Services stopped successfully!"
echo ""
echo "To start again, run: ./start.sh"
