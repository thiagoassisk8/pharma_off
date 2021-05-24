const express = require('express');
const app = express();
const morgan = require('morgan');


const rotaProdutos = require('./routes/produtos');
const rotaUsuarios = require('./routes/usuarios');
const rotaPedidos = require('./routes/pedidos');
const bodyParser = require('body-parser');

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use((req,res,next)=>{
    res.header('Acess-Control-Allow-Origin','*') //o * aceita todos os servidores
    res.header(
        'Access-Control-Allow-Header',
        'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      
    );

    if (req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
        return res.status(200).send({});
    }
    next();
});


app.use('/produtos',rotaProdutos);
app.use('/pedidos',rotaPedidos);
app.use('/usuarios',rotaUsuarios);

//Se a rota não for encontrada
app.use((req,res,next) =>{
    const erro = new Error('Não Encontrado');
    erro.status= 404;
    next(erro);
});

app.use((error,req,res,next) =>{
    res.status(error.status || 500);
    return res.send({
        erro:{
            mensagem: error.message
        }
    });
});


module.exports = app;