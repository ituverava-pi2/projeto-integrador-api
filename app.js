const express = require('express')
const app = express()
const morgan = require('morgan')
const bodyParser = require('body-parser')

const tableRoute = require('./routes/table-route');

// Traz no terminal o response que foi retornado pela API
// Traz (VERBO, ROTA, STATUS CODE, TEMPO DE RESPOSTA, ??)
app.use(morgan('dev'))
app.use('/uploads', express.static('uploads'));
app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
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


app.use('/table', tableRoute)
//app.use('/images', imageRoute);


// Se não emcontrar a rota passada
app.use((req, res, next) => {
    const erro = new Error('Rota não encontrada!')
    erro.status = 404
    next(erro)
})

app.use((error, eq, res, next) => {
    res.status(error.status || 500)
    return res.send({
        erro: { 
            mensagem: error.message
        }
    })

})


module.exports = app