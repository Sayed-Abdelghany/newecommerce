
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static String id = 'CategoryScreen';
  final String? categoryName;
  CategoryScreen({@required this.categoryName});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List clothes=[
    {'image':"assets/images/b1.jpg",'type':'Casual','price':'800 LE'},
    {'image':"assets/images/b2.jpg",'type':'Classic','price':'700 LE'},
    {'image':"assets/images/b3.jpg",'type':'Classic','price':'400 LE'},
    {'image':"assets/images/b4.jpg",'type':'Casual','price':'650 LE'},
    {'image':"assets/images/b5.jpg",'type':'Casual','price':'750 LE'},
    {'image':"assets/images/b6.jpg",'type':'Classic','price':'820 LE'},
    {'image':"assets/images/b7.jpg",'type':'Casual','price':'640 LE'},
    {'image':"assets/images/b8.jpg",'type':'Casual','price':'500 LE'},
    {'image':"assets/images/b9.jpg",'type':'Casual','price':'580 LE'},
    {'image':"assets/images/b10.jpg",'type':'Classic','price':'900 LE'},
    {'image':"assets/images/b11.jpg",'type':'Casual','price':'350 LE'},
    {'image':"assets/images/b12.jpg",'type':'Classic','price':'470 LE'}

  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.categoryName!),
      ),
      body: GridView.builder(
          itemCount: clothes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,
            childAspectRatio:.7,

          ), itemBuilder: (context,index)
      {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap:(){
//              Navigator.pushNamed(context, 'ProductDetail');
            } ,
            child: Column(
              children: [
                Container(height: height*.2,
                  decoration: BoxDecoration(
                    image: DecorationImage
                      (image: AssetImage(clothes[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Gucci',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text(clothes[index]['type'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(clothes[index]['price'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        );
      }),
    );
  }
}