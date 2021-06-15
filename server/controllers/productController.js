
const productServices = require('../services/productService');
const catchAsync = require('../utils/catchAsync');

exports.getAllProducts = catchAsync(async (req, res, next) => {
    const prods = await productServices.getAllProducts();
  
    res.status(200).json({
      status: 'success',
      data:[prods]
    });
  });

exports.getProduct = catchAsync(async (req, res, next) => {
    const prod = await productServices.getProduct(req);
  
    res.status(200).json({
      status: 'success',
      data: prod,
    });
  });
 
exports.addProduct = catchAsync(async (req, res, next) => {
    await productServices.addProduct(req);
  
    res.status(201).json({
      status: 'success',
      data: 'Produto criado!',
    });
  });
  
exports.deleteProduct = catchAsync(async (req, res, next) => {
    await productServices.deleteProduct(req);
  
    res.status(204).json({
      status: 'success',
      data: 'Produto deletado!',
    });
  });
  
exports.updateProduct = catchAsync(async (req, res, next) => {
    await productServices.updateProduct(req);
  
    res.status(200).json({
      status: 'success',
      data: 'Produto editado!',
    });
  });
  
  exports.ofertas = catchAsync(async (req, res, next) => {
    await productServices.ofertas(req);
  
    res.status(201).json({
      status: 'success',
      data: 'Oferta criado!',
    });
  });

  exports.getAllProductRemedios = catchAsync(async (req, res, next) => {
    const prod = await productServices.getAllProductRemedios();
  
    res.status(200).json({
      status: 'success',
      data:[prod],
    });
  });

  exports.getAllProductHigiene = catchAsync(async (req, res, next) => {
    const prod = await productServices.getAllProductHigiene();
  
    res.status(200).json({
      status: 'success',
      data:[prod],
    });
  });

  exports.getAllProductCuidado = catchAsync(async (req, res, next) => {
    const prod = await productServices.getAllProductCuidado(req);
  
    res.status(200).json({
      status: 'success',
      data:[prod],
    });
  });

  exports.getAllProductsPopular = catchAsync(async (req, res, next) => {
    const prod = await productServices.getAllProductsPopular(req);
  
    res.status(200).json({
      status: 'success',
      data:[prod],
    });
  });


  



  