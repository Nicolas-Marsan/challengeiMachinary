var express = require('express');
var router = express.Router();
const personController = require ('../controller/personsController.js')
/* GET users listing. */
router.get('/', personController.index);
router.post('/personDetail', personController.personDetail);

module.exports = router;