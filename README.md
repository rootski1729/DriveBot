# WhatsApp Drive Assistant 🤖📁

A powerful n8n workflow that turns WhatsApp into a Google Drive command center. Send simple text commands to list, delete, move, and summarize documents in your Google Drive - all from WhatsApp!

## 🌟 Features

- **📱 WhatsApp Integration**: Use Twilio Sandbox for WhatsApp messaging
- **🗂️ Google Drive Operations**: List, delete, move files with simple commands
- **🤖 AI Summarization**: Get bullet-point summaries of documents using free Cohere AI
- **📊 Audit Logging**: Track all operations in Google Sheets
- **🔒 Safety Guards**: Built-in protection against accidental mass deletion
- **🚀 One-Click Deployment**: Ready-to-use Docker setup

## 📋 Quick Start

### Prerequisites
- Docker Desktop installed
- Google Account
- Twilio Account (free tier)
- Cohere AI Account (free tier)

### 🚀 Fast Setup (5 minutes)

1. **Clone and Setup**
   ```bash
   git clone <repository-url>
   cd # WhatsApp Google Drive Assistant - Complete Setup Guide

## 🚀 Quick Start Commands (PowerShell)

### 1. Initial Setup
```powershell
# Clone and setup project
git clone https://github.com/rootski1729/DriveBot-n8n-.git
cd DriveBot-n8n-

# Copy environment template
Copy-Item .env.example .env

# Start with Docker
docker-compose up -d
```

### 2. Access n8n
- Open browser: http://localhost:5678
- Create admin account
- Import workflow.json

## 📋 Prerequisites Setup

### 1. Twilio WhatsApp Sandbox
1. Go to https://console.twilio.com/
2. Create account → Get trial credits
3. Navigate to Messaging → Try it out → Send a WhatsApp message
4. Get your sandbox number and join code
5. Copy Account SID and Auth Token to `.env`

### 2. Google Drive API
1. Go to https://console.cloud.google.com/
2. Create new project → Enable Google Drive API
3. Create OAuth2 credentials:
   - Application type: Web application  
   - Authorized redirect URIs: `http://localhost:5678/rest/oauth2-credential/callback`
4. Download credentials and add to `.env`

### 3. Free AI Service (Hugging Face)
1. Sign up at https://huggingface.co/
2. Go to Settings → Access Tokens
3. Create new token → Copy to `.env`

## 🎯 Command Syntax

Send these commands via WhatsApp:

```
📋 LIST ProjectX              → List files in ProjectX folder
🗑️ CONFIRM DELETE file.pdf    → Delete file (requires CONFIRM)
📁 MOVE source.pdf Archive    → Move file to Archive folder  
📝 SUMMARY ProjectX           → Get folder summary with AI
❓ HELP                       → Show command help
```

## 🔧 Advanced Configuration

### Production Database (Optional)
Replace SQLite with PostgreSQL:

```yaml
# docker-compose.yml - Add this service:
postgres:
  image: postgres:13
  environment:
    POSTGRES_DB: n8n
    POSTGRES_USER: n8n_user
    POSTGRES_PASSWORD: n8n_password
  volumes:
    - postgres_data:/var/lib/postgresql/data
```

### Custom Webhook Domain
For production with HTTPS:

```bash
# Use ngrok for testing
ngrok http 5678

# Or deploy to cloud with domain
```

## 🛡️ Security Features

- **DELETE Protection**: Requires CONFIRM keyword
- **Audit Logging**: All operations logged with timestamp
- **OAuth2**: Secure Google Drive access
- **Input Validation**: Sanitized commands
- **Rate Limiting**: Built into n8n

## 📊 Monitoring & Debugging

### View Logs
```powershell
# n8n logs
docker-compose logs -f n8n

# All services
docker-compose logs -f
```

### Test Webhook
```powershell
# Test endpoint directly
Invoke-RestMethod -Uri "http://localhost:5678/webhook/whatsapp" -Method POST -Body '{"Body":"HELP","From":"whatsapp:+1234567890"}' -ContentType "application/json"
```

## 🚨 Troubleshooting

### Common Issues:

1. **n8n won't start**: Check port 5678 availability
   ```powershell
   netstat -an | findstr 5678
   ```

2. **Google Drive auth fails**: Verify redirect URI exactly matches
3. **WhatsApp not responding**: Check Twilio webhook URL
4. **Workflow errors**: Check n8n logs and execution history

### Reset Everything:
```powershell
docker-compose down -v
docker-compose up -d
```

## 📱 Demo Script

1. **Setup**: Send "HELP" → Get command list
2. **List**: Send "LIST Documents" → See files  
3. **Summary**: Send "SUMMARY Documents" → Get AI summary
4. **Move**: Send "MOVE old.pdf Archive" → File moved
5. **Delete**: Send "CONFIRM DELETE temp.pdf" → File deleted

## 🎥 Video Demo Points

1. Show WhatsApp commands in action
2. Demonstrate safety features (CONFIRM DELETE)
3. Display n8n workflow execution
4. Show Google Drive changes in real-time
5. Explain audit trail and logging

## 🔄 Backup & Recovery

```powershell
# Backup workflow
docker exec drivebot-n8n-n8n-1 n8n export:workflow --id=1 --output=backup/

# Backup data
docker-compose exec postgres pg_dump -U n8n_user n8n > backup/db_backup.sql
```

---

**⚡ Quick Commands Summary:**
```powershell
# Start
docker-compose up -d

# Stop  
docker-compose down

# View logs
docker-compose logs -f n8n

# Reset
docker-compose down -v && docker-compose up -d
```
   
   # Windows
   .\setup.ps1
   
   # Linux/Mac
   chmod +x setup.sh && ./setup.sh
   ```

2. **Configure Credentials**
   - Edit `.env` file with your API keys (detailed instructions in setup script)

3. **Start the Service**
   ```bash
   # Windows
   .\start.ps1
   
   # Linux/Mac
   ./start.sh
   ```

4. **Import Workflow**
   - Open http://localhost:5678
   - Import `workflow.json`
   - Configure credentials in n8n
   - Activate workflow

## 💬 Command Reference

Send these messages to your WhatsApp sandbox number:

| Command | Description | Example |
|---------|-------------|---------|
| `LIST /folder` | List files in a folder | `LIST ProjectX` |
| `DELETE /path/file.pdf` | Delete a specific file | `DELETE ProjectX/report.pdf` |
| `MOVE /source /destination` | Move a file | `MOVE ProjectX/report.pdf Archive` |
| `SUMMARY /folder` | AI summary of documents | `SUMMARY ProjectX` |
| `HELP` | Show help message | `HELP` |

## 🛠️ Architecture

```
WhatsApp → Twilio → n8n Webhook → Command Parser → Google Drive API
                                      ↓
                              AI Summarization (Cohere)
                                      ↓
                              Audit Log (Google Sheets) → WhatsApp Response
```

## 📦 What's Included

- `workflow.json` - Complete n8n workflow with all nodes
- `docker-compose.yml` - Docker setup for n8n
- `.env.sample` - Environment variables template
- Setup scripts for Windows (`setup.ps1`) and Linux/Mac (`setup.sh`)
- Start/stop scripts for easy management

## 🔧 Detailed Setup Instructions

### 1. Twilio WhatsApp Sandbox
1. Go to [Twilio Console](https://console.twilio.com/)
2. Navigate to **Develop > Messaging > Try it out > Send a WhatsApp message**
3. Join sandbox by sending: `join <keyword>` to `+1 415 523 8886`
4. Get Account SID and Auth Token from dashboard
5. Set webhook URL to: `http://your-domain/webhook/whatsapp`

### 2. Google Drive API
1. Go to [Google Cloud Console](https://console.developers.google.com/)
2. Create project and enable Google Drive API
3. Create OAuth 2.0 credentials
4. Add redirect URI: `http://localhost:5678/rest/oauth2-credential/callback`
5. Download credentials JSON

### 3. Google Sheets Audit Log
1. Create new Google Sheet
2. Add headers: `timestamp`, `from`, `command`, `path`, `response`, `messageId`
3. Get Spreadsheet ID from URL
4. Share with service account email

### 4. Cohere AI (Free Alternative to OpenAI)
1. Sign up at [Cohere.ai](https://cohere.ai/)
2. Get free API key from dashboard
3. Free tier includes 100 requests/month

## 🚀 Deployment Options

### Local Development
```bash
.\start.ps1  # Windows
./start.sh   # Linux/Mac
```

### Production Deployment
- Update webhook URLs to your domain
- Use environment variables for secrets
- Set up SSL/TLS certificates
- Configure firewall rules

## 🔒 Security Features

- **Input Validation**: All commands are parsed and validated
- **Rate Limiting**: Built into Twilio and Cohere APIs
- **Audit Logging**: All operations logged to Google Sheets
- **OAuth2**: Secure Google Drive access
- **Webhook Validation**: Twilio signature verification

## 🎯 Use Cases

- **Remote File Management**: Access Drive files from anywhere via WhatsApp
- **Team Collaboration**: Share file summaries quickly
- **Document Processing**: Auto-summarize reports and documents
- **File Organization**: Move and organize files on the go
- **Quick File Lookup**: Find files without opening Drive

## 🐛 Troubleshooting

### Common Issues

1. **n8n not starting**
   ```bash
   docker-compose logs n8n
   ```

2. **Webhook not receiving messages**
   - Check Twilio webhook URL configuration
   - Verify ngrok or public URL setup

3. **Google Drive authentication**
   - Re-authenticate OAuth2 in n8n
   - Check API quotas in Google Console

4. **AI summaries not working**
   - Verify Cohere API key
   - Check API usage limits

## 📊 Monitoring

- **n8n Logs**: `docker-compose logs -f`
- **Execution History**: Available in n8n interface
- **Audit Trail**: Google Sheets with all operations
- **Health Check**: `http://localhost:5678/healthz`

## 🔄 Workflow Details

The n8n workflow includes:
- **Webhook Trigger**: Receives WhatsApp messages
- **Command Parser**: Extracts and validates commands
- **Route Switch**: Directs to appropriate handlers
- **Google Drive Nodes**: File operations (list, delete, move)
- **AI Summarization**: Document content analysis
- **Response Formatter**: Creates user-friendly messages
- **Audit Logger**: Records all operations
- **Error Handling**: Graceful error responses

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Make changes
4. Test thoroughly
5. Submit pull request

## 📄 License

MIT License - see LICENSE file for details

## 🆘 Support

- **Issues**: Use GitHub Issues for bugs
- **Discussions**: GitHub Discussions for questions
- **Documentation**: Check n8n docs for workflow questions

## 🔮 Future Enhancements

- [ ] Natural language processing for commands
- [ ] File sharing via WhatsApp
- [ ] Batch operations
- [ ] Advanced search capabilities
- [ ] Integration with other cloud storage
- [ ] Voice message support
- [ ] Multi-language support

---

**⚡ Quick Demo**: Send `HELP` to your WhatsApp sandbox number to get started!