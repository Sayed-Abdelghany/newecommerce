import 'package:new_ecommerce/Model/Categories.dart';
import 'package:flutter/material.dart';

class CartsList extends ChangeNotifier
{
  List<Product>cartList =[];
  addProduct(product){
    cartList.add(product);
    notifyListeners();
  }
  removeProduct(product){
    cartList.remove(product);
    notifyListeners();
  }
}