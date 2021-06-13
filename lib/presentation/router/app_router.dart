import 'package:blocpattern/logic/cubit/counter_cubit.dart';
import 'package:blocpattern/presentation/screens/home_screen.dart';
import 'package:blocpattern/presentation/screens/second_screen.dart';
import 'package:blocpattern/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {


  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(title: "Home"));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(title: "Second"));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(title: "Third"));
        break;
      default:
        return null;
    }
  }

  

}
