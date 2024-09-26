import 'package:driver_app/Screens/Splash_Screen.dart/Splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp(
      child: SplashScreen()
    
  ));
}
class MyApp extends StatefulWidget {
  final Widget? child;
   MyApp({this.child});
  static void restartApp(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Key key=UniqueKey();
  void restartApp(){
    setState(() {
      key=UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!);
  }
}