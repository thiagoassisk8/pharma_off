
const server = require('../server');

const AppError = require('../utils/AppError');
const bd = require('../bd');
const { token } = require('morgan');

//-------------------------------------------------------------------------------------------------------
exports.getAllProductsOferta = async () => {
  const { rows: prod } = await bd.query(
    `select *  from ta_produto 
  inner join categoria on id_categoria=cod_categoria
  inner join tb_estabelecimento on id_estabelecimento=cod_estabelecimento 
  inner join tb_estabelecimentoParceiro on id_estabelecimentoParceiro=id_estabelecimento 
  where isparceiro = true and onsale = true; `,
  );
  console.log(prod);
  return prod;
};
    
//-------------------------------------------------------------------------------------------------------
exports.getAllProducts = async () => {
  const { rows: prod } = await bd.query(
    `select * from ta_produto 
  inner join categoria on id_categoria=cod_categoria
  inner join tb_estabelecimento on id_estabelecimento=cod_estabelecimento 
  inner join tb_estabelecimentoParceiro on id_estabelecimentoParceiro=id_estabelecimento 
  where isparceiro = true; `,
  );
  return prod;
};

//-------------------------------------------------------------------------------------------------------
  exports.getProductOferta = async req => {
    const { rows: prod } = await bd.query(
      `select * from ta_produto 
    inner join categoria on id_categoria=cod_categoria
    inner join tb_estabelecimento on id_estabelecimento=cod_estabelecimento 
    inner join tb_estabelecimentoParceiro on id_estabelecimentoParceiro=id_estabelecimento 
    where isparceiro = true and id_produto = $1;`,
      [req.params.id_produto]
    );
    if (!prod[0]) throw new AppError('Produto não existe.', 404);
    Object.entries(prod[0]).forEach(([key, value]) => {
      if (value === null) delete prod[0][key];
    });
    return prod[0];
  };
//-------------------------------------------------------------------------------------------------------


  exports.addProductOferta = async req => { 
    // Inserir produto
    const { rows:createdUser } = await bd.query(
        `INSERT INTO ta_produto (nme_produto , preco_produto ,desc_produto,cod_categoria,cod_estabelecimento) 
        VALUES ($1, $2, $3, $4, $5);`,
        [
        req.body.nme_produto, 
        req.body.preco_produto,
        req.body.desc_produto,
        req.body.cod_categoria,
        req.body.cod_estabelecimento,
      ]); 
  };
//-------------------------------------------------------------------------------------------------------

  exports.deleteProductOferta = async req => {
    const {
      rowCount,
    } = await server.query(`DELETE FROM ta_produto WHERE id_produto = $1 and cod_estabelecimento =$2;`, [
      req.params.id_produto,
      req.params.cod_estabelecimento,
    ]);
  
    if (!rowCount) throw new AppError('Produto não existe.', 404);
  };
//-------------------------------------------------------------------------------------------------------

  exports.updateProductOferta = async req => {
    const fields = [req.params.id];
    const str = [];
  
    const filteredUser = filterObj(
      req.body,
      'nme_produto ',
    );
};