<!DOCTYPE html>
<html>
    <head>
        <title>Google Login</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
              crossorigin="anonymous">

    <body class="text-center">
        <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>       
        <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>        
        <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-firestore.js"></script>

        <script type="text/javascript" >
            var firebaseConfig = {
                apiKey: "AIzaSyDkJdyh2ZPJnNXq1_nxQ178PXpHsisKr2Q",
                authDomain: "apis-c62e2.firebaseapp.com",
                databaseURL: "https://apis-c62e2.firebaseio.com",
                projectId: "apis-c62e2",
                storageBucket: "apis-c62e2.appspot.com",
            };
            firebase.initializeApp(firebaseConfig);
        </script>
        <input type="button" onclick="iniciarGoogle()" value="Inciar con Google" />
        <input type="button" onclick="loginWithGithub()" value="Inciar con Github" />

        <script type="text/javascript" >
            function iniciarGoogle()
            {
                var provider = new firebase.auth.GoogleAuthProvider();

                firebase.auth()
                        .signInWithPopup(provider)
                        .then((result) => {
                            var credential = result.credential;
                            var token = credential.accessToken;
                            var user = result.user;
                            console.log(token);
                            console.log(credential);
                            console.log(user);

                            location.href = "Principal.jsp";

                        }).catch((error) => {
                    // Handle Errors here.
                    var errorCode = error.code;
                    var errorMessage = error.message;
                    // The email of the user's account used.
                    var email = error.email;
                    // The firebase.auth.AuthCredential type that was used.
                    var credential = error.credential;
                    // ...
                });
            }

            function loginWithGithub() {

        var provider = new firebase.auth.GithubAuthProvider();       
        firebase.auth().setPersistence(firebase.auth.Auth.Persistence.LOCAL)
                        .then(() => {
                            var provider = new firebase.auth.GithubAuthProvider();
//                            location.href = "Principal.jsp";
                            return  firebase.auth().signInWithPopup(provider);
                             
                        })
                        .catch((error) => {
                            // Handle Errors here.
                            var errorCode = error.code;
                            var errorMessage = error.message;
                        });
            }

//            firebase.auth().onAuthStateChanged((user) => {
//                if (user) {
//                    updateUser(user)
//                } else {
//                }
//            });
        </script>


    </body>
</html>