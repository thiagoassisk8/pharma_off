const express = require('express');
const app = express();
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const path = require('path');
const AppError = require('./utils/AppError');
const globalErrorHandler = require('./controllers/errorController');

app.use(express.json({ limit: '10kb' }));
app.use(cookieParser());
app.use(express.static(__dirname));

//app.get('/', (req, res) => {
//    res.sendFile(path.join(__dirname, '../frontend/app_front/lib/main.dart'));
//  });

// ROTAS
const userRouter = require('./routes/userRouter');
const productRouter= require('./routes/productRouter');
const listaDesejoRouter= require('./routes/listaDesejoRouter');
const formRouter= require('./routes/formRouter');
const bodyParser = require('body-parser');

app.use(morgan('dev'));
app.use('/uploads', express.static('uploads'));
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

// const csp = require('express-csp-header');
// app.use(csp({
//     policies: {
//         'default-src': [csp.NONE],
//         'img-src': [csp.SELF],
//     }
// }));

app.use('/usuarios',userRouter);
app.use('/produtos',productRouter);
app.use('/listaDesejos',listaDesejoRouter);
app.use('/formulario',formRouter);

app.all('*', (req, res, next) =>
  next(new AppError(`A rota ${req.originalUrl} não existe!`))
);

app.use(globalErrorHandler);

module.exports = app;