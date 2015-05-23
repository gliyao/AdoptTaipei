// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'

Parse.initialize(
  'fDLweUfUkd57IZUSCOaLeQqwJV4pDxW0phYfV7Vy',
  'MNmQTvlAEW6E5EGM52Ks8y1N3ikEMF4edrWXjPT9'
);

angular.module('starter', ['ionic', 'ngCordova'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})

.controller('MainCtrl', function($scope, $cordovaCamera) {

  $scope.photo = null;

  $scope.getCamera = function() {
    var options = {
      quality: 70,
      destinationType: Camera.DestinationType.DATA_URL,
      sourceType: Camera.PictureSourceType.CAMERA,
      allowEdit: true,
      encodingType: Camera.EncodingType.JPEG,
      targetWidth: 512,
      targetHeight: 512,
      popoverOptions: CameraPopoverOptions,
      saveToPhotoAlbum: false
    };

    $cordovaCamera.getPicture(options).then(function(imageData) {
      $scope.photo = imageData;
    }, function(err) {
      // error
    });
  };

  $scope.push = function() {
    var parseFile = new Parse.File('image.jpg', { base64: $scope.photo }, 'image/jpeg');
    parseFile.save().then(function() {
      var atpAnimalDiary = new Parse.Object('ATPAnimalDiary');
      atpAnimalDiary.set("message", $scope.message);
      atpAnimalDiary.set("image", parseFile);
      atpAnimalDiary.save().then(function() {
        $scope.photo = '';
        $scope.message = '';
      });
    }, function(error) {
      alert(error);
    });
  };
});