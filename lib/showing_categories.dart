import 'package:flutter/material.dart';

Widget ShowingCategories(cats){
  return ListView.builder(
        itemCount: cats.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              !cats[index]['active'];
            },

          
         child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:cats[index]['active']? Colors.orange:const Color.fromARGB(255, 236, 231, 231),
                  
                  ),
                  child: Icon(cats[index]['icon'],color:cats[index]['active']? const Color.fromARGB(255, 236, 231, 231)
                        : Colors.black),

                  
                ),
                Text(cats[index]['txt'])
              ],
            ),
          ));
        });
  }
