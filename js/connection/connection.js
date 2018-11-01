function connect(){

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

	connection.close();
	
}

module.exports = {connect};