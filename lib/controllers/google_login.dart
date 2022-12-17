import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../networking/web.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

Future<void> handleGoogleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}

Future<void> checkGoogleSignIn(context)async
{
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    // can launch login function
    functionStore(account!.displayName.toString(), account.email, '12346',context);
    print(account!.displayName! + " " + account.email + "  " + account.email);
  });
  if(_googleSignIn.currentUser==null)
  {
    handleGoogleSignIn();
    return;
  }
}

