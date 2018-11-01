var Connection = require('tedious').Connection;
var Request = require('tedious').Request;

var config = {
  server: 'projeto-debugger.database.windows.net',
  userName: 'debugger.tec',
  password: '@Bestlab'
  
  ,options: {
    debug: {
      packet: true,
      data: true,
      payload: true,
      token: false,
      log: true
    },
    database: 'cliente-debugger.tec',
    encrypt: true // for Azure users
  }
  
};

var connection = new Connection(config);

connection.on('connect', function(err) {
    // If no error, then good to go...
    executeStatement();
  }
);

connection.on('debug', function(text) {
    //console.log(text);
  }
);

function executeStatement() {
  request = new Request(`insert into '${nome}' `, function(err, rowCount) {
    if (err) {
      console.log(err);
    } else {
      console.log(rowCount + ' rows');
    }

    connection.close();
  });

  request.on('row', function(columns) {
    columns.forEach(function(column) {
      if (column.value === null) {
        console.log('NULL');
      } else {
        console.log(column.value);
      }
    });
  });

  request.on('done', function(rowCount, more) {
    console.log(rowCount + ' rows returned');
  });

  // In SQL Server 2000 you may need: connection.execSqlBatch(request);
  connection.execSql(request);
}