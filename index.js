require('dotenv').config();
const express = require('express');
const app = express();
const router = require('./app/router');
const PORT = process.env.PORT || 4242;
//const session = express.session;

app.set('view engine', 'ejs');
app.set('views', './app/views')

app.use(express.static('./app/public'))

// app.use(session({
//     secret: process.env.SESSION_SECRET,
//     resave: true,
//     saveUninitialized: true

// }));
// app.use((request, _, next) => {
//     if (!request.session.cart) {
//         console.log('Création du panier en session');
//         request.session.cart = [];
//     } else {
//         console.log('cart existe déjà en session');
//     }

//     next();
// });

app.use(router);



console.log(process.env.PORT);
console.log(process.env.PG_URL);
app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});