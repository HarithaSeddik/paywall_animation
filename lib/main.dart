import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paywall_challenge/constants/theme_constants.dart';
import 'package:paywall_challenge/views/home_screen.dart';

import 'cubits/button_switch/button_switch_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paywall Challenge :)',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: ThemeConstants.customTextTheme, // apply custom text themes
        fontFamily: _getFontFamily(),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  //depending on which platform is running the app, return the relevant font
  String? _getFontFamily() {
    if (Platform.isIOS) {
      return 'SF_UI';
    } else if (Platform.isAndroid) {
      return 'Roboto';
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17171B),
      // BlocProvider connects our cubit to our context at the top of the tree, allowing us to access the same cubit instance anywhere in our (context) widget tree
      body: BlocProvider(
        create: (context) => ButtonSwitchCubit(),
        child: const HomeScreenWidget(),
      ),
    );
  }
}
