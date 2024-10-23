import 'package:flutter/material.dart';



class Product extends StatelessWidget {
  const Product({super.key, required this.product});
  final product;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']) ,
      ),
      body:SafeArea(child: 
      Padding(padding: const EdgeInsets.all(15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is the ${product['title']}",style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          Text("This is ${product['des']} ",
                style: const TextStyle(fontSize: 25)),
          Text("price is ${product['price']}",
                style: const TextStyle(fontSize: 25)),
        ],
      ),
       )),
     
    );
    }}