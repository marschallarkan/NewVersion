import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_storage/get_storage.dart';
import 'package:wonderjoys_2/screens/main_screen.dart';
import 'package:wonderjoys_2/screens/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Lato',
      ),
      initialRoute:  SplashScreen.id,
      routes: {
         SplashScreen.id: (context)=>const SplashScreen(),
        OnBoardingScreen.id : (context)=>const OnBoardingScreen(),
        MainScreen.id : (context)=>const MainScreen(),
      },

    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id ='splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final store = GetStorage();

  @override
  void initState() {
    Timer(const Duration(
      seconds: 3
    ),(){
      bool? _boarding = store.read('onBoarding');
      _boarding == null ? Navigator.pushReplacementNamed(context, OnBoardingScreen.id) :
       _boarding == true ? Navigator.pushReplacementNamed(context, MainScreen.id):
      Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays: []);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/ic_launcher.png'),
      ),
    );
  }
}

