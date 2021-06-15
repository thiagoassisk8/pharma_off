const http = require('http');
const app = require('./app');
const port = process.env.PORT || 5000; //se a variavel não tiver preenchida vai usar a porta 5000
const server = http.createServer(app);
const dotenv = require('dotenv');

dotenv.config({ path: 'config.env' });
server.listen(port, () => {
    console.log(`O server está rodando na porta ${port}`);
});