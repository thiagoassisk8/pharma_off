const express = require('express');
const router = express.Router();

const formController = require('../controllers/formController');

router.route('/formularios').get(formController.getAllForms);

router.route('/addform').post(formController.addForm);



module.exports = router; 