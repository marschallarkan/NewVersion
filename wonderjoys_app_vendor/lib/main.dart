import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wonderjoys_app_vendor/provider/product_provider.dart';
import 'package:wonderjoys_app_vendor/provider/vendor_provider.dart';
import 'package:wonderjoys_app_vendor/screens/add_product_screen.dart';
import 'package:wonderjoys_app_vendor/screens/home_screen.dart';
import 'package:wonderjoys_app_vendor/screens/login_screen.dart';
import 'package:wonderjoys_app_vendor/screens/product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType= null ;
  runApp(
      MultiProvider(
        providers: [
          Provider<VendorProvider>(create: (_) => VendorProvider()),
          Provider<ProductProvider>(create: (_) => ProductProvider()),
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      routes: {
        LoginScreen.id:(context)=>const LoginScreen(),
        HomeScreen.id:(context)=>const HomeScreen(),
        ProductScreen.id:(context)=>const ProductScreen(),
        AddProductScreen.id:(context)=>const AddProductScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   Timer(const Duration(seconds: 3),(){
     Navigator.pushReplacement(
         context,
         MaterialPageRoute(
             builder: (BuildContext context)=> const LoginScreen(),
         ),
     );
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'WonderJoyS',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            ),
            Text('Vendor',style: TextStyle(fontSize: 20,),),
          ],
        ),
      ),

    );
  }
}

