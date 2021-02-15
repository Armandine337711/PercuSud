const express = require('express');
const router = express.Router();

const mainController = require('./controllers/mainController')
const peopleController = require('./controllers/peopleController')
const userController = require('./controllers/userController.js');

router.get('/', mainController.home);

router.get('/profs', peopleController.getProfs);
//router.get('/visiteurs', peopleController.visitors);

router.get('/inscription', userController.inscription);
router.post('inscription/:idFormule(\\^d{1-3})', userController.addToCart);





router.use(mainController.notFound);

module.exports = router;