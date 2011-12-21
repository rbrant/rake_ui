var spawn = require('child_process').spawn;
var tail  = spawn("tail", ["-f", "/Users/rbrant/Sites/rake_ui/test/dummy/log/rake.log"]);

http = require('http');
http.createServer(function (req, res) {

  res.writeHead(200, {'Content-Type': "text/plain;charset=UTF-8"});
  tail.stdout.on("data", function (data) {
    res.write(data);
  }); 

}).listen(8000);