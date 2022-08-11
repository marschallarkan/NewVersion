import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wonderjoys_2/screens/main_screen.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static  const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 double scrollerPosition = 0 ;
 final store = GetStorage();

onButtonPressed(context){
  store.write('onBoarding', true);
  return Navigator.pushReplacementNamed(context, MainScreen.id);
}
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
        onPageChanged: (val){
          setState((){
            scrollerPosition = val.toDouble();
          });
        },
        children: [
          OnBoardPage(
            boardColumn: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               const Text('Benvenuto\nIn WonderJoyS',
                 textAlign: TextAlign.center,
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                   fontSize: 28
                  ),
               ),
                const Text('+1000 Prodotti\n+100 Categorie\n+20 Marche',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 20
                  ),
                ),
               const SizedBox(
                  height: 20,),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/10.png')),
              ],
            ),
          ),
          OnBoardPage(
            boardColumn: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('7 -14 Giorni di Ritorno',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('Soddisfazione Garantita',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/12.png')),
              ],
            ),
          ),
          OnBoardPage(
            boardColumn: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Trova i tuoi Prodotti\nPreferiti',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 20,),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/13.png')),
              ],
            ),
          ),
          OnBoardPage(
            boardColumn: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Sperimenta Lo Shopping\nIntelligente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 20,),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/11.png'),),
              ],
            ),
          ),
          OnBoardPage(
            boardColumn: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Pagamenti Sicuri\n& Protetti',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/14.png'),),
              ],
            ),
          ),
         ],
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 5,
                position: scrollerPosition,
                  decorator:const DotsDecorator(
                    activeColor: Colors.pink,
                  ) ,
                ),
                scrollerPosition == 4 ? Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,),
                  child: ElevatedButton(
                    style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.pink)
                    ),
                      onPressed: (){
                      onButtonPressed(context);
                      },
                      child: const Text('Inizia a fare Acquisti'),),
                ):
                TextButton(
                  child:const Text('SALTA ALL\' APP >',
                  style: TextStyle(
                    fontSize: 20,
                color: Colors.white,),
                ),
                onPressed: (){
                  onButtonPressed(context);
                },
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),

       ],
      ),
    );

  }
}
class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardPage({Key? key, this.boardColumn}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
      color: Colors.pink.shade800,
      child: Center(child: boardColumn),
    ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: const BoxDecoration(
              color:  Colors.deepPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),topRight: Radius.circular(100),
              )
            ),
          ),
        ),
    ],
    );
  }
}
