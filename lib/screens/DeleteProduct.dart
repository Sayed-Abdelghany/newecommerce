import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ecommerce/Model/Categories.dart';
class DeleteProduct extends StatefulWidget {
  static String id = 'DeleteProduct';
  @override
  _DeleteProductState createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: getProducts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List <Order>orders=[];
          if(snapshot.hasData){
            for (var doc in snapshot.data!.docs){
              orders.add(Order(
                id: doc.id,
                name: doc.get('name'),
                size: doc.get('size'),
                price: doc.get('price'),
              ));
            }
          }
          return GridView.builder(
            itemCount: orders.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ), 
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  FirebaseFirestore.instance.collection('Products').doc(orders[index].id).delete();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image:NetworkImage('https://img.freepik.com/free-photo/lady-poses-dressing-room-with-bright-clothes-shoes-girl-beret-lilac-blouse-looking-camera-pink-background_197531-17602.jpg?size=626&ext=jpg'),
                    fit: BoxFit.cover
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orders[index].name!),
                      Text(orders[index].size!),
                      Text(orders[index].price!),
                    ],
                  ),
                ),
              );
              });
        },) ,
    );
  }
  getProducts(){
    return FirebaseFirestore.instance.collection('Products').snapshots();
  }
}
