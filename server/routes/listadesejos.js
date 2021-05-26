const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
// POSTS E GETS REFERENTES A TABELA TA_LISTADESEJOS_PRODUTOS

// RETORNA A LISTA DE DESEJOS DE PRODUTOS DE TODOS OS USUARIOS
router.get('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `select * from ta_listaDesejos_produtos inner join ta_produto on id_produto = cod_produto 
            inner join tb_listaDesejos on id_listaDesejos = cod_listadesejos 
            inner join tb_pessoa on id_pessoa = cod_pessoa;`,
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    quantidade: result.length,
                    lista: result.map(lista => {
                        return {
                            id_listaDesejos_produtos: lista.id_listaDesejos_produtos,
                            nome: lista.nme_pessoa,
                            id_pessoa: lista.cod_pessoa,
                            produto: lista.nme_produto,
                            cod_produto : lista.cod_produto,
                            request: {
                                tipo: 'GET',
                                descricao: 'Retorna a lista de desejos de todos os usuarios',
                                url: 'http://localhost:3000/listaDesejos' + lista.id_listaDesejos_produtos
                            }
                        }
                    })
                }
                return res.status(200).send(response);
            }
        )
    });
});

// INSERE UM PRODUTO NA LISTA DE DESEJOS DE UM USUARIO ESPECIFICO
router.post('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query('SELECT * FROM ta_listadesejos_produtos WHERE cod_produto = ?',
        [req.body.cod_produto],
        (error, result, field) => {
            if (error) { return res.status(500).send({ error: error }) }
            if (result.length == 0) {
                return res.status(404).send({
                    mensagem: 'Produto não encontrado'
                })
            }
        conn.query(
            'INSERT INTO ta_listadesejos_produtos (cod_listadesejos, cod_produto) VALUES (?,?);',
            [req.body.cod_listadesejos, 
            req.body.cod_produto,
            ],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Produto inserido na lista com sucesso!',
                    cupomCriado: {
                        id_listaDesejos_produtos: result.id_listaDesejos_produtos,
                        cod_lista: req.body.cod_listadesejos,
                        cod_produto: req.body.cod_produto,
                        request: {
                            tipo: 'POST',
                            descricao: 'Insere todos os produtos de uma lista de desejos',
                            url: 'http://localhost:3000/listaDesejos'
                        }
                    }
                }
                return res.status(201).send(response);
            }
        )
      })
    });
});

//  RETORNA A LISTA DE DESEJOS DE PRODUTOS DE UM USUARIOS ESPECIFICO
router.get('/:cod_pessoa', (req, res, next)=> {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `select * from ta_listaDesejos_produtos 
             inner join ta_produto on id_produto = cod_produto
             inner join tb_listaDesejos on id_listaDesejos = cod_listadesejos 
             inner join tb_pessoa on id_pessoa = cod_pessoa 
             where cod_pessoa = ?;`,
            [req.params.cod_pessoa],
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                
                if (result.length == 0) {
                    return res.status(404).send({
                        mensagem: 'Não foi encontrado uma lista com esta pessoa'
                    })
                }
                const response = {
                    lista: result.map(produto => {
                        return {
                            id_listaDesejos_produtos: produto.id_listaDesejos_produtos,
                            cod_produto: produto.cod_produto,
                            pessoa: {
                                id_pessoa: produto.id_produto,
                                nme_pessoa: produto.nme_pessoa,
                                cod_pessoa: produto.cod_pessoa
                            },
                            request: {
                                tipo: 'GET',
                                descricao: 'Retorna a lista de desejos de um usuario especifico',
                                url: 'http://localhost:3000/listaDesejos/' + produto.cod_pessoa
                        }
                    }
                })
            }
                return res.status(200).send(response);
            }
        )
        });
});

// Altera os detalhes de uma lista específica (não é necessário... mas ta aí)
router.patch('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `UPDATE ta_listaDesejos_produtos
            SET cod_listadesejos = ?,
                cod_produto  = ?
            WHERE id_listaDesejos_produtos  = ?;`,
            [
                req.body.cod_listadesejos,
                req.body.cod_produto,
                req.body.id_listaDesejos_produtos
            ],
            (error, resultado, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }

                res.status(202).send({
                    mensagem: 'Lista de desejos alterada com sucesso'
                });
            }
        )
    });
});

// EXCLUI UM PRODUTO DA LISTA DE DESEJOS
router.delete('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(            
            `DELETE FROM ta_listaDesejos_produtos WHERE cod_produto = ?;`, 
            [req.body.cod_produto],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Produto removido da lista de desejos',
                    request: {
                        tipo: 'DELETE',
                        descricao: 'Deleta um produto da lista de desejos',
                        url: 'http://localhost:3000/',
                        body: {
                            nome: 'String',
                            preco: 'Number'
                        }
                    }
                }
                return res.status(202).send(response);
            }
        )
    });
});

module.exports = router;