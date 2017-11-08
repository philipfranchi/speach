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

router.get('/get_score_sheet/:id', function(req, res){
  db.getScoreSheet(res,req.params.id);
});
router.get('/create_score_sheet', function(req, res){
  db.createScoreSheet(res,'A', 3, "THIS IS A TEST");
});
router.get('/create_task', function(req, res){
  db.createTask(res,'Phone', 'Person 1', 1);
});

module.exports = router;
