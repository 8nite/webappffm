const express = require("express");
const path = require("path");
require('dotenv').config();

const app = express();
// index routes
app.use('/', express.static(path.join(__dirname, 'public')))

// start application
app.listen((process.env.PORT || 3000), () => console.log('listening on port ' + (process.env.PORT || 3000)));