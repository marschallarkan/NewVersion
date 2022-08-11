import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wonderjoys_2/Widgets/banner_widget.dart';
import 'package:wonderjoys_2/Widgets/brand_highlights.dart';
import 'package:wonderjoys_2/Widgets/category/category_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.pink.shade900,
            elevation: 0,
            centerTitle: true,
            title: const Text('WonderJoyS',style: TextStyle(letterSpacing: 2),),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(IconlyLight.buy))
            ],
          ),
        ),
        body: ListView(
          children:const [
            SearchWidget(),
            SizedBox(height: 10,),
            BannerWidget(),
            BrandHighlights(),
            CategoryWidget(),

          ],
        ),
      );

  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                  hintText: 'Cerca in WonderJoyS',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey,),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(IconlyLight.infoSquare,size: 12,color: Colors.white,),
                  Text(' 100% Autentico', style: TextStyle(color: Colors.white,fontSize: 12,),),
                ],
              ),
              Row(
                children: const [
                  Icon(IconlyLight.infoSquare,size: 12,color: Colors.white,),
                  Text(' 4 - 7 Giorni di Ritorno', style: TextStyle(color: Colors.white,fontSize: 12,),),
                ],
              ),
              Row(
                children: const [
                  Icon(IconlyLight.infoSquare,size: 12,color: Colors.white,),
                  Text(' Marchi Fidati', style: TextStyle(color: Colors.white,fontSize: 12,),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
