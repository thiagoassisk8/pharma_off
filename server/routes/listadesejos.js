const jwt = require('jsonwebtoken');
const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const login = require('../middleware/login')

// RETORNA A LISTA DE DESEJOS
router.get('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM ta_cupom;',
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    quantidade: result.length,
                    cupons: result.map(prod => {
                        return {
                            id_cupom: prod.id_cupom,
                            nome_cupom: prod.nome_cupom,
                            sts_ativo_cupom: prod.sts_ativo_cupom,
                            request: {
                                tipo: 'GET',
                                descricao: 'Retorna os detalhes de um cupom específico',
                                url: 'http://localhost:3000/cupons/' + prod.id_cupom
                            }
                        }
                    })
                }
                return res.status(200).send(response);
            }
        )
    });
});

// INSERE UM CUPOM
router.post('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'INSERT INTO ta_cupom (nome_cupom, percent_cupom,dta_validade_cupom,sts_ativo_cupom,cod_produto,cod_estabelecimento) VALUES (?,?,?,?,?,?);',
            [req.body.nome_cupom, 
            req.body.percent_cupom,
            req.body.dta_validade_cupom,
            req.body.sts_ativo_cupom,
            req.body.cod_produto,
            req.body.cod_estabelecimento],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Cupom inserido com sucesso',
                    cupomCriado: {
                        id_cupom: result.id_cupom,
                        nome: req.body.nome_cupom,
                        preco: req.body.sts_ativo_cupom,
                        request: {
                            tipo: 'POST',
                            descricao: 'Retorna todos os cupons',
                            url: 'http://localhost:3000/cupons'
                        }
                    }
                }
                return res.status(201).send(response);
            }
        )
    });
});

// RETORNA OS DADOS DE UM CUPOM
router.get('/:id_cupom', (req, res, next)=> {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM ta_cupom WHERE id_cupom = ?;',
            [req.params.id_cupom],
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                
                if (result.length == 0) {
                    return res.status(404).send({
                        mensagem: 'Não foi encontrado cupom com este ID'
                    })
                }
                const response = {
                    cupom: {
                        id_cupom: result[0].id_cupom,
                        nome: result[0].nome_cupom,
                        preco: result[0].sts_ativo_cupom,
                        request: {
                            tipo: 'GET',
                            descricao: 'Retorna todos os cupons',
                            url: 'http://localhost:3000/cupons'
                        }
                    }
                }
                return res.status(200).send(response);
            }
        )
    });
});

// ALTERA UM CUPOM
router.patch('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `UPDATE ta_cupom
                SET nome_cupom        = ?,
                    percent_cupom       = ?,
                    dta_validade_cupom       = ?,
                    sts_ativo_cupom       = ?,
                    cod_produto       = ?,
                    cod_estabelecimento =?,
              WHERE id_cupom  = ?`,
            [
                req.body.nome_cupom,
                req.body.percent_cupom,
                req.body.dta_validade_cupom,
                req.body.sts_ativo_cupom,
                req.body.cod_produto,
                req.body.cod_estabelecimento,
                req.body.id_cupom
            ],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Cupom atualizado com sucesso',
                    cupomAtualizado: {
                        id_cupom: req.body.id_cupom,
                        nome: req.body.nome_cupom,
                        sts: req.body.sts_ativo_cupom,
                        request: {
                            tipo: 'GET',
                            descricao: 'Retorna os detalhes de um cupom específico',
                            url: 'http://localhost:3000/cupons/' + req.body.id_cupom
                        }
                    }
                }
                return res.status(202).send(response);
            }
        )
    });
});

// EXCLUI UM CUPOM
router.delete('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `DELETE FROM ta_cupom WHERE id_cupom = ?`, [req.body.id_cupom],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Cupom removido com sucesso',
                    request: {
                        tipo: 'POST',
                        descricao: 'Insere um cupom',
                        url: 'http://localhost:3000/cupons',
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