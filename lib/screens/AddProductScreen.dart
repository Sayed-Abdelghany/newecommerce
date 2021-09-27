import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
class AddProductScreen extends StatefulWidget {
  static String id = 'AddProductScreen';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  GlobalKey<FormState> adminKey = GlobalKey<FormState>();
  String ?name;
  String ?price;
  String ?desc;
  String ?size;
  String ?link;
  PickedFile ?c;
  File ?e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                showDialog(context: context, builder: (context){
                  return SimpleDialog(
                    children: [
                      SimpleDialogOption(
                        child: InkWell(
                            onTap: ()async{
                              Navigator.pop(context);
                           c =  await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                           setState(() {
                             e = File(c!.path);
                           });
                            },
                            child: Text('Pick From Gallery')),
                      ),
                      SimpleDialogOption(
                        child: InkWell(
                          onTap: ()async{
                            Navigator.pop(context);
                         c= await  ImagePicker.platform.pickImage(source: ImageSource.camera);
                          setState(() {
                            e = File(c!.path);
                          });
                          },
                            child: Text('Pick From Camera')),
                      ),
                    ],
                  );
                });
                },
                child:
                c == null?
                Container(
                  height: .35.sh,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                  ),
                  child: Center(child: Icon(Icons.add_a_photo_outlined,color: Colors.deepPurple,size: 40.sp,)),
                ):Image.file(File(c!.path),fit: BoxFit.contain,)
              ),
            ),
            Form(
              key: adminKey,
              child: Column(
                children: [
                  customAddForm('Product Name', (v){
                    setState(() {
                      name = v;
                    });
                  }),
                  customAddForm('Product Price', (v){
                    setState(() {
                      price = v;
                    });
                  }),
                  customAddForm('Product Description', (v){
                    setState(() {
                      desc = v;
                    });
                  }),
                  customAddForm('Product Size', (v){
                    setState(() {
                      size = v;
                    });
                  }),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()async{
                  adminKey.currentState!.save();
                  await FirebaseFirestore.instance.collection('Products').add({
                    'name':name,
                    'size':size,
                    'price':price,
                    'desc':desc,
                    'link':link,
                  });
                await  FirebaseStorage.instanceFor(bucket: 'gs://newecommerce-8bbe8.appspot.com').ref(c!.path).putFile(e!);
              var url =   await  FirebaseStorage.instanceFor(bucket: 'gs://newecommerce-8bbe8.appspot.com').ref(c!.path).getDownloadURL();
               print(url);
                setState(() {
                  link = url;
                });
                },
                child: Container(
                  height: 40.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 1,color: Colors.white),
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                  child: Center(child: Text('Add Product',style: TextStyle(fontSize: 20.sp,color: Colors.white),)),

                ),
              ),
            ),
          ],
        ),
    );
  }
  customAddForm(label,onSaved){
    return Padding(
      padding:  EdgeInsets.all(15.h),
      child: TextFormField(
        decoration: InputDecoration(labelText: label,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
          ),
        ),
        onSaved: onSaved,
      ),
    );
  }
}
