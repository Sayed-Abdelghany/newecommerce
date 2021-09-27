import 'package:new_ecommerce/Model/Categories.dart';
import 'package:new_ecommerce/Providers/CartProvider.dart';
import 'package:new_ecommerce/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatefulWidget {
  static String id ='CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartList =  Provider.of<CartsList>(context).cartList;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("ShoppingCart",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: ListView(
          children: [
            Container(
              height: height*.9,
              width: double.infinity,
              child: GridView.builder(
                itemCount:cartList.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context,index)=>Container(
                  child: Column(
                    children: [
                      Container(
                        height: height*.25,
                        width: height*.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 2),
                          image: DecorationImage(
                            image: AssetImage(products[index].image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(products[index].name!,
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(products[index].price!,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurple),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: IconButton(onPressed: (){
                          Provider.of<CartsList>(
                              context,listen: false).removeProduct(products[selectedIndex]);
                        }, icon: Icon(Icons.delete,size: 30,color: Colors.red,)),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
