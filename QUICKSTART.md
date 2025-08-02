# 🚀 FAST DEPLOYMENT - WhatsApp Google Drive Assistant

## ⚡ INSTANT SETUP (5 MINUTES)

### Step 1: Start Services
```powershell
# Copy environment and start
Copy-Item .env.example .env
docker-compose up -d

# Wait 30 seconds, then open http://localhost:5678
```

### Step 2: Configure n8n (2 minutes)
1. Open http://localhost:5678
2. Create admin account
3. Go to Templates → Import → Upload `workflow.json`

### Step 3: Quick Credentials Setup
```powershell
# Edit .env file with your credentials
notepad .env
```

**REQUIRED CREDENTIALS:**
1. **Twilio**: https://console.twilio.com/ (FREE TRIAL)
2. **Google Drive**: https://console.cloud.google.com/ (FREE)  
3. **Hugging Face**: https://huggingface.co/ (FREE)

### Step 4: Test (30 seconds)
Send WhatsApp message to your Twilio sandbox: `HELP`

---

## 🎯 PRODUCTION COMMANDS

### Start/Stop
```powershell
# Start everything
docker-compose up -d

# Stop everything  
docker-compose down

# View logs
docker-compose logs -f n8n

# Reset database
docker-compose down -v; docker-compose up -d
```

### Health Check
```powershell
# Check if running
docker-compose ps

# Test webhook
Invoke-RestMethod -Uri "http://localhost:5678/webhook/whatsapp" -Method POST -Body '{"Body":"HELP","From":"whatsapp:+1234567890"}' -ContentType "application/json"
```

---

## 📱 WHATSAPP COMMANDS

```
HELP                    → Show all commands
LIST ProjectX           → List files in folder  
SUMMARY ProjectX        → Get AI summary
MOVE file.pdf Archive   → Move file
CONFIRM DELETE file.pdf → Delete (safety required)
```

---

## 🔧 CREDENTIAL SETUP DETAILS

### 1. Twilio WhatsApp (5 mins)
1. https://console.twilio.com/ → Sign up
2. Phone Numbers → Manage → WhatsApp sandbox
3. Copy Account SID + Auth Token to `.env`
4. Note sandbox number (e.g., +14155238886)

### 2. Google Drive API (5 mins)  
1. https://console.cloud.google.com/
2. New Project → Enable Google Drive API
3. Credentials → OAuth 2.0 → Web application
4. Redirect URI: `http://localhost:5678/rest/oauth2-credential/callback`
5. Copy Client ID + Secret to `.env`

### 3. Hugging Face (2 mins)
1. https://huggingface.co/ → Sign up
2. Settings → Access Tokens → New token
3. Copy token to `.env`

---

## 🚨 TROUBLESHOOTING

**Port 5678 in use?**
```powershell
netstat -an | findstr 5678
# Kill process or change N8N_PORT in .env
```

**Docker not working?**
```powershell
# Restart Docker Desktop
# Or install: https://docs.docker.com/desktop/windows/install/
```

**Webhook not responding?**
- Check Twilio webhook URL points to your n8n
- Use ngrok for external access: `ngrok http 5678`

---

## 📊 MONITORING

```powershell
# Watch all logs
docker-compose logs -f

# n8n only  
docker-compose logs -f n8n

# Check running containers
docker-compose ps

# Resource usage
docker stats
```

---

## 🎥 DEMO SCRIPT (5 MINUTES)

1. **[0:00-1:00]** Show project structure, explain architecture
2. **[1:00-2:00]** Start services, import workflow  
3. **[2:00-3:30]** WhatsApp demo: HELP, LIST, SUMMARY
4. **[3:30-4:30]** Safety demo: DELETE with CONFIRM
5. **[4:30-5:00]** Show n8n workflow execution, audit logs

**WhatsApp Demo Flow:**
```
You: "HELP"
Bot: Shows command menu

You: "LIST Documents"  
Bot: Lists files in Documents folder

You: "SUMMARY Documents"
Bot: AI-generated summary of folder contents

You: "MOVE test.pdf Archive"
Bot: "File moved successfully"

You: "DELETE test.pdf"
Bot: "Safety check failed - use CONFIRM"

You: "CONFIRM DELETE test.pdf"  
Bot: "File deleted successfully"
```

---

## ⚡ ONE-LINER SETUP

```powershell
git clone https://github.com/rootski1729/DriveBot-n8n-.git; cd DriveBot-n8n-; Copy-Item .env.example .env; docker-compose up -d; Start-Process "http://localhost:5678"
```

**After running this:**
1. Setup credentials in `.env`
2. Import `workflow.json` in n8n
3. Configure Twilio webhook
4. Test with WhatsApp!

---

**🏆 DELIVERABLES CHECKLIST:**
- ✅ Ready-to-import workflow.json
- ✅ Docker deployment
- ✅ Environment configuration  
- ✅ Complete documentation
- ✅ Safety features (CONFIRM DELETE)
- ✅ Audit logging
- ✅ Error handling
- ✅ Free AI integration
- ✅ Demo script ready
