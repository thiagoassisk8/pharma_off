const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const multer = require('multer');
const ProdutoControllers = require('../controllers/ProdutoControllers');
const storage = multer.diskStorage({
    destination: function (req,file,cb){
        cb(null, './uploads/');
    },
    filename: function(req,file,cb){
        let data = new Date().toISOString().replace(/:/g, '-') + '-';
        cb(null, data + file.originalname );
    }
})
const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
        cb(null, true);
    } else {
        cb(null, false);
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 5
    },
    fileFilter: fileFilter
});

// RETORNA TODOS OS PRODUTOS
router.get('/', ProdutoControllers.GetAllProducts);


// INSERE UM PRODUTO
router.post('/', ProdutoControllers.AddProduct);

// RETORNA OS DADOS DE UM PRODUTO ESPECIFICO
router.get('/:id_produto', ProdutoControllers.GetProduct);

// ALTERA UM PRODUTO
router.patch('/', ProdutoControllers.ChangeProduct);

// EXCLUI UM PRODUTO
router.delete('/',ProdutoControllers.RemoveProduct );

module.exports = router;