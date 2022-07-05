const express = require('express')
const router = express.Router();

const tableController = require('../controllers/table-controller');

const multer = require('multer');

router.get('/', tableController.getData);
router.get('/:cid_id', tableController.getDataCity);


module.exports = router;