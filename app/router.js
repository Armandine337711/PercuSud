const express = require('express');
const router = express.Router();

const mainController = require('./controllers/mainController')
const peopleController = require('./controllers/peopleController')
const userController = require('./controllers/userController.js');

router.get('/', mainController.home);

router.get('/profs', peopleController.profs);
router.get('/visiteurs', peopleController.visitors);

router.get('/inscription', userController.inscription);





router.use(mainController.notFound);

module.exports = router;