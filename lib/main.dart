// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gridview/product.dart';
// import 'package:gridview/listofcat.dart';
import 'package:gridview/showing_categories.dart';
// import 'package:flutter/material.dart';

List<Map> products = [
  {
    'img': 'images/img1.png',
    'title': 'product 1',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'images/img2.png',
    'title': 'product 2',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'images/img3.png',
    'title': 'product 3',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'images/img4.png',
    'title': 'product 4',
    'des': 'description ...',
    'price': '340\$'
  },
];

List<Map> cats = [
  {'icon': Icons.sports_baseball, 'active': true, 'txt': 'Sports'},
  {'icon': Icons.devices, 'active': false, 'txt': 'Devices'},
  {'icon': Icons.book, 'active': false, 'txt': 'Books'},
  {'icon': Icons.local_mall, 'active': false, 'txt': 'Clothes'},
];


//-------------------------------------------------------------------------------------------
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        // bottomNavigationBar: bottom,
        body: SafeArea(
          child: Padding(
             padding: const EdgeInsets.all(20),
            child: ListView(
            
              children: [
                appbar(),
                SizedBox(height: 20,),
                
                Text("Categories",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
                SizedBox(
                height: 15,
              ),

                Container(
                 
                  child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 200),
                  child: ShowingCategories(cats )),

                ),
                SizedBox(
                height: 25,
              ),


              Text(
                "Best Selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                
                height: 400,
                child: gridview(),
              )

                
                
              ],
            ),
          ),
        ),
      )


    );
  }

  SizedBox appbar() {
    return SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      
                      height: 50,
                        color: const Color.fromARGB(255, 236, 231, 231),
                        child: const Row(
                          children: [
                            Icon(Icons.search,size: 30,),
                            Text("search"),
                          ],
                        ),
                      
                      ),
                    ),
                    const Expanded(flex: 1,child:  Icon(Icons.settings),
                  )
                   

                  ],
                ),
              );
  }
}

  Widget gridview() {

    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,mainAxisExtent:230 ), 
    itemCount: products.length,
    
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder:(context,index){
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Product(product: products[index])));
        },
      
      
      child: Padding(padding: EdgeInsets.all(10),child: Container(
            decoration: BoxDecoration(
              color:  const Color.fromARGB(255, 236, 231, 231),
              border: Border.all(
                color: Colors.white, // Color of the border (the line)
                width: 1, // Thickness of the border
              ),
              borderRadius: BorderRadius.circular(8), // Optional: rounded corners
            ),
      child: 
      
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
    
          // products[index]['img'],
          Text( products[index]['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text( products[index]['des'],),
          Text( products[index]['price'],style: TextStyle(color: Colors.orange),),
         
    
    
        ],
      ),)));
    });
  }


