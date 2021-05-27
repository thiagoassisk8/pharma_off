const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
CouponsController = require('../controllers/CuponsControllers')

// RETORNA TODOS OS CUPONS
router.get('/', CouponsController.GetAllCoupons);

// INSERE UM CUPOM
router.post('/', CouponsController.AddCoupon);

// RETORNA OS DADOS DE UM CUPOM ESPECIFICO
router.get('/:id_cupom', CouponsController.GetCoupon);

// ALTERA UM CUPOM
router.patch('/',CouponsController.ChangeCoupon);

// EXCLUI UM CUPOM
router.delete('/', CouponsController.RemoveCoupon);

module.exports = router;