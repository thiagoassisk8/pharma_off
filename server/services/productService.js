
const server = require('../server');

const AppError = require('../utils/AppError');
const bd = require('../bd');
const { token } = require('morgan');

//-------------------------------------------------------------------------------------------------------
exports.getAllProducts = async () => {
  const { rows: prod } = await bd.query('SELECT * FROM ta_produto');
  return prod;
}
    
  
//-------------------------------------------------------------------------------------------------------
  exports.getProduct = async req => {
    const { rows: prod } = await bd.query(
      `SELECT * FROM ta_produto
       WHERE id_produto = $1;`,
      [req.params.id]
    );
    if (!prod[0]) throw new AppError('Produto não existe.', 404);
    Object.entries(prod[0]).forEach(([key, value]) => {
      if (value === null) delete prod[0][key];
    });
    return prod[0];
  };

//-------------------------------------------------------------------------------------------------------

  exports.addProduct = async req => { 
    // Inserir produto
    const { rows:createdUser } = await bd.query(
        `INSERT INTO ta_produto (id_produto,nme_produto , preco_produto ,desc_produto) VALUES ($1, $2, $3, $4) RETURNING id_produto;`,

        [
        req.body.id_produto,
        req.body.nme_produto, 
        req.body.preco_produto,
        req.body.desc_produto,
      ]
    ); 
  };

//-------------------------------------------------------------------------------------------------------
  exports.deleteProduct = async req => {
    const {
      rowCount,
    } = await server.query(`DELETE FROM ta_produto WHERE id_produto = $1`, [
      req.params.id,
    ]);
  
    if (!rowCount) throw new AppError('Produto não existe.', 404);
  };

//-------------------------------------------------------------------------------------------------------
  exports.updateProduct = async req => {
    const fields = [req.params.id];
    const str = [];
  
    const filteredUser = filterObj(
      req.body,
      'nme_produto ',
    );
};
<<<<<<< HEAD

//-------------------------------------------------------------------------------------------------------

// Busca de produtos na categoria de remedios
exports.getProductRemedios = async req => {
  const { rows: prod } = await bd.query(
    `select id_produto,nme_produto,preco_produto,categoria_produto,nme_estabelecimento,isparceiro from ta_produto 
  inner join categoria on id_categoria=1
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
// Busca de produtos na categoria de higiene
exports.getProductHigiene = async req => {
  const { rows: prod } = await bd.query(
    `select id_produto,nme_produto,preco_produto,categoria_produto,nme_estabelecimento,isparceiro from ta_produto 
  inner join categoria on id_categoria=2
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
// Busca de produtos na categoria de Cuidados pele e higiene
exports.getProductCuidados = async req => {
  const { rows: prod } = await bd.query(
    `select id_produto,nme_produto,preco_produto,categoria_produto,nme_estabelecimento,isparceiro from ta_produto 
  inner join categoria on id_categoria=3
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
=======
//-------------------------------------------------------------------------------------------------------
// Busca de produtos na categoria de remedios
exports.getProductCategoria = async req => {
  const { rows: prod } = await bd.query(
    `select * from ta_produto WHERE cod_categoria = $1;`,
  [req.params.cod_categoria]
  );
  console.log(prod);
  return prod;
};

//-------------------------------------------------------------------------------------------------------
// Busca de produtos na categoria de remedios
exports.getAllProductRemedios = async req => {
  const { rows: prod } = await bd.query(
    `select * from ta_produto WHERE cod_categoria = 1;`,
  );
  console.log(prod);
  return prod;
};

//-------------------------------------------------------------------------------------------------------
// Busca de produtos na categoria de Higiene
exports.getAllProductHigiene = async req => {
  const { rows: prod } = await bd.query(
    `select * from ta_produto WHERE cod_categoria = 2;`,
  );
  console.log(prod);
  return prod;
};

//-------------------------------------------------------------------------------------------------------
// Busca de produtos na categoria de Cuidado e Peles
exports.getAllProductCuidado = async req => {
  const { rows: prod } = await bd.query(
    `select * from ta_produto WHERE cod_categoria = 3;`,
  );
  console.log(prod);
  return prod;
};
//-------------------------------------------------------------------------------------------------------
// Busca de produtos que estão populares
exports.getAllProductsPopular = async () => {
  const { rows: prod } = await bd.query('SELECT * FROM ta_produto WHERE ispopular = true');
  return prod;
}
>>>>>>> eedc2ae4b807d294f6f185a1b5bdd086e7ba8f7a
