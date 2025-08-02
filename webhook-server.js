const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// WhatsApp webhook validation and forwarding
app.post('/webhook/whatsapp', async (req, res) => {
  try {
    console.log('Received WhatsApp webhook:', JSON.stringify(req.body, null, 2));
    
    // Forward to n8n
    const n8nUrl = process.env.N8N_WEBHOOK_URL || 'http://n8n:5678/webhook/whatsapp';
    
    const response = await fetch(n8nUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(req.body),
    });
    
    if (response.ok) {
      console.log('Successfully forwarded to n8n');
      res.status(200).send('OK');
    } else {
      console.error('Failed to forward to n8n:', response.status);
      res.status(500).send('Error forwarding request');
    }
  } catch (error) {
    console.error('Webhook error:', error);
    res.status(500).send('Internal server error');
  }
});

// Start server
app.listen(port, () => {
  console.log(`🚀 WhatsApp webhook server running on port ${port}`);
  console.log(`📱 Webhook URL: http://localhost:${port}/webhook/whatsapp`);
});
