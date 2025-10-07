const express = require('express');
const app = express();
const port = process.env.PORT || 5000;

app.get('/', (req, res) => {
  res.send('Hello from Docker Compose Backend!');
});

app.listen(port, () => {
  console.log(`Backend server running on port ${port}`);
});
