var express = require('express');
var router = express.Router();
const moviesController = require ('../controller/moviesController.js')
/* GET users listing. */
router.get('/', moviesController.index);
router.post('/movieDetail', moviesController.movieDetail);

module.exports = router;
