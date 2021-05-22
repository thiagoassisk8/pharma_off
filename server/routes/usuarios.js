const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

router.post('/cadastro', (req, res, next) => {
    mysql.getConnection((err, conn) => {
        if (err) { return res.status(500).send({ error: error }) }
        conn.query('SELECT * FROM tb_pessoa WHERE email_pessoa = ?', [req.body.email_pessoa], (error, results) => {
            if (error) { return res.status(500).send({ error: error }) }
            if (results.length > 0) {
                res.status(409).send({ mensagem: 'Usuário já cadastrado' })
            } else {
                bcrypt.hash(req.body.pwd_pessoa, 10, (errBcrypt, hash) => {
                    if (errBcrypt) { return res.status(500).send({ error: errBcrypt }) }
                    conn.query(
                        `INSERT INTO tb_pessoa (nme_pessoa, email_pessoa,pwd_pessoa) VALUES (?,?,?)`,
                        [req.body.nme_pessoa, req.body.email_pessoa,hash],
                        (error, results) => {
                            conn.release();
                            if (error) { return res.status(500).send({ error: error }) }
                            response = {
                                mensagem: 'Usuário criado com sucesso',
                                usuarioCriado: {
                                    id_usuario: results.insertId,
                                    nome:req.body.nme_pessoa,
                                    email: req.body.email_pessoa                           
                                }
                            }
                            return res.status(201).send(response);
                        })
                });
            }
        })

    });
});


router.post('/login', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        const query = `SELECT * FROM tb_pessoa WHERE email_pessoa = ?`;
        conn.query(query,[req.body.email_pessoa],(error, results, fields) => {
            conn.release();
            if (error) { return res.status(500).send({ error: error }) }
            if (results.length < 1) {
                return res.status(401).send({ mensagem: 'Falha na autenticação' })
            }
            bcrypt.compare(req.body.pwd_pessoa, results[0].pwd_pessoa, (err, result) => {
                if (err) {
                    return res.status(401).send({ mensagem: 'Falha na autenticação' })
                }
                if (result) {
                    const token = jwt.sign({
                        id_pessoa: results[0].id_pessoa,
                        email_pessoa: results[0].email_pessoa
                    },
                    process.env.JWT_KEY,
                    {
                        expiresIn: "1h"
                    });
                    return res.status(200).send({
                        mensagem: 'Autenticado com sucesso',
                        token: token
                    });
                }
                return res.status(401).send({ mensagem: 'Falha na autenticação' })
            });
        });
    });
})











module.exports = router; 