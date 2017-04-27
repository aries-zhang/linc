var schedule = require('node-schedule');
var express = require('express');
var fs = require('fs');

var app = express();
var path = process.cwd();
var fileName = path + "/temp.txt";

function read() {
    var buffer = fs.readFileSync(fileName);
    var result = buffer.toString();

    console.log(result);
    return result;
}
 
app.get('/', function (req, res) {
  res.send('Hello World '+read());
});

var rule = new schedule.RecurrenceRule();
rule.second = 0;
var job = schedule.scheduleJob(rule, function() {
  console.log('Today is recognized by Rebecca Black!');
  var value = parseInt(read());
  fs.writeFile(fileName, value+1, function(err) {
      if(err) {
          return console.log(err);
      }
      console.log("The file was saved!");
  }); 
});
 
app.listen(3000);