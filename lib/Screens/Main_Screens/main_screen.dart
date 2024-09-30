import 'package:driver_app/Screens/Main_Screens/tab_Pages/earning_tab.dart';
import 'package:driver_app/Screens/Main_Screens/tab_Pages/home_tab.dart';
import 'package:driver_app/Screens/Main_Screens/tab_Pages/porfile_tab.dart';
import 'package:driver_app/Screens/Main_Screens/tab_Pages/ratings_tab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex =0;

  onItemClicked(int index){
    setState(() {
      selectedIndex=index;
      tabController!.index=selectedIndex;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4,
     vsync:this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children:const[
          HomeTab(),
          EarningTab(),
          RatingsTab(),
          PorfileTab()
        ], ),
        bottomNavigationBar: 
        BottomNavigationBar(items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Earningd'),
        BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'ratings'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Proile'),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 24),
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
        ),
    );
  }
}