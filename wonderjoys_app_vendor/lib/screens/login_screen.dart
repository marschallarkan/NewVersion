import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wonderjoys_app_vendor/screens/landing_screen.dart';




class LoginScreen extends StatelessWidget {
  static const String  id = 'login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return  SignInScreen(
              headerBuilder: (context, constraints, _) {
                return  Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Center(
                        child: Column(
                          children: const [
                            Text(
                              'WonderJoyS App',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text('Vendor',style: TextStyle(fontSize: 20,),),
                          ],
                        ),
                        ),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to WonderJoyS App-Vendor! Please sign in to continue.'
                        : 'Welcome to WonderJoyS App-Vendor! Please create an account to continue',
                  ),
                );
              },
              footerBuilder: (context, _) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,
                  ),
                );
              },
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: '1:603198118350:android:86c270cdceee8c4acfb39f'),
                PhoneProviderConfiguration(),
                FacebookProviderConfiguration(clientId: '1:603198118350:android:86c270cdceee8c4acfb39f')
              ]
          );
        }

        // Render your application if authenticated
        return const LandingScreen();
      },
    );
  }
}
