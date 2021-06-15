
const formularioServices = require('../services/formularioService');
const catchAsync = require('../utils/catchAsync');

exports.getAllForms = catchAsync(async (req, res, next) => {
    const form = await formularioServices.getAllForms();
  
    res.status(200).json({
      status: 'success',
      data:[form]
    });
  });

exports.addForm = catchAsync(async (req, res, next) => {
    await formularioServices.addForm(req);
  
    res.status(201).json({
      status: 'success',
      data: 'Formulário criado!',
    });
  });
  


