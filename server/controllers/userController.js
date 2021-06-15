
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const userServices = require('../services/userService');
const catchAsync = require('../utils/catchAsync');

exports.getAllUsers = catchAsync(async (req, res, next) => {
    const users = await userServices.getAllUsers();
  
    res.status(200).json({
      status: 'success',
      // results: users.length,
      data:[users]
    });
  });

exports.getUser = catchAsync(async (req, res, next) => {
    const user = await userServices.getUser(req);
  
    res.status(200).json({
      status: 'success',
      data: user,
    });
  });
 
exports.addUser = catchAsync(async (req, res, next) => {
    await userServices.addUser(req);
  
    res.status(201).json({
      status: 'success',
      data: 'Usuário criado!',
    });
  });
  
exports.deleteUser = catchAsync(async (req, res, next) => {
    await userServices.deleteUser(req);
  
    res.status(204).json({
      status: 'success',
      data: 'Usuário deletado!',
    });
  });
  
exports.updateUser = catchAsync(async (req, res, next) => {
    await userServices.updateUser(req);
  
    res.status(200).json({
      status: 'success',
      data: 'Usuário editado!',
    });
  });

exports.protect = catchAsync(async (req, res, next) => {
    const user = await authService.protect(req);
  
    req.user = user;
    next();
  });
  