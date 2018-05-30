import firebase from "firebase";
var config = {
    apiKey: "AIzaSyDVy_QyqIbNSXM-ztw452LBkhFj9rU_dGo",
    authDomain: "vorpalcoin.firebaseapp.com",
    databaseURL: "https://vorpalcoin.firebaseio.com",
    projectId: "vorpalcoin",
    storageBucket: "vorpalcoin.appspot.com",
    messagingSenderId: "861789360516"
};

export default firebase.initializeApp(config);