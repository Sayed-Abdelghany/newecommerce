import 'package:new_ecommerce/screens/AdminScreen.dart';
import 'package:new_ecommerce/screens/ForgetPassScreen.dart';
import 'package:new_ecommerce/screens/HomeScreen.dart';
import 'package:new_ecommerce/screens/SignUpScreen.dart';
import 'package:new_ecommerce/services/authFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignInScreen extends StatefulWidget {
  static String id = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var signInKey = GlobalKey<FormState>();
  var auth = AuthClass();
  String ?email,pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: 950,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cl.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:ListView(
          children: [
            SizedBox(height: 80,),
//            Image.asset('assets/images/eea.jpg'),
            Icon(FontAwesomeIcons.ggCircle,size: 100,color: Colors.red,),
            SizedBox(height: 100,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('User  Login',style: TextStyle(
                  color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Form(
              key: signInKey,
              child: Column(
                children: [
                  customSineInField('Enter Email', Icon(Icons.email), (v){email=v;},
                          (v){
                        if(v.toString().isEmpty){
                          return 'Please Enter Email';
                        }
                      }, false),
                  customSineInField('Enter password', Icon(Icons.lock), (v){pass=v;},
                          (v){
                        if(v.toString().isEmpty){
                          return ' Please Enter Password';
                        }
                      }, true),

                  // CustomTextField(hint: 'User Email',iconData: Icons.person,secure: false,
                  // onSaved: (v){
                  //   email = v;
                  // },
                  //   validator: (v){
                  //   if (v.toString().isEmpty){
                  //     return 'Please Enter Email';
                  //   }
                  //   },
                  // ),
                  // SizedBox(height: 20,),
                  // CustomTextField(hint: 'Password',iconData: Icons.lock,secure: true,
                  // onSaved: (v){
                  //   pass = v;
                  // },
                  //   validator: (v){
                  //   if (v.toString().isEmpty){
                  //     return 'Please Enter Password ';
                  //   }
                  //   },
                  // ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ForgetPassScreen.id);
                    },
                    child: Text('Forget Password ?',style: TextStyle(
                        color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                  )),
            ),

            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child:InkWell(
                onTap: ()async{
                  try{
                    signInKey.currentState!.save();
                    if (signInKey.currentState!.validate()){
                      await  auth.signIn(email, pass);

                      Navigator.pushNamed(context,AdminScreen.id );
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Complete Required Data'),));
                    }
                  }catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),backgroundColor: Colors.red,));
                  }

                },
                child: Container(
                  child: Center(
                    child: Text('Sign In',style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                ),
              ),

            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?',style: TextStyle(fontSize:25,color: Colors.purple)),
                TextButton(
                    child: Text('Sign Up',style: TextStyle(
                        color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      Navigator.pushNamed(context,SignUpScreen.id);
                    }
                ),
              ],
            ),
          ],
        ),
      ),


    );
  }
  customSineInField(hint,iconData,onSaved,validator,secure){
    return Padding(
      padding:  EdgeInsets.all(15.h),
      child: TextFormField(
        decoration: InputDecoration(labelText: hint,prefixIcon: iconData,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
          ),
        ),
        obscureText: secure,onSaved: onSaved,validator: validator,
      ),
    );
  }
}
