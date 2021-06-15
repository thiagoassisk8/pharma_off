
const ofertaService = require('../services/ofertaService');
const catchAsync = require('../utils/catchAsync');

exports.getAllProductsOferta = catchAsync(async (req, res, next) => {
    const prods = await ofertaService.getAllProductsOferta();
  
    res.status(200).json({
      status: 'success',
      data:[prods]
    });
  });

  exports.getAllProducts= catchAsync(async (req, res, next) => {
    const prods = await ofertaService.getAllProducts();
  
    res.status(200).json({
      status: 'success',
      data:[prods]
    });
  });

exports.getProductOferta = catchAsync(async (req, res, next) => {
    const prod = await ofertaService.getProductOferta(req);
  
    res.status(200).json({
      status: 'success',
      data: prod,
    });
  });
 
exports.addProductOferta = catchAsync(async (req, res, next) => {
    await ofertaService.addProductOferta(req);
  
    res.status(201).json({
      status: 'success',
      data: 'Produto em oferta criado!',
    });
  });
  
exports.deleteProductOferta = catchAsync(async (req, res, next) => {
    await ofertaService.deleteProductOferta(req);
  
    res.status(204).json({
      status: 'success',
      data: 'Produto em oferta deletado!',
    });
  });
  
exports.updateProductOferta = catchAsync(async (req, res, next) => {
    await ofertaService.updateProductOferta(req);
  
    res.status(200).json({
      status: 'success',
      data: 'Produto em oferta editado!',
    });
  });
  
