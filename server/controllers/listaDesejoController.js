
const listaDesejoService = require('../services/listaDesejoService');
const catchAsync = require('../utils/catchAsync');

exports.getAllListas = catchAsync(async (req, res, next) => {
    const prods = await listaDesejoService.getAllListas(req); 
    res.status(200).json({
      status: 'success',
      data:[prods]
    });
  });

  exports.getListaDesejo= catchAsync(async (req, res, next) => {
    const prods = await listaDesejoService.getListaDesejo(req);
 
    res.status(200).json({
      status: 'success',
      data:[prods]
    });
  });

exports.addProductLista = catchAsync(async (req, res, next) => {
    const prod = await listaDesejoService.addProductLista(req);  
    res.status(200).json({
      status: 'success',
      data: prod,
    });
  });
 
exports.deleteProductLista = catchAsync(async (req, res, next) => {
    await listaDesejoService.deleteProductLista(req); 
    res.status(201).json({
      status: 'success',
      data: 'Produto deletado!',
    });
  });
  
  exports.calcularSoma = catchAsync(async (req, res, next) => {
    await listaDesejoService.calcularSoma(req); 
    res.status(201).json({
      status: 'success',
      data: 'Produto somado!',
    });
  });