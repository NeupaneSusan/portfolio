
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyAu-HrjwJkldtP9DVqwsJXifsrH2qgKAwM",
    authDomain: "susan-portfoilo.firebaseapp.com",
    projectId: "susan-portfoilo",
    storageBucket: "susan-portfoilo.appspot.com",
    messagingSenderId: "61169632604",
    appId: "1:61169632604:web:38fa9f421d1e18470a6d99",
    measurementId: "G-8SCELBKXJ6"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);




