import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thurry/StoreRegistration_screen.dart';
import 'package:thurry/menuRegistration.dart';
import 'screens/cart_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/map_screen.dart';
import 'screens/reservation_screen.dart';
import 'restauranthome_screen.dart';
import 'package:provider/provider.dart';
import 'package:thurry/thuury_restaurant/model/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      initialRoute: '/',
      routes: {
        '/cart': (context) => const CartScreen(),
        '/register': (context) => const StoreRegistrationScreen(),
        '/': (context) => const IntroScreen(),
        '/map': (context) => const MapScreen(),
        '/restauranthome': (context) => const RestaurantHome(),
        '/menuregister': (context) => const MenuRegistration(),
        '/storeregister': (context) => const StoreRegistrationScreen(),
      },
    );
  }
}
