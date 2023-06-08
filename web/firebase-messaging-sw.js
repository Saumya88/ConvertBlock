importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

const firebaseConfig = {
    apiKey: "AIzaSyBc_RJ0uC4nQiMXcbjj9eKcgjBGrTOydko",
    authDomain: "push-notifications-saumya.firebaseapp.com",
    projectId: "push-notifications-saumya",
    storageBucket: "push-notifications-saumya.appspot.com",
    messagingSenderId: "976115202744",
    appId: "1:976115202744:web:409aea433fa03f9ad0d24d",
    measurementId: "G-NJ68M98DES"
  };

firebase.initializeApp(
  firebaseConfig
);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});