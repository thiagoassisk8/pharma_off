
const server = require('../server');

const AppError = require('../utils/AppError');
const bd = require('../bd');
const { token } = require('morgan');
const sendEmail = require('../utils/email');

//-------------------------------------------------------------------------------------------------------
exports.getAllForms = async () => {
  const { rows: form } = await bd.query('SELECT * FROM tb_formulario');
  return form;
}
    
  
//-------------------------------------------------------------------------------------------------------

  exports.addForm = async req => { 
    // Inserir produto
    const { rows:createdForm } = await bd.query(
        `INSERT INTO tb_formulario (nme_formulario , cel_formulario ,email_formulario,msg_formulario) VALUES ($1, $2, $3, $4) RETURNING email_formulario;`,

        [
        req.body.nme_formulario,
        req.body.cel_formulario, 
        req.body.email_formulario,
        req.body.msg_formulario,
      ]
    )
        // Mandar email.
    
    const message = `Prezado, ${req.body.nme_formulario},\n\nO relato que você nos enviou foi recebido e logo será analisado por nossa Equipe.\n
Agradeçemos o FeedBack e vamos trabalhar duro para solucionar a sua requisição!\n
Atenciosamente,\n\n\nAtenciosamente,\nEquipe PharmaOFF 
`;
  
    sendEmail({
        email: createdForm[0].email_formulario,
        subject: 'Suporte - PharmaOff',
        message: message,
      });
      console.log('foi')
      
  };

//-------------------------------------------------------------------------------------------------------
