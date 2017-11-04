const mysql = require('mysql');
const utils = require('../utils');

const tableName = 'testSpeach';

const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'dev',
  password : 'Starwars456',
  database : 'Speach'
});


function initDatabase() {

  connection.connect()

  /*Instantiate Table*/
  connection.query(
    `CREATE TABLE IF NOT EXISTS ${tableName} (
        ID int NOT NULL AUTO_INCREMENT,
        Monologue LONGTEXT NOT NULL,
        CreatedAt TIMESTAMP NOT NULL,
        PRIMARY KEY (ID)
    );`,
    function (err, rows, fields) {
      if (err) throw err;
    }
  );
}


function createEntry(monologue, createdAt) {

  connection.query(
    `INSERT INTO ${tableName} (Monologue, CreatedAt)
     VALUES (?, ?)`,
    [monologue, createdAt],
    function (err, results, fields) {
      if (err) throw err;
      console.log('Recieved: ', results[0])
    }
  );

}

function getEntry(res, id) {

  connection.query(
    `SELECT *
    FROM ${tableName}
    WHERE ID = ?;`,
    [id],
    function(err, results, fields){
      if(err) throw err;
      res.send(utils.constructHistogram(results[0].Monologue));
    }
  );
}


module.exports = {
  initDatabase,
  createEntry,
  getEntry,
};
