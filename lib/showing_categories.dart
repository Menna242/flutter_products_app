import 'package:flutter/material.dart';

class ShowingCategories extends StatefulWidget {
  final List<Map> cats;
  final Function(String) updateCategory;

  ShowingCategories(this.cats, {required this.updateCategory, Key? key})
      : super(key: key);

  @override
  _ShowingCategoriesState createState() => _ShowingCategoriesState();
}

class _ShowingCategoriesState extends State<ShowingCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.cats.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (var cat in widget.cats) {
                cat['active'] = false;
              }
              widget.cats[index]['active'] = true;
              widget.updateCategory(widget.cats[index]['txt']);
            });
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
                    color: widget.cats[index]['active']
                        ? Colors.orange
                        : const Color.fromARGB(255, 236, 231, 231),
                  ),
                  child: Icon(
                    widget.cats[index]['icon'],
                    color: widget.cats[index]['active']
                        ? const Color.fromARGB(255, 236, 231, 231)
                        : Colors.black,
                  ),
                ),
                Text(widget.cats[index]['txt']),
              ],
            ),
          ),
        );
      },
    );
  }
}
