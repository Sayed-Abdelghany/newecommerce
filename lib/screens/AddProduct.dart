// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class AddProduct extends StatefulWidget {
//   static String id = 'AddProduct';
//   @override
//   _AddProductState createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String ?name;
//   String ?size;
//   String ?price;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: ListView(
//         children: [
//           Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 customAddForm('Product name',(v){
//                   setState(() {
//                     name = v;
//                   });
//                 }),
//                 customAddForm('Product size',(v){
//                   setState(() {
//                     size =v;
//                   });
//                 }),
//                 customAddForm('Product product price',(v){
//                   setState(() {
//                     price=v;
//                   });
//                 }),
//
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: ()async{
//                 formKey.currentState!.save();
//                 await FirebaseFirestore.instance.collection('Products').add({
//                   'name':name,
//                   'size':size,
//                   'price':price,
//                 });
//               },
//               child: Container(
//                 color: Colors.deepPurple,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.add_box_rounded,color: Colors.white,),
//                       Text('Add Product',style: TextStyle(color: Colors.white,fontSize: 20),),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   customAddForm(label,onSaved){
//     return Padding(
//       padding:  EdgeInsets.all(15.h),
//       child: TextFormField(
//         decoration: InputDecoration(labelText: label,
//           fillColor: Colors.white,
//           filled: true,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(20.h)),
//           ),
//         ),
//         onSaved: onSaved,
//       ),
//     );
//   }
// }
