import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon1/pageList/blocPage.dart';
import 'package:imtihon1/pageList/calendar.dart';
import 'package:imtihon1/pageList/homePage.dart';
import 'package:imtihon1/pageList/lovePage.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  get addPageKey => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'MainFont',
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        // "/more":(context) => MorePage(),
        // "/karta":(context) => Tolovkartalari(),
        // "/kartaqoshish":(context) => TolovkartalariQoshish(),
        // "/keshbek":(context) => Keshbek(),
        // "/sozlama":(context) => Sozlamalar(),
        // "/profil":(context) => ProfilMalumotlari(),
        "/":(context) => WelcomeScreen(),
        "/addpage":(context) => LovePage(addPageKey),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = 0;
  Color bottomMenuColor = Colors.white;
  List<Widget>? pageList;
  HomePage? mainPage;
  Calendar? searchPage;
  LovePage? addPage;
  BlockPage? profilPage;
  // MorePage? morePage;
  var mainPageKey = PageStorageKey("main_page_key");
  var searchPageKay = PageStorageKey("search_page_key");
  var addPageKey = PageStorageKey("add_page_key");
  var morePageKey = PageStorageKey("more_page_key");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainPage = HomePage(mainPageKey);
    searchPage = Calendar(searchPageKay);
    addPage = LovePage(addPageKey);
    // morePage = MorePage();
    profilPage = BlockPage(morePageKey);
    pageList = [mainPage!, searchPage!, addPage!, profilPage!,];
  }

  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList![selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: bottomMenuColor,
        ),
        child: bottomMenu() ,
      ),
    );
  }
  Widget bottomMenu(){
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          // activeIcon: Icon(Icons.home,color: Colors.black,),
          label: "Exploer",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.calendar_today),
          label: "Calendar",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Love",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_split_2x2_fill),
          label: "Accaunt",
          backgroundColor: Colors.white,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (selectedIndexMenu){
        setState(() {
          selectedIndex = selectedIndexMenu;
          if(selectedIndexMenu==1){
            bottomMenuColor = Colors.white;
          }else{
            bottomMenuColor = Colors.white;
          }
        });
      },
    );
  }
}
