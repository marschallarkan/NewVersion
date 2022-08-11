import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wonderjoys_web_admin/screens/category_screen.dart';
import 'package:wonderjoys_web_admin/screens/dashboard_screen.dart';
import 'package:wonderjoys_web_admin/screens/main_category.dart';
import 'package:wonderjoys_web_admin/screens/sub_category_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wonderjoys_web_admin/screens/vendors_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBbsqiE34ahJ6nIyYimVv8sa5qqLI9u_C8",
      appId: "1:603198118350:web:77c57248f538f23ecfb39f",
      messagingSenderId: "603198118350",
      projectId: "wonderjoys-app",
      storageBucket: "wonderjoys-app.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WonderJoyS App Admin',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: const SideMenu(),
      builder: EasyLoading.init(),
    );
  }
}

class SideMenu extends StatefulWidget {
  static const String id = 'side-menu';
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
    Widget _selectedScreen = const DashBoardScreen();
  screenSelector(item){
    switch(item.route){
      case DashBoardScreen.id:
        setState((){
          _selectedScreen = const DashBoardScreen();
        });
      break;
      case CategoryScreen.id:
        setState((){
          _selectedScreen = const CategoryScreen();
        });
        break;
      case MainCategoryScreen.id:
        setState((){
          _selectedScreen = const MainCategoryScreen();
        });
        break;
      case SubCategoryScreen.id:
        setState((){
          _selectedScreen = const SubCategoryScreen();
        });
        break;
      case VendorScreen.id:
        setState((){
          _selectedScreen = const VendorScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('WonderJoyS Admin',style: TextStyle(letterSpacing: 1),),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashBoardScreen.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: IconlyLight.category,
            children: [
              AdminMenuItem(
                title: 'Category',
                route: CategoryScreen.id,
              ),
              AdminMenuItem(
                title: 'Main Category',
                route: MainCategoryScreen.id,
              ),
              AdminMenuItem(
                title: 'Sub Category',
                route: SubCategoryScreen.id,
              ),
            ],
          ),
          AdminMenuItem(
            title: 'Vendors',
            route: VendorScreen.id,
            icon: Icons.group_outlined,
          ),
        ],
        selectedRoute: SideMenu.id,
        onSelected: (item) {
          screenSelector(item);
         /* if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }*/
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child:  Center(
            child:  Text(
              DateTimeFormat.format(DateTime.now(), format: AmericanDateFormats.dayOfWeek),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: _selectedScreen,
      ),
    );
  }
}


