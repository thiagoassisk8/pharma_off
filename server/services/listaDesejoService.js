
const server = require('../server');
const AppError = require('../utils/AppError');
const bd = require('../bd');
const logado = require('../services/authService');


//-------------------------------------------------------------------------------------------------------
exports.getAllListas = async () => {
  const { rows: list } = await bd.query('SELECT * FROM ta_listadesejos_produtos');
  return list;
};
    
//-------------------------------------------------------------------------------------------------------
exports.getListaDesejo = async req => {
    const { rows: prod } = await bd.query(
      `SELECT * FROM ta_listadesejos_produtos 
      WHERE cod_usuario = $1;`,
      [req.params.cod_usuario]
    );
    if (!prod[0]) throw new AppError('Lista não existe.', 404);
    Object.entries(prod[0]).forEach(([key, value]) => {
      if (value === null) delete prod[0][key];
    });
    return prod[0];
  };


//-------------------------------------------------------------------------------------------------------
// O que fazer: 
//verificar se tem um item repetido, se sim, add na quantidade, 
// senão, adicionar o produto no usuario logado atualmente
//.then(res => console.log(res)).catch(err=>console.log(err.stack));

exports.addProductLista = async req => { 
 produto = req.body.cod_produto;
 usuario = req.body.cod_usuario; 
 qtd = req.body.qtd_produto; 
 
 const retorno = await bd.query(
  `INSERT INTO ta_listadesejos_produtos (cod_produto,cod_usuario , qtd_produto ) VALUES ($1, $2, $3);`,
  [produto,usuario, qtd]
).then(res =>console.log(res)).catch (async function(err){
  console.log('update');
  console.log(err.stack);
   await bd.query(
    `UPDATE ta_listadesejos_produtos SET qtd_produto = qtd_produto + $1 WHERE cod_usuario = $2 AND cod_produto = $3 returning id_listadesejos_produtos;`,
    [qtd,usuario,produto]
  )
}); 
console.log(retorno);

  };

//-------------------------------------------------------------------------------------------------------
  exports.deleteProductLista = async req => {
    console.log('teste');
    const {rowCount} = await bd.query(
      `DELETE FROM ta_listaDesejos_produtos WHERE cod_produto  = $1 and cod_usuario = $2`, 
      [req.body.cod_produto,
      req.body.cod_usuario
    ]);
console.log('teste111');
    if (rowCount != 1) {
        console.log('produto nao existe')
        throw new AppError('Produto não existe.', 404);
      }
  
  };

//-------------------------------------------------------------------------------------------------------
exports.calcularSoma = async req => {
  //detectar o usuario logado atual para adicionar os produtos
    const { rows: prod } = await bd.query(
     ` SELECT SUM(preco_produto * qtd_produto) as Total FROM ta_produto 
     INNER JOIN ta_listaDesejos_produtos on cod_produto=id_produto 
     where cod_usuario = $1  `,
      [req.body.cod_usuario]
    );
    console.log('teste');
    console.log(prod);
    console.log(req.body.cod_usuario);
    if (!prod[0]) throw new AppError('Produto não existe.', 404);
    Object.entries(prod[0]).forEach(([key, value]) => {
      if (value === null) delete prod[0][key];
    });
    return prod[0];
  };