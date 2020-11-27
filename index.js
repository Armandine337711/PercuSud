require('dotenv').config();
const express = require('express');
const app = express();

app.set('view engine', 'ejs');
app.set('views', './app/views')

app.use(express.static('./app/public'))



const router = require('./app/router');
app.use(router);


const PORT = process.env.PORT || 3500;
console.log(process.env.PORT);
console.log(process.env.PG_URL);
app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});