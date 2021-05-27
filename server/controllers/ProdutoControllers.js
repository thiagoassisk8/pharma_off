const mysql = require('../mysql').pool;


// const upload = multer({
    // storage: storage,
    // limits: {
        // fileSize: 1024 * 1024 * 5
    // },
    // fileFilter: fileFilter
// });

// Retorna todos os produtos
module.exports.GetAllProducts = async (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM ta_produto;',
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    quantidade: result.length,
                    produtos: result.map(prod => {
                        return {
                            id_produto: prod.id_produto,
                            nome: prod.nme_produto,
                            preco: prod.preco_produto,
                            img_produto: prod.img_produto,
                            request: {
                                tipo: 'GET',
                                descricao: 'Retorna o todos os produtos',
                                url: 'http://localhost:3000/produtos/' + prod.id_produto
                            }
                        }
                    })
                }
                return res.status(200).send(response);
            }
        )
    });
}

// INSERE UM PRODUTO
module.exports.AddProduct =  async (req, res, next) => {
    console.log(req.file);
    mysql.getConnection((error, conn)  => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'INSERT INTO ta_produto (nme_produto, preco_produto,preco_desconto_produto,desc_produto,img_produto,cod_estabelecimento) VALUES (?,?,?,?,?,?);',
            [req.body.nme_produto, 
            req.body.preco_produto,
            req.body.preco_desconto_produto,
            req.body.desc_produto,
            req.file.path,
            
            req.body.cod_estabelecimento],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Produto inserido com sucesso',
                    produtoCriado: {
                        id_produto: result.id_produto,
                        nome: req.body.nme_produto,
                        preco: req.body.preco_produto,
                        img_produto: req.file.path,
                        request: {
                            tipo: 'GET',
                            descricao: 'Retorna todos os produtos',
                            url: 'http://localhost:3000/produtos'
                        }
                    }
                }
                return res.status(201).send(response);
            }
        )
    });
}
// RETORNA OS DADOS DE UM PRODUTO ESPECIFICO
module.exports.GetProduct = async (req, res, next)=> {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM ta_produto WHERE id_produto = ?;',
            [req.params.id_produto],
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                
                if (result.length == 0) {
                    return res.status(404).send({
                        mensagem: 'Não foi encontrado produto com este ID'
                    })
                }
                const response = {
                    produto: {
                        id_produto: result[0].id_produto,
                        nome: result[0].nme_produto,
                        preco: result[0].preco_produto,
                        img_produto: result[0].img_produto,
                        request: {
                            tipo: 'GET',
                            descricao: 'Retorna os detalhes de um produto específico',
                            url: 'http://localhost:3000/produtos'
                        }
                    }
                }
                return res.status(200).send(response);
            }
        )
    });
}
// ALTERA UM PRODUTO
module.exports.ChangeProduct = async (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `UPDATE ta_produto
                SET nme_produto        = ?,
                    preco_produto       = ?,
                    desc_produto       = ?,
                    img_produto       = ?,
                    
                    cod_estabelecimento       = ?
              WHERE id_produto  = ?`,
            [
                req.body.nme_produto,
                req.body.preco_produto,
                req.body.desc_produto,
                req.body.img_produto,
                
                req.body.cod_estabelecimento,
                req.body.id_produto
            ],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Produto atualizado com sucesso',
                    produtoAtualizado: {
                        id_produto: req.body.id_produto,
                        nome: req.body.nme_produto,
                        preco: req.body.preco_produto,
                        request: {
                            tipo: 'PATCH',
                            descricao: 'Alterado os dados de um produto',
                            url: 'http://localhost:3000/produtos/' + req.body.id_produto
                        }
                    }
                }
                return res.status(202).send(response);
            }
        )
    });
}
// EXCLUI UM PRODUTO
module.exports.RemoveProduct = async(req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `DELETE FROM ta_produto WHERE id_produto = ?`, [req.body.id_produto],
            (error, resultado, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }

                res.status(202).send({
                    mensagem: 'Produto removido com sucesso'
                });
            }
        )
    });
}