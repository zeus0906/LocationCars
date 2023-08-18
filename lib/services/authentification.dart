import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //Fonction pour se connecter avec google
  Future<UserCredential> connectionGoogle() async{
    //Declencher le flux d'authentification
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    //obtenir les details d'aotorisation de la demande
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //Creer un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //Une fois connecté, renvoyez l'indentifaint de l'utilisateur
    return await _auth.signInWithCredential(credential);
  }

  //l'etat d'utilisateur en temps réel
  Stream<User?> get user => _auth.authStateChanges();

  //Fonction permettant a l'utilisateur de se deconnecter
  Future<void> signOut() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}