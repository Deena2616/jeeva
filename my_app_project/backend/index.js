
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
app.use(express.json());
app.get('/', (req, res) => {
  res.send('Welcome to the backend of my_app_project');
});
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
