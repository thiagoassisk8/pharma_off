const authService = require('../services/authService');
const catchAsync = require('../utils/catchAsync');
const AppError = require('../utils/AppError');

exports.cadastro = catchAsync(async (req, res, next) => {
    const token = await authService.cadastro(req, res);
  
    res.status(201).json({
      status: 'success',
      data: 'Usuário criado com sucesso!',
      token,
    });
  });
  
  exports.login = catchAsync(async (req, res, next) => {
    const token = await authService.login(req, res);
  
    res.status(200).json({
      status: 'success',
      data: 'Usuário Logado com sucesso!',
      token,
    });
  });
  
  exports.esqueceuSenha = catchAsync(async (req, res, next) => {
    await authService.esqueceuSenha(req);
  
    res.status(200).json({
      status: 'success',
      data: 'O Token foi enviado ao seu email com sucesso!',
    });
  });
  
  exports.resetSenha = catchAsync(async (req, res, next) => {
    const token = await authService.resetSenha(req, res);
  
    res.status(200).json({
      status: 'success',
      data: 'Mudança de senha do usuário feita com sucesso!',
      token,
    });
  });
  
  exports.protect = catchAsync(async (req, res, next) => {
    const user = await authService.protect(req);
  
    req.user = user;
    next();
  });
  
  