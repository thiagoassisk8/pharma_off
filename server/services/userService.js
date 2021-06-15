const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const server = require('../server');
//const bd = require('../bd').pool;
const AppError = require('../utils/AppError');
const bd = require('../bd');
const { token } = require('morgan');

//-------------------------------------------------------------------------------------------------------
exports.getAllUsers = async () => {
  const { rows: users } = await bd.query('SELECT * FROM tb_usuario');
  return users;
}
    
  
//-------------------------------------------------------------------------------------------------------
  exports.getUser = async req => {
    const { rows: user } = await bd.query(
      `SELECT * FROM tb_usuario 
       WHERE id_usuario = $1;`,
      [req.params.id]
    );
    if (!user[0]) throw new AppError('Usuário não existe.', 404);
    Object.entries(user[0]).forEach(([key, value]) => {
      if (value === null) delete user[0][key];
    });
    return user[0];
  };

//-------------------------------------------------------------------------------------------------------

  exports.addUser = async req => {
    // Gerar hash de senha.
    const senha = await bcrypt.hash(req.body.pwd_usuario, 12);
  
    // Inserir usuário.
    
    const { rows:createdUser } = await bd.query(
        `INSERT INTO tb_usuario (nme_usuario, email_usuario,pwd_usuario) VALUES ($1, $2, $3) RETURNING id_usuario;`,

        [
        req.body.nme_usuario, 
        req.body.email_usuario,
        senha,
      ] );};

//-------------------------------------------------------------------------------------------------------
  exports.deleteUser = async req => {
    const {
      rowCount,
    } = await server.query(`DELETE FROM tb_usuario WHERE id_usuario = $1`, [
      req.params.id,
    ]);
  
    if (!rowCount) throw new AppError('Usuário não existe.', 404);
  };

//-------------------------------------------------------------------------------------------------------
  exports.updateUser = async req => {
    const fields = [req.params.id];
    const str = [];
  
    const filteredUser = filterObj(
      req.body,
      'nme_usuario',
    );
};