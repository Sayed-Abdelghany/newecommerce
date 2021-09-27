import 'package:new_ecommerce/screens/HomeScreen.dart';
import 'package:new_ecommerce/screens/SignInScreen.dart';
import 'package:new_ecommerce/services/authFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var signUpKey = GlobalKey<FormState>();
  var auth = AuthClass();
  var name , email,pass,confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 980,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mv.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:ListView(
          children: [
            SizedBox(height: 80,),
            Icon(FontAwesomeIcons.ggCircle,size: 100,color: Colors.red,),
            SizedBox(height: 50,),
            Form(
              key: signUpKey,
              child: Column(
                children: [
                  customSineField('Choose your name',Icon( Icons.person), (v){name=v;}, (v){
                    if (v==null){
                      return 'Please Enter Name';
                    }
                  }, false),
                  customSineField('Enter your email',Icon( Icons.mail), (v){email=v;}, (v){
                    if(v== null){
                      return 'Please Enter Email';
                    }
                  }, false),
                  customSineField('Enter Password',Icon( Icons.lock), (v){pass=v;},
                          (v){
                        if (v==null){
                          return 'Please Enter Password';
                        }
                      }
                      , true),
                  customSineField('Confirm Password',Icon( Icons.lock), (v){confirmPass=v;},
                          (v){
                        if(v == null){
                          return 'Please Confirm Password';
                        }
                      }, true),
                  // CustomTextField(hint: ' Enter your Username',iconData: Icons.person,secure: false,
                  // onSaved: (v){
                  //   name=v;
                  // },
                  // validator: (v){
                  //   if (v==null){
                  //     return 'Please Enter Name';
                  //   }
                  // },
                  // ),
                  // SizedBox(height: 30,),
                  // CustomTextField(hint: 'Enter your Email',iconData: Icons.mail,secure: false,
                  //   onSaved: (v){
                  //   email = v;
                  //   },
                  //   validator: (v){
                  //     if (v==null){
                  //       return 'Please Enter Email';
                  //     }
                  //   },
                  // ),
                  // SizedBox(height:30),
                  // CustomTextField(hint: 'Enter Password',iconData: Icons.lock,secure: true,
                  //   onSaved: (v){
                  //   pass = v;
                  //   },
                  //   validator: (v){
                  //     if (v==null){
                  //       return 'Please Enter Password';
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 30,),
                  // CustomTextField(hint: 'Confirm Password',iconData: Icons.lock,secure: true,
                  //   onSaved: (v){
                  //   confirmPass = v;
                  //   },
                  //   validator: (v){
                  //     if (v==null){
                  //       return 'Please ReEnter Password';
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 30),
              child:InkWell(
                onTap: ()async{
                 try{
                   signUpKey.currentState!.save();
                   if(signUpKey.currentState!.validate()){
                     await  auth.signUp(email, pass);
                     auth.fireAuth.currentUser!.emailVerified;
                     Navigator.pushNamed(context, HomeScreen.id);
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                     Text('Complete Required Data'),backgroundColor:Colors.red ,));
                     print('Complete data');
                   }
                 }catch(e){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                   print(e);
                 }
                },
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text('SIGN UP',style: TextStyle(
                        color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ?',style: TextStyle(fontSize: 20,color: Colors.purple),),
                  TextButton(
                    child: Text('SIGN IN',style: TextStyle(color: Colors.grey,fontSize: 25),),
                    onPressed: (){
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  customSineField(hint,iconData,onSaved,validator,secure){
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
