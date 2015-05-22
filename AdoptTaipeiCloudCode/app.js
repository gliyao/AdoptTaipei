var express = require("express");
var app = express();

app.set('views', 'cloud/views');
app.set('view engine', 'ejs');
app.use(express.bodyParser());

app.get('/', function(req, res) {
  res.render("index.ejs", {})
});

app.post('/', function(req, res) {
  var form = req.body;
  var phoneNumber = form.phoneNumber;

  if(phoneNumber) {
    phoneNumber = phoneNumber.replace(/\D/g, '');
    if(phoneNumber.length != 10) {
      res.render("index.ejs", {warning: "You must enter a 10-digit US phone number including area code."});
    }
    Parse.Cloud.run("sendCode", {phoneNumber: phoneNumber}).then(function(response){
      if(response){
        res.render("verify.ejs", {phoneNumber: phoneNumber});
      } else {
        res.render("index.ejs", {warning: "Something went wrong. Please check your Twilio configuration."});
      }
    }, function(error){
    res.render("index.ejs", {warning: "Something went wrong. Please try again."});
    });
  } else { 
    res.render("index.ejs", {warning: "You forgot to enter your mobile number."})
  }
});

app.get('/verify', function(req, res){
  res.redirect("/");
})

app.post('/verify', function(req, res){
  var form = req.body;
  var code = form.code;
  var phoneNumber = form.phoneNumber;

  if(code) {
    code = code.replace(/\D/g, '');
    if(code.length != 4) {
      res.render("verify.ejs", {warning: "You must enter a 4 digit code texted to your phone number."});
    }
    Parse.Cloud.run("logIn", {codeEntry: code, phoneNumber: phoneNumber}).then(function(response){
      var sessionToken = response;
      Parse.User.become(sessionToken).then(function (user) {
        res.redirect('/dashboard/' + sessionToken)
      }, function (error) {
        res.redirect('/');
      });

    }, function(error) {
      res.render("verify.ejs", {phoneNumber: phoneNumber, warning: "Something went wrong. Please try again."});
    });
  } else {
    res.render("verify.ejs", {phoneNumber: phoneNumber, warning: "That verification code is not valid."});
  }
});

app.get('/dashboard/:sessionToken', function(req, res) {
  var sessionToken = req.params.sessionToken;

  Parse.User.become(sessionToken).then(function (user) {
    console.log("logged in as user");
    res.render("dashboard.ejs", {
      sessionToken: sessionToken,
      phoneNumber: user.get("username"), 
      name: user.get("name"),
      setting1: user.get("setting1"),
      setting2: user.get("setting2"),
      setting3: user.get("setting3"),
    });
  }, function (error) {
    console.log("couldn't log in as user");
    res.redirect("/");
  });
});

app.post('/dashboard', function(req, res) {
  var form = req.body;

  var sessionToken = form.sessionToken;

  var name = form.name;

  var setting1 = form.setting1;
  var setting2 = form.setting2;
  var setting3 = form.setting3;

  Parse.User.become(sessionToken).then(function (user) {
    user.set("name", name);
    user.set("setting1", (setting1 !== undefined && setting1 == "on")?true:false);
    user.set("setting2", (setting2 !== undefined && setting2 == "on")?true:false);
    user.set("setting3", (setting3 !== undefined && setting3 == "on")?true:false);
    user.save().then(function(user) {
      res.render("dashboard.ejs", {
        sessionToken: sessionToken,
        phoneNumber: user.get("username"), 
        name: user.get("name"),
        setting1: user.get("setting1"),
        setting2: user.get("setting2"),
        setting3: user.get("setting3"),
      });
    }, function(error) {
      console.log(error);
      res.redirect("/");
     });
  }, function (error) {
    console.log(error);
    res.redirect("/");
  });

});

app.listen();
