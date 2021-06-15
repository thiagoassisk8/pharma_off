const bd = require('../bd');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { promisify } = require('util');
const AppError = require('../utils/AppError');
const sendEmail = require('../utils/email');


//-------------------------------------------------------------------------------------------------------
// Autentificação de tokens
const signToken = userId =>
  jwt.sign({ userId }, process.env.JWT_TOKEN, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

const createSendToken = (userId, res) => {
    const token = signToken(userId); 
    const cookieOptions = {
      expires: new Date(
        Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000 //24h
      ),
      httpOnly: true,
    };
    if (process.env.NODE_ENV === 'production') cookieOptions.secure = true;
    res.cookie('jwt', token, cookieOptions);
    return token;
  };
  const comparePassword = async (requestPass, userPass) =>
  await bcrypt.compare(requestPass, userPass);

//-------------------------------------------------------------------------------------------------------
  
exports.cadastro = async (req, res) => {
    // Gerar hash de senha.
    const senha = await bcrypt.hash(req.body.pwd_usuario, 12);
    // Inserir usuário.
    const { rows: usuarios } = await bd.query(
        `INSERT INTO tb_usuario (nme_usuario, email_usuario,pwd_usuario) VALUES ($1, $2, $3) returning id_usuario;`,
      [
        req.body.nme_usuario,
        req.body.email_usuario,
        senha,
      ]
    );
      console.log('teste : criou o usuario'+usuarios);

    // Cria uma Lista de desejos para o usuário assim que ele é criado
    
    // await bd.query(
    //   'INSERT INTO tb_listadesejos_produtos (cod_usuario) VALUES ($1) ;',
    //   [usuarios[0].id_usuario]
    // );
    // console.log('teste: criou a listaDesejos '+ usuarios);
    return createSendToken(usuarios[0].id_usuario, res);
  };
  //-------------------------------------------------------------------------------------------------------
// LOGIN
exports.login = async (req, res) => {
  const email = req.body.email_usuario;
  const password = req.body.pwd_usuario;
   if (!email || !password) {
     throw new AppError('Por favor, digite seu email e sua senha.', 400);
   }
  const { rows: user} = await bd.query(
    `SELECT id_usuario, email_usuario, pwd_usuario FROM tb_usuario WHERE email_usuario = $1;`,
    [email]
      );
  
 
  if (!user[0] || !(await comparePassword(password, user[0].pwd_usuario)))
    throw new AppError('Email ou senha incorreta.', 401);

  return createSendToken(user[0].id_usuario, res) ;
 
};

//-------------------------------------------------------------------------------------------------------
  // ESQUECEU A SENHA
  exports.esqueceuSenha = async req => {
    const  email  = req.body.email_usuario;
  
    if (!email) throw new AppError('Por favor, digite seu email.', 400);
  
    const {rows: user} = await bd.query(
      `SELECT * FROM tb_usuario WHERE email_usuario = $1;`,
      [email]
    );
    if (!user[0]) throw new AppError('Não existe uma conta com este email!', 404);
  
    // Criando token para mandar para resetar senha.
    // esse token será enviado pro email do usuário.
    const resetToken = crypto.randomBytes(32).toString('hex');
  
    // Encryptar o token gerado para ser guardado no banco de dados.
    const encryptResetToken = crypto
      .createHash('sha256')
      .update(resetToken)
      .digest('hex');
  
    const passwordResetExpires = Date.now() + 30 * 60 * 1000; // 30min
  
    await bd.query(
      'INSERT INTO senhatokenreset (id_token, nme_token, expira_token) VALUES ($1,$2,$3);',
      [user[0].id_usuario, encryptResetToken, passwordResetExpires]
    );
  
    // Mandar email.
    const resetURL = `${req.protocol}://${req.get(
      'host'
    )}/usuarios/resetSenha/${resetToken}`;
  
    const message = `Redefinição de senha \nA redifinição de senha foi solicitada e foi gerada um Token válido por 30 minutos para a redefinição de senha.\n\nToken:
     ${resetToken}\n\nPor favor verifique no aplicativo PharmaOFF a aba para redefinir a sua senha a partir do Token gerado!\n\nAtenção:\nO token para solicitar a senha é válido por 30 minutos após a realização do seu pedido apresentado neste e-mail.\nCaso V.Sa. perca o prazo de validade do mesmo, por favor repetir a solicitação.\n\nAtenciosamente,\nEquipe PharmaOFF 
`;
  
    try {
      sendEmail({
        email: user[0].email_usuario,
        subject: 'Recuperação de senha - PharmaOff (válido por 30 min).',
        message: message,
      });
    } catch (err) {
      await bd.query(
        'DELETE FROM senhatokenreset WHERE id_token = $1;',
        user[0].id_usuario
      );
    }
  };
//-------------------------------------------------------------------------------------------------------
// RESETAR SENHA
  exports.resetSenha = async (req, res) => {
    const { token } = req.params;
    const senha = req.body.pwd_usuario;
  
  
    const hashedToken = crypto.createHash('sha256').update(token).digest('hex');
  
    const {rows: user} = await bd.query(
      'SELECT * FROM senhatokenreset WHERE nme_token = $1;',
      [hashedToken]
    );

    // Indetificar se token existe e se ainda é válido.
    if (!user[0] || Date.now() > user[0].expira_token)
      throw new AppError('Token inválido ou expirado!', 400);
  
    // Gerar hash de senha.
    const hashedPassword = await bcrypt.hash(senha, 12);
  
    // Altera a senha com um update
    await bd.query(
      'UPDATE tb_usuario SET pwd_usuario = $1, pwd_changed = $2 WHERE id_usuario = $3;',
      [hashedPassword, Date.now(), user[0].id_token]
    );
  
    await bd.query('DELETE FROM senhatokenreset WHERE id_token = $1;', [
      user[0].id_token,
    ]);
  
    return createSendToken(user[0].id_token, res);
  };
  //-------------------------------------------------------------------------------------------------------
  
  exports.protect = async req => {
    let token;
  
    if (
      req.headers.authorization &&
      req.headers.authorization.startsWith('Bearer')
    ) {
      token = req.headers.authorization.split(' ')[1];
    } else if (req.cookies.jwt) {
      token = req.cookies.jwt;
    }
  
    if (!token) {
      throw new AppError(
        'Você não está logado! Por favor, entre na sua conta para ter acesso.',
        401
      );
    }
    // Verification token
    const decoded = await promisify(jwt.verify)(token, process.env.JWT_TOKEN);
  
    const {
      rows: user,
    } = await bd.query(`SELECT * FROM tb_usuario WHERE id_usuario = $1`, [
      decoded.userId,
    ]);
  
    if (!user[0]) {
      throw new AppError('Não existe nenhum usuário com este token.', 401);
    }
  
    return user[0];
  };