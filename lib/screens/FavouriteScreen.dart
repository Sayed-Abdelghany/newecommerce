
import 'package:new_ecommerce/Providers/FavProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavouriteScreen extends StatefulWidget {
  static String id = 'FavouriteScreen';
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    var favList =  Provider.of<FavouriteList>(context).favList;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite List",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: height*.9,
        width: double.infinity,
        child: GridView.builder(
          itemCount: favList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context,index)=>Container(
            height: height*.3,
            width: height*.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(favList[index].image!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),

          ),
        ),
      ),
    );
  }
}
