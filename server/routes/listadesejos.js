const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const WishListControllers = require('../controllers/ListaDesejoControllers');
// POSTS E GETS REFERENTES A TABELA TA_LISTADESEJOS_PRODUTOS


// RETORNA A LISTA DE DESEJOS DE PRODUTOS DE TODOS OS USUARIOS
router.get('/', WishListControllers.getAllWishLists);

// INSERE UM PRODUTO NA LISTA DE DESEJOS DE UM USUARIO ESPECIFICO
router.post('/', WishListControllers.InsertProductWishList);

//  RETORNA A LISTA DE DESEJOS DE PRODUTOS DE UM USUARIOS ESPECIFICO
router.get('/:cod_pessoa', WishListControllers.GetWishListUser);

// Altera os detalhes de uma lista específica (não é necessário... mas ta aí)
router.patch('/', WishListControllers.UpdateWishList);

// EXCLUI UM PRODUTO DA LISTA DE DESEJOS
router.delete('/', WishListControllers.DeleteProductfromWishList);

module.exports = router;