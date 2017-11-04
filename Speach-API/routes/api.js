const express = require('express');
const db = require('./db');

const router = express.Router();
db.initDatabase();


router.get('/', function(req, res){

  res.send('Hello World');
});

router.get('/insert', function(req, res){

  db.createEntry("'TEST'", Date.now());
});

router.get('/get/:id', function(req, res){
  
  db.getEntry(res,req.params.id);
});

module.exports = router;
