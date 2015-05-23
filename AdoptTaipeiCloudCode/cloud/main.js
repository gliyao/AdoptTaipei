// require("cloud/app.js");

// var twilioAccountSid = 'Your-Twilio-Account-Sid';
// var twilioAuthToken = 'Your-Twilio-Auth-Token';
// var twilioPhoneNumber = 'Your-Twilio-Phone-Number';
// var secretPasswordToken = 'Something-Random-Here';

// var twilio = require('twilio')(twilioAccountSid, twilioAuthToken);

// Parse.Cloud.define("sendCode", function(req, res) {
// 	if (!req.params.phoneNumber || req.params.phoneNumber.length != 10) return res.error('Invalid Parameters');
// 	Parse.Cloud.useMasterKey();
// 	var query = new Parse.Query(Parse.User);
// 	query.equalTo('username', req.params.phoneNumber + "");
// 	query.first().then(function(result) {
// 		var min = 1000; var max = 9999;
// 		var num = Math.floor(Math.random() * (max - min + 1)) + min;

// 		if (result) {
// 			result.setPassword(secretPasswordToken + num);
// 			result.save().then(function() {
// 				return sendCodeSms(req.params.phoneNumber, num);
// 			}).then(function() {
// 				res.success();
// 			}, function(err) {
// 				res.error(err);
// 			});
// 		} else {
// 			var user = new Parse.User();
// 			user.setUsername(req.params.phoneNumber);
// 			user.setPassword(secretPasswordToken + num);
// 			user.setACL({}); 
// 			user.save().then(function(a) {
// 				return sendCodeSms(req.params.phoneNumber, num);
// 			}).then(function() {
// 				res.success();
// 			}, function(err) {
// 				res.error(err);
// 			});
// 		}
// 	}, function (err) {
// 		res.error(err);
// 	});
// });

// Parse.Cloud.define("logIn", function(req, res) {
// 	Parse.Cloud.useMasterKey();
// 	if (req.params.phoneNumber && req.params.codeEntry) {
// 		Parse.User.logIn(req.params.phoneNumber, secretPasswordToken + req.params.codeEntry).then(function (user) {
// 			res.success(user._sessionToken);
// 		}, function (err) {
// 			res.error(err);
// 		});
// 	} else {
// 		res.error('Invalid parameters.');
// 	}
// });

// function sendCodeSms(phoneNumber, code) {
// 	var promise = new Parse.Promise();
// 	twilio.sendSms({
// 		to: '+1' + phoneNumber,
// 		from: twilioPhoneNumber,
// 		body: 'Your login code for AnyPhone is ' + code
// 	}, function(err, responseData) {
// 		if (err) {
// 			console.log(err);
// 			promise.reject(err.message);
// 		} else {
// 			promise.resolve();
// 		}
// 	});
// 	return promise;
// }

Parse.Cloud.afterSave("ATPAnimalDiary", function(request) {
	Parse.Push.send({
		channels: ['global'],
	  data: {
	    alert: request.object.get('message')
	  }
	}, {
	  success: function() {
	  	console.log(request.object.get('message'));
	  	console.log('Ok!');
	  },
	  error: function(error) {
	  	console.log(error);
	  }
	});
});