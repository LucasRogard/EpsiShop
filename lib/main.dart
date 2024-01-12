import 'package:epsi_shop/app.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        child: MyApp(),
      create: (_)=> Cart(),
    )
  );
}

