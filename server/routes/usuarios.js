const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const UsersControlles = require('../controllers/UsersService');

router.post('/cadastro', UsersControlles.addUser);

router.post('/login', UsersControlles.login)

// retorna todos os usuários
router.get('/',UsersControlles.getAllUsers );


module.exports = router; 