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

    var MongoClient = require('mongodb').MongoClient;

    var URL = 'mongodb://localhost:27017/artigo';
    
    MongoClient.connect(URL, function(err, db) {
      var collection = db.collection('users')
      for (i = 0; i < data.length; i++) { 
        data[i].id = i+1;
        collection.insert(data[i], function(err, result) {});
      }
      db.close();
    });
  });
});

router.get('/', function(req, res, next) {
  var collection = req.db.get('users');
  var id = 1;
  var users = [];
  collection.find({},{},function(e,docs){
    res.json(docs || []);
  });
});

router.get('/:id', function(req, res, next) {
  var collection = req.db.get('users');
  collection.find({"id": Number(req.params.id)},{},function(e,docs){
      if (docs.length === 0) {
        res.statusCode = 404;
        return res.json({ errors: ['User not found'] });
      }
      res.json(docs || {});
  });
});

router.post('/', function(req, res, next){
  console.log(req.body);
  var collection = req.db.get('users');
  collection.insert(req.body);
});

module.exports = router;