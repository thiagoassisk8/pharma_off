const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const bcrypt = require('bcrypt');

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



module.exports = router; 