const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;

module.exports.GetAllCoupons = async (req, res, next) => {
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
}

module.exports.AddCoupon = async (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'INSERT INTO ta_cupom (nme_cupom, percent_cupom,dta_validade_cupom,sts_ativo_cupom,cod_produto,cod_estabelecimento) VALUES (?,?,?,?,?,?);',
            [req.body.nme_cupom, 
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
                        nome: req.body.nme_cupom,
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
}

module.exports.GetCoupon = async (req, res, next)=> {
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
                            descricao: 'Retorna o cupom especifico',
                            url: 'http://localhost:3000/cupons'
                        }
                    }
                }
                return res.status(200).send(response);
            }
        )
    });
}

module.exports.ChangeCoupon = async (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `UPDATE ta_cupom
                SET nme_cupom        = ?,
                    percent_cupom       = ?,
                    dta_validade_cupom       = ?,
                    sts_ativo_cupom       = ?,
                    cod_produto       = ?,
                    cod_estabelecimento =?
              WHERE id_cupom  = ?`,
            [
                req.body.nme_cupom,
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
                        nome: req.body.nme_cupom,
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
}
module.exports.RemoveCoupon = async (req, res, next) => {
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
}