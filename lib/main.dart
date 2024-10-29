import 'package:flutter/material.dart';
import 'package:gridview/product.dart';
import 'package:gridview/showing_categories.dart';

List<Map> products = [
  {
    // 'img': 'images/img1.png',
    'title': 'product 1',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    // 'img': 'images/img2.png',
    'title': 'product 2',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    // 'img': 'images/img1.png',
    'title': 'product 3',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    // 'img': 'images/img2.png',
    'title': 'product 4',
    'des': 'description ...',
    'price': '340\$'
  },
  // Other products...
];

List<Map> devices = [
  {
    // 'img': 'images/img1.png',
    'title': 'device 1',
    'des': 'description ...',
    'price': '450\$'
  },
  {
    // 'img': 'images/img2.png',
    'title': 'device 2',
    'des': 'description ...',
    'price': '500\$'
  },
  // Other devices...
];
List<Map> Books = [
  {
    // 'img': 'images/img1.png',
    'title': 'book 1',
    'des': 'description ...',
    'price': '450\$'
  },
  {
    // 'img': 'images/img2.png',
    'title': 'book 2',
    'des': 'description ...',
    'price': '500\$'
  },
  // Other books...
];
List<Map> Clothes = [
  {
    // 'img': 'images/img1.png',
    'title': 'clothes 1',
    'des': 'description ...',
    'price': '450\$'
  },
  {
    // 'img': 'images/img2.png',
    'title': 'clothes 2',
    'des': 'description ...',
    'price': '500\$'
  },
  // Other clothes...
];

List<Map> cats = [
  {'icon': Icons.sports_baseball, 'active': false, 'txt': 'Sports'},
  {'icon': Icons.devices, 'active': false, 'txt': 'Devices'},
  {'icon': Icons.book, 'active': false, 'txt': 'Books'},
  {'icon': Icons.local_mall, 'active': false, 'txt': 'Clothes'},
];

enum ProductCategory { Products, Devices,Books,Clothes }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProductCategory selectedCategory = ProductCategory.Products;

  void updateCategory(String category) {
    setState(() {
      switch (category) {
        case 'Devices':
          selectedCategory = ProductCategory.Devices;
          break;
        case 'Books':
          selectedCategory = ProductCategory.Books;
          break;
        case 'Clothes':
          selectedCategory = ProductCategory.Clothes;
          break;
        default:
          selectedCategory = ProductCategory.Products;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbar(),
                SizedBox(height: 20),
                Text("Categories",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 15),
                Container(
                  height: 150,
                  child:
                      ShowingCategories(cats, updateCategory: updateCategory),
                ),
                SizedBox(height: 25),
                Text("Best Selling",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 15),
                Expanded(
                  child: gridview(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return SizedBox(
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
                  Icon(Icons.search, size: 30),
                  Text("search"),
                ],
              ),
            ),
          ),
          const Expanded(flex: 1, child: Icon(Icons.settings)),
        ],
      ),
    );
  }

  Widget gridview() {
    List<Map> selectedProducts ;
       switch (selectedCategory) {
      case ProductCategory.Devices:
        selectedProducts = devices;
        break;
      case ProductCategory.Books:
        selectedProducts = Books;
        break;
      case ProductCategory.Clothes:
        selectedProducts = Clothes;
        break;
      case ProductCategory.Products:
      default:
        selectedProducts = products;
    }
        

     return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,mainAxisExtent:230 ), 
    itemCount: selectedProducts.length,
    
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder:(context,index){
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Product(product: selectedProducts[index])));
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
          Text( selectedProducts[index]['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text( selectedProducts[index]['des'],),
          Text( selectedProducts[index]['price'],style: TextStyle(color: Colors.orange),),
         
    
    
        ],
      ),)));
    });
  }}