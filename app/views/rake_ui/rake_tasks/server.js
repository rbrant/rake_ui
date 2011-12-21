var app = require('http').createServer(handler)
   , io = require('socket.io').listen(app)
   , fs = require('fs')

app.listen(8000);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }
    res.writeHead(200);
    res.end(data);
  });
}

io.sockets.on('connection', function (socket) {
	var spawn = require('child_process').spawn;
	var tail = spawn("tail", ["-f", "/Users/rbrant/Sites/rake_ui/spec/dummy/log/rake.log"]);
	
  tail.stdout.on("data", function (data) {
    socket.emit('tail', { tail : data.toString('utf-8') } )
  });
});

console.log('Log Server running now at http://[HOSTNAME]:8000/ in your browser');