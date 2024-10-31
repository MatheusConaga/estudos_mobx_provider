import 'package:flutter/material.dart';
import 'package:mobx_projeto/controller.dart';
import 'package:mobx_projeto/home.dart';
import 'package:mobx_projeto/principal.dart';
import 'package:provider/provider.dart';

void main (){

  runApp(
    MultiProvider(
        providers: [
          Provider(create: (_) => Controller(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        )
    )
  );
}