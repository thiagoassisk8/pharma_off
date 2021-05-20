const express = require("express");
const { route } = require("../app");
const router = express.Router();
const mysql = require('../mysql').pool;

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
        descricao:req.body.desc_produto,
        img_produto:req.body.img_produto
    }

    mysql.getConnection((error,conn)=>{
        conn.query(
            'insert into ta_produto(nme_produto, preco_produto, desc_produto, img_produto) values (?,?,?,?)',
            [req.body.nome,req.body.preco,req.body.desc_produto,req.body.img_produto],
            (error,resultado,field) =>  {
                conn.release();

                if(error){
                    res.status(500).send({                        
                        error:error,
                        response:null
                        
                    });
                }
                res.status(201).send({
                    mensagem: 'Produto inserido com sucesso',                    
                    id_produto:resultado.insertId
                });
            })
                
            }
        )

    });

    

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