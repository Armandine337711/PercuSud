require('dotenv').config
const express = require('express'),
    app = express(),
    router = require('./app/router'),
    PORT = process.env.PORT || 3500;


app.use(router);

app.listen(PORT, () => {
    console.log(`Server satrted on port ${PORT}`);
});