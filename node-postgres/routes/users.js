var express = require('express');
var router = express.Router();

router.get('/populate', function(req, res, next) {
  var fs = require('fs');
  
  fs.readFile('data.json', function (err, data) {
    if (err) {
      throw err; 
    }

    var data = JSON.parse(data.toString());

    console.log(data.length);

    for (i = 0; i < data.length; i++) { 
        data[i].id = i+1;
        req.db.query('INSERT INTO usuario (id, nome, sobrenome, email, sexo, ativo, cpf_cnpj, rg_ie, data_nascimento, data_cadastro) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)', 
          [data[i].id, data[i].nome, data[i].sobrenome, data[i].email, data[i].sexo, data[i].ativo, data[i].cpf_cnpj, data[i].rg_ie, data[i].data_nascimento, data[i].data_cadastro]);   
    }
  });
  
  res.json("ok");
});

router.get('/', function(req, res, next) {
  req.db.query('SELECT * FROM usuario ORDER BY id ASC', [], function(err, results) {
    if (err) {
      console.error(err);
      res.statusCode = 500;
      return res.json({ errors: [err] });
    }
    res.json(results.rows || []);
  });
});

router.get('/:id', function(req, res, next) {
  req.db.query('SELECT * FROM usuario where id = $1 ORDER BY id ASC', [Number(req.params.id)], function(err, results) {
    if (err) {
      console.error(err);
      res.statusCode = 500;
      return res.json({ errors: [err]});
    }
    if (results.rows.length === 0) {
      res.statusCode = 404;
      return res.json({ errors: ['User not found'] });
    }
    res.json(results.rows);
  });
});

module.exports = router;
