const express = require('express');
const router = express.Router();

const jwt = require('jsonwebtoken');

const userController = require('../controllers/userController');
const authController = require('../controllers/authController');


// Essas rotas são para ver/editar/deletar os usuários, não precisam estar no app mas são necessárias para o controle.
router.route('/usuarios').get(userController.getAllUsers);
router.route('/').get(userController.getAllUsers).post(userController.addUser);
router
  .route('/usuario/:id')
  .get(userController.getUser)
  .patch(userController.updateUser)
  .delete(userController.deleteUser);


  //Essas rotas são para as funções que o app precisa
router.route('/cadastro').post(authController.cadastro); // o cadastro é igual ao addUser

router.route('/login').post(authController.login);

router.route('/esqueceuSenha').post(authController.esqueceuSenha);

router.route('/resetSenha/:token').patch(authController.resetSenha);


module.exports = router; 