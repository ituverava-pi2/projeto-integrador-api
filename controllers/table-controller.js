const mysql = require('../mysql');

exports.getData = async (req, res, next) => {
    try {
        const query = `SELECT c.cid_id, c.cid_nome, t.tab_codigo, t.tab_numero_casos, 
                       t.tab_confirmados, t.tab_analise, t.tab_obitos, t.tab_imagem 
                       FROM tabela t
                       LEFT OUTER JOIN cidades c ON t.cid_id = c.cid_id
                       order by tab_id;`;
        const results = await mysql.execute(query);

        if (results.length < 1) {
            return res.status(401).send({
                status: 'error',
                data: "Nenhum dado cadastrado!"
            });
        } else {
            const response = {
                data: results.map(tab => {
                    return {
                        id: tab.tab_codigo,
                        cidade: tab.cid_nome,
                        casos: tab.tab_numero_casos,
                        confirmados: tab.tab_confirmados,
                        analise: tab.tab_analise,
                        obitos: tab.tab_obitos,
                        imagem: tab.tab_imagem,
                        criacao: tab.tab_data_criacao,
                        modificacao: tab.tab_data_modificacao,
                    }
                })
            }

            // let index = 0;
            // while (index <= results.length) {
            //     const response = {
            //         id: results[index].cid_id,
            //         cidade: results[index].cid_nome,
            //         casos: results[index].tab_numero_casos,
            //         confirmados: results[index].tab_confirmados,
            //         confirmados: results[index].tab_confirmados,
            //         analise: results[index].tab_analise,
            //         obitos: results[index].tab_obitos,
            //     }
            //     index++;
            // }            
            return res.status(200).send(response);

        }
    } catch (error) {
        console.log(error);
        return res.status(500).send({ erro: error });
    }
};

exports.getDataCity = async (req, res, next) => {
    try {
        let name = '';
        if (req.query.name) {
            name = req.query.name;    
        }
    
        const query = `SELECT c.cid_id, c.cid_nome, t.tab_codigo, t.tab_numero_casos, t.tab_confirmados, 
                       t.tab_analise, t.tab_obitos, t.tab_imagem
                       FROM tabela t
                       LEFT OUTER JOIN cidades c ON t.cid_id = c.cid_id
                       WHERE t.cid_id = ?
                       order by tab_id;`;
        const result = await mysql.execute(query, [req.params.cid_id]);
        const response = {
                id: result[0].cid_id,
                cidade: result[0].cid_nome,
                casos: result[0].tab_numero_casos,
                confirmados: result[0].tab_confirmados,
                analise: result[0].tab_analise,
                obitos: result[0].tab_obitos,
                imagem: result[0].tab_imagem,
        }
        return res.status(200).send(response);
    } catch (error) {
        console.log(error);
        return res.status(500).send({ error: error });

    }
};


