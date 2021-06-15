const express = require('express');
const router = express.Router();

const listaDesejoController = require('../controllers/listaDesejoController');

router.route('/listas').get(listaDesejoController.getAllListas);

router.route('/lista/:cod_usuario').get(listaDesejoController.getListaDesejo);

router.route('/addprodlista').post(listaDesejoController.addProductLista);

router.route('/removeprodlista').delete(listaDesejoController.deleteProductLista);

router.route('/calcularsoma').get(listaDesejoController.calcularSoma);


module.exports = router; 