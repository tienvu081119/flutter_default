
import 'package:design_ui/src/ui/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const initRouter = '/Home';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/Home':
         return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: RouteSettings(name: '/Home'));      
    }
  }
}