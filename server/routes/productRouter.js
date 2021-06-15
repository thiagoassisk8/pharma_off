const express = require('express');
const router = express.Router();

const productController = require('../controllers/productController');
const ofertaController = require('../controllers/ofertaController');

router.route('/produtos').get(productController.getAllProducts);

router.route('/')
.get(productController.getAllProducts)
.post(productController.addProduct)
.get(productController.getProduct);


router
  .route('/produto/:id')
  .get(productController.getProduct)
  .patch(productController.updateProduct)
  .delete(productController.deleteProduct);


router.route('/remedio').get(productController.getAllProductRemedios);
router.route('/higiene').get(productController.getAllProductHigiene);
router.route('/cuidado').get(productController.getAllProductCuidado);
router.route('/populares').get(productController.getAllProductsPopular);

router.route('/parceiros').get(ofertaController.getAllProducts);
router.route('/ofertas').get(ofertaController.getAllProductsOferta);
router.route('/oferta/:id_produto').get(ofertaController.getProductOferta);
router.route('/Addoferta').post(ofertaController.addProductOferta);
router.route('/deloferta').post(ofertaController.deleteProductOferta);
router.route('/updateoferta').post(ofertaController.updateProductOferta);


module.exports = router; 