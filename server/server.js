const http = require('http');
const app = require('./app');
const port = process.env.PORT || 3000; //se a variavel não tiver preenchida vai usar a porta 3000
const server = http.createServer(app);
server.listen(port, () => {
    console.log(`O server está rodando na porta ${port}`);
});