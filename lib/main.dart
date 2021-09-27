import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ecommerce/Providers/CartProvider.dart';
import 'package:new_ecommerce/Providers/FavProvider.dart';
import 'package:new_ecommerce/Providers/ThemeProvider.dart';
import 'package:new_ecommerce/screens/AddProduct.dart';
import 'package:new_ecommerce/screens/AddProductScreen.dart';
import 'package:new_ecommerce/screens/AdminPanelScreen.dart';
import 'package:new_ecommerce/screens/AdminScreen.dart';
import 'package:new_ecommerce/screens/CartScreen.dart';
import 'package:new_ecommerce/screens/CategoryScreen.dart';
import 'package:new_ecommerce/screens/DeleteProduct.dart';
import 'package:new_ecommerce/screens/FavouriteScreen.dart';
import 'package:new_ecommerce/screens/ForgetPassScreen.dart';
import 'package:new_ecommerce/screens/HomeScreen.dart';
import 'package:new_ecommerce/screens/ProductDetails.dart';
import 'package:new_ecommerce/screens/SignInScreen.dart';
import 'package:new_ecommerce/screens/SignUpScreen.dart';
import 'package:new_ecommerce/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constants/Theme.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>ThemeProvider()),
            ChangeNotifierProvider(create: (context)=>FavouriteList()),
            ChangeNotifierProvider(create: (context)=>CartsList()),
          ],
          child: MyApp())
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=> MaterialApp(
          theme: Provider.of<ThemeProvider>(context).isLight ==true?lightMode: darkMode,
          debugShowCheckedModeBanner: false,
          initialRoute: AdminScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            CategoryScreen.id: (context) => CategoryScreen(),
            ProductDetails.id: (context) => ProductDetails(),
            FavouriteScreen.id:(context)=> FavouriteScreen(),
            CartScreen.id:(context)=> CartScreen(),
            AdminScreen.id:(context)=> AdminScreen(),
            AdminPanelScreen.id:(context)=> AdminPanelScreen(),
            ForgetPassScreen.id:(context)=> ForgetPassScreen(),
            SignInScreen.id:(context)=> SignInScreen(),
            SignUpScreen.id:(context)=> SignUpScreen(),
            // AddProduct.id:(context)=> AddProduct(),
            DeleteProduct.id:(context)=> DeleteProduct(),
            AddProductScreen.id:(context)=> AddProductScreen(),
          }
      ),
    );
  }
}
