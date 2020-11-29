const express = require('express');
const router = express.Router();

const mainController = require('./controllers/mainController')
const peopleController = require('./controllers/peopleController')

router.get('/', mainController.home);

router.get('/profs', peopleController.profs)
//router.get('/visitiors', peopleController.visitors)





router.use(mainController.notFound);

module.exports = router;