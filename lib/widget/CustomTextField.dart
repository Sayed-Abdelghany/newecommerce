// import 'package:flutter/material.dart';
// class CustomTextField extends StatefulWidget {
//  final String ?hint;
//  final IconData ?iconData;
//  final bool ?secure;
//  Function ?onSaved;
//  Function ?validator;
//   CustomTextField({this.hint,this.iconData,this.secure,this.onSaved,this.validator});
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child:TextFormField(
//         onSaved:(v){ widget.onSaved!;},
//         validator: (v){widget.validator!;},
//         obscureText: widget.secure!,
//         decoration: InputDecoration(
//           fillColor: Colors.white,
//           filled: true,
//           hintText: widget.hint,hintStyle: TextStyle(
//         ),
//           prefixIcon: Icon(widget.iconData),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: Colors.black,width: 1)
//           ),
//         ),
//       ),
//     );
//   }
// }