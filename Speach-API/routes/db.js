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


function getTaskId(callback, taskTypeName) {
  /*Get the Task Type*/
  connection.query(
    `SELECT task_type_id FROM TaskTypes WHERE task_type_name = ?;`,
    [taskTypeName],
    function(err, results, fields ) {
      if(err) throw err;
      callback(results);
    });
}

function getParticipantId(callback, participantName) {
  /*Get the Participant Name*/
  connection.query(
    `SELECT participant_id FROM Participants WHERE participant_name = ?;`,
    [participantName],
    function(err, results, fields ) {
      if(err) throw err;
      callback(results);
    });
}

function createTask(res, taskTypeName, participantName, user) {
  /*Get the Participant Name*/
  connection.query(
    `SELECT participant_id FROM Participants WHERE participant_name = ?;`,
    [participantName],
    function(err, participantResults, fields ) {
      if(err) {
        res.send("Failed to find participants");
        throw err;
      }
      participantId = participantResults[0].participant_id;
      /*Get the Task Type*/
      connection.query(
        `SELECT task_type_id FROM TaskTypes WHERE task_type_name = ?;`,
        [taskTypeName],
        function(err, taskTypeResults, fields ) {
          if(err) {
            res.send("Failed to find Task Type");
            throw err;
          }
          taskTypeId = taskTypeResults[0].task_type_id;
          /*Create the Task */
          connection.query(
            `INSERT INTO
             Tasks (participant_id, task_type_id, user_id)
             VALUES (?, ?, ?)`,
            [participantId, taskTypeId, (user ? user : 'NULL')],
            function(err, results, fields ) {
              if(err) throw err;
              res.send(results);
            });
        });
    });
}







//SCORE SHEET STUFF
function createScoreSheet(
  res,
  key,
  task_id,
  oTranscription,
 ) {
    connection.query(
      `INSERT INTO
       Speach.ScoreSheets(
        scoresheet_key,
        task_id,
        original_transcription,
        scored_transcription,
        created_at,
        update_at)
      VALUES(?, ?, ?, ?, CURRENT_TIMESTAMP, '0000-00-00 00:00:00');`,
      [key, task_id, oTranscription, oTranscription],
      function(err, result, fields) {
        console.log(result);
        res.send(result);
      }
    );
}

function getScoreSheet(res, id) {

  connection.query(
    `SELECT *
     FROM ScoreSheets
     WHERE scoresheet_id = ?;`,
    [id],
    function(err, results, fields){
      if(err) throw err;
      res.send(results[0]);
      console.log(results)
    }
  );
}


module.exports = {
  initDatabase,
  createEntry,
  createTask,
  getScoreSheet,
  createScoreSheet
};
