const express = require("express");
const { route } = require("../app");
const router = express.Router();

// Retorna todos os produtos
router.get('/',(req,res,next) => {
    res.status(200).send({
        mensagem:'Retonar todos os produtos'
    });
});

// Insere um produto
router.post('/',(req,res,next) => {
    const produto = {
        nome:req.body.nome,
        preco:req.body.preco,
    }
    res.status(201).send({
        mensagem: 'Insere um produto',
        produtoCriado:produto
    })
})

// Retorna os dados de um produto
router.get('/:id_produto',(req,res,next) => {
    const id = req.params.id_produto
    if (id === 1){
        res.status(200).send({
            mensagem:'Você descobriu o ID especial',
            id:id
        })
    

    }
    else{
        res.status(200).send({
            mensagem:'Você passou um ID',
            id:id
        })
    
    }
    
});

// altera um produto
router.patch('/',(req,res,next) => {
    res.status(201).send({
        mensagem: 'Produto alterado'
    })
})

//exclui um produto
router.delete('/',(req,res,next) => {
    res.status(201).send({
        mensagem: 'Produto excluido'
    })
})


module.exports = router;