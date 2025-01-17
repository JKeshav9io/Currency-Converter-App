import 'package:flutter/material.dart';
import 'cureency_converter_material_page.dart';
void main() {
  runApp(const MyApp());
}
// Types Of Widgets
//1. Stateless Widget
//2. Stateful Widget

// 1. Material Design
// 2. Cupertino Design
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: CurrencyConverterMaterialPage(),
    );
  }
}