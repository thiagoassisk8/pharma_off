const AppError = require('../utils/AppError');

const handleValidationErrorDB = err =>
  new AppError(`Dado de entrada inválido: ${err.column}`, 400);

const handleCastErrorDB = err => new AppError(err.message, 400);

const handleDuplicateFieldsDB = err => {
  const regex = /\(([^)]+)\)/;
  const matches = err.detail.match(regex);

  return new AppError(
    `${matches[1]} já existe! Por favor, use outro valor!`,
    400
  );
};

const sendErrorDev = (err, res) => {
  res.status(err.statusCode).json({
    status: err.status,
    error: err,
    message: err.message,
    stack: err.stack,
  });
};

const sendErrorProd = (err, res) => {
  if (err.isOperational) {
    return res.status(err.statusCode).json({
      status: err.status,
      message: err.message,
    });
  }

  res.status(err.statusCode).json({
    status: err.status,
    message: 'Internal server error.',
  });
};

module.exports = (err, req, res, next) => {
  err.statusCode = err.statusCode ? err.statusCode : '500';
  err.status = err.status ? err.status : 'error';

  if (process.env.NODE_ENV === 'development') {
    return sendErrorDev(err, res);
  }

  let error = Object.assign(err);

  if (err.code === '23502') error = handleValidationErrorDB(error);
  if (err.code === '22P02') error = handleCastErrorDB(error);
  if (err.code === '23505') error = handleDuplicateFieldsDB(error);

  sendErrorProd(error, res);

  next();
};
